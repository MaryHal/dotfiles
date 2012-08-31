import XMonad

import XMonad.Hooks.DynamicLog
import XMonad.Hooks.ManageHelpers
import XMonad.Hooks.ManageDocks
import XMonad.Hooks.SetWMName
import XMonad.Hooks.UrgencyHook

import XMonad.Layout
import XMonad.Layout.ResizableTile
--import XMonad.Layout.LayoutHints

import XMonad.Actions.SwapWorkspaces

import XMonad.Util.EZConfig
import XMonad.Util.Run(spawnPipe)
import XMonad.Util.NamedScratchpad

import qualified Data.Map as M
import qualified XMonad.StackSet as W

import Dzen
import Utils

import System.IO
import Graphics.X11.ExtraTypes.XF86

-------------------------------------------------------------------------------
-- Main
--
main = do
    -- could be: d <- spawnPipe "dzen2 -options"
    d <- spawnDzen myLeftBar
    spawnToDzen "conky -c ~/.xmonad/dzenConky" myRightBar

    --xmonad $ withUrgencyHook NoUrgencyHook $ defaultConfig
    xmonad $ withUrgencyHook NoUrgencyHook $ defaultConfig
        { startupHook        = setWMName "LG3D"
        , modMask            = mod4Mask
        , terminal           = myTerminal
        , borderWidth        = myBorderWidth
        , normalBorderColor  = myNormalBorderColor
        , focusedBorderColor = myFocusedBorderColor

        , logHook            = myLogHook d

        , workspaces         = myWorkspaces
        , manageHook         = myManageHook
        , layoutHook         = myLayout
        } `additionalKeys` addKeys

------------------------------------------------------------------------
-- Options and Theme
--
myModMask            = mod4Mask

myTerminal           = "urxvtc"
myBorderWidth        = 2

myWorkspaces = ["un", "deux", "trois", "quatre", "cinq", "six", "sept", "huit", "neuf"]

myFont = "DroidSans:bold:size=8"
--myFont = "-*-Terminus-medium-r-normal-*-12-*-*-*-*-*-iso8859-2"

myNormalBorderColor  = "#3f3f3f"
myFocusedBorderColor = "#7f9f7f"

colorNormal  = "#dcdccc"         -- foreground
colorBG      = "#1f1f1f"         -- background
colorBG2     = "#1f1f1f"         -- selected background
colorFG      = "#7a9a7a"         -- selected foreground

------------------------------------------------------------------------
-- Bars and Helpers
--
makeDmenu p = "dmenu_run" ++
              " -fn '" ++ myFont      ++ "'" ++
              " -nf '" ++ colorNormal ++ "'" ++
              " -nb '" ++ colorBG     ++ "'" ++
              " -sf '" ++ colorFG     ++ "'" ++
              " -sb '" ++ colorBG2    ++ "'" ++
              " -p  '" ++ p           ++ "'"

dmenuCmd  = makeDmenu "Run:"
barMetric = 30

myLeftBar :: DzenConf
myLeftBar = defaultDzen
    { barwidth = Just $ Percent barMetric
    , barheight= Just 16
    , fg_color = Just colorNormal
    , bg_color = Just colorBG
    , barfont  = Just myFont
    }

myRightBar :: DzenConf
myRightBar = myLeftBar
    { x_position = barwidth myLeftBar
    , barwidth   = Just $ Percent (100 - barMetric)
    , alignment  = Just RightAlign
    }

------------------------------------------------------------------------
-- Scratchpads
--
centerScreen :: Rational -> Rational -> ManageHook
centerScreen w h = doRectFloat $ W.RationalRect ((1 - w) / 2) ((1 - h) / 2) w h

dockBottomRight :: Rational -> Rational -> ManageHook
dockBottomRight w h = doRectFloat $ W.RationalRect (1 - w) (1 - h) w h

myScratchPads = [ NS "terminal" spawnTerm  findTerm  manageTerm
                , NS "music"    spawnMusic findMusic manageMusic
                ]
    where
        spawnTerm  = myTerminal ++ " -name scratchPad"
        findTerm   = resource =? "scratchPad"
        manageTerm = dockBottomRight 0.35 0.25

        spawnMusic  = myTerminal ++ " -name ncmpcpp -e ncmpcpp"
        findMusic   = resource =? "ncmpcpp"
        manageMusic = centerScreen 0.6 0.6

------------------------------------------------------------------------
-- Layouts
--
myLayout = --layoutHintsToCenter $
           avoidStruts
           $ tiled ||| Full
    where
        tiled = ResizableTall 1 (3/100) (1/2) []

------------------------------------------------------------------------
-- Window Rules
--
myManageHook :: ManageHook
myManageHook = mainManageHook <+> namedScratchpadManageHook myScratchPads
    where
        mainManageHook = composeAll $ concat
            [ [isFullscreen        --> doFullFloat]
            , [isDialog            --> doCenterFloat]
            , [className =? c      --> doFloat | c <- myFloats]
            , [title =? t          --> doFloat | t <- myOtherFloats]
            , [title =? center     --> doCenterFloat | center <- myCenterFloats]
            ]
        myFloats       = [ "wine"
                         , "MPlayer"
                         --, "Gimp"
                         , "Snes9x-gtk"
                         , "Gvbam"
                         , "Skype"
                         , "org-igoweb-cgoban-CGoban"
                         ]

        myCenterFloats = [ "xmessage"
                         , "zenity"
                         , "xfontsel"
                         ]

        myOtherFloats  = [ "Downloads"
                         , "Firefox Preferences"
                         , "Save As..."
                         , "Send file"
                         , "Open"
                         , "File Transfers"
                         ]

------------------------------------------------------------------------
-- Key Bindings
--
addKeys :: [((ButtonMask, KeySym), X())]
addKeys =
    [ ((mod4Mask          , xK_p ), spawn dmenuCmd)
    , ((mod4Mask          , xK_n ), spawn "~/bin/menu/menumenu")
    , ((mod4Mask          , xK_o ), spawn "~/bin/menu/mpcmenu")
    , ((mod4Mask          , xK_r ), spawn "feh --bg-fill $(find /home/sanford/shared/wallpapers/current -type f | shuf -n1)")
    , ((mod4Mask          , xK_s ), spawn "~/bin/menu/shutdownmenu")
    , ((mod4Mask          , xK_v ), spawn "urxvt -e alsamixer")

    -- Scratchpad keys
    , ((mod4Mask          , xK_u ), namedScratchpadAction myScratchPads "terminal")
    , ((mod4Mask          , xK_m ), namedScratchpadAction myScratchPads "music")

    , ((0          , xF86XK_PowerOff), spawn "~/bin/menu/shutdownmenu")
    , ((mod4Mask              , xK_q), spawn "")
    , ((mod4Mask .|. shiftMask, xK_q), cleanStart)
    --, ((mod4Mask .|. shiftMask, xK_q), spawn "xmonad --recompile; xmonad --restart")

    -- Multimedia keys
    , ((0             , xF86XK_AudioPrev), spawn "mpc prev -q")
    , ((0             , xF86XK_AudioNext), spawn "mpc next -q")
    , ((0             , xF86XK_AudioPlay), spawn "mpc toggle -q")
    , ((0             , xF86XK_AudioStop), spawn "mpc stop -q")

    -- Volume
    , ((0             , xF86XK_AudioLowerVolume), spawn "amixer -q set 'Master' '1-'")
    , ((0             , xF86XK_AudioRaiseVolume), spawn "amixer -q set 'Master' '1+'")
    , ((0             , xF86XK_AudioMute)       , spawn "amixer -q set 'Master' 'toggle'")

    , ((mod4Mask          , xK_Down) , spawn "amixer -q set 'Master' '1-'")
    , ((mod4Mask          , xK_Up)   , spawn "amixer -q set 'Master' '1+'")
    , ((mod4Mask .|. controlMask , xK_Down) , spawn "amixer -q set 'Speaker' '1-'")
    , ((mod4Mask .|. controlMask , xK_Up)   , spawn "amixer -q set 'Speaker' '1+'")

    -- Other Keys
    , ((mod4Mask                  , xK_Print), spawn "scrot -e 'mv $f ~/tmp/'")
    , ((mod4Mask .|. controlMask  , xK_Print), spawn "sleep 0.2 ; scrot -s -e 'mv $f ~/tmp/'")

    -- Brightness
    , ((mod4Mask          , xK_i)   , spawn "~/bin/menu/brightnessmenu")
    , ((mod4Mask          , xK_Left) , spawn "xbacklight -dec 10")
    , ((mod4Mask          , xK_Right), spawn "xbacklight -inc 10")
    ]
    ++
    -- Un-greedy view
    [((m .|. mod4Mask, k), windows $ f i)
         | (i, k) <- zip myWorkspaces [xK_1 .. xK_9]
         , (f, m) <- [(W.view, 0), (W.shift, shiftMask)]]
    ++
    -- Swapping workspaces
    [((mod4Mask .|. controlMask, k), windows $ swapWithCurrent i)
        | (i, k) <- zip myWorkspaces [xK_1 ..]]

------------------------------------------------------------------------
-- Logging/Status Bar
--
myLogHook h = dynamicLogWithPP $ defaultPP
            { ppCurrent = dzenColor colorFG colorBG2
            --, ppHidden  = dzenColor colorNormal colorBG
            , ppVisible = dzenColor colorFG colorBG2
            , ppUrgent  = dzenColor colorBG colorNormal . dzenStrip

            , ppLayout  = dzenColor colorFG "" . layoutNames
            , ppTitle   = dzenColor colorNormal "" . shorten 50

            , ppSep     = " | "
            , ppWsSep   = " "
            , ppOutput  = hPutStrLn h
            , ppOrder   = \(ws:l:_:_) -> [ws,l]
            , ppSort    = fmap (namedScratchpadFilterOutWorkspace.) (ppSort defaultPP) -- hide "NSP" from workspace list
            }
        where
        layoutNames x
            {-
            | x == "Tall" = "Tall^p(4)^i(/home/sanford/.xmonad/bitmaps/tall.xbm)"
            | x == "Grid" = "Grid^p(4)^i(/home/sanford/.xmonad/bitmaps/grid.xbm)"
            | x == "Full" = "Full^p(4)^i(/home/sanford/.xmonad/bitmaps/full.xbm)"
            -}
            | otherwise   = x
