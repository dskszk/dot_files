import XMonad
import XMonad.Hooks.DynamicLog
import XMonad.Hooks.FadeInactive
import XMonad.Layout.Spiral
import XMonad.Layout.Decoration
import XMonad.Layout.Spacing
import XMonad.Layout.Renamed

myLogHook :: X ()
myLogHook = fadeInactiveLogHook 0.75

myDeco l = decoration shrinkText defaultTheme DefaultDecoration $ spacing 4 l

myLayoutHook = sp ||| Mirror sp ||| Full
  where
    sp = renamed [Replace "Decorated Spiral"] $ myDeco $ spiral (9 / 16)

main :: IO()
main = xmonad =<< xmobar defaultConfig {
      terminal = "gnome-terminal"
    , logHook = myLogHook
    , layoutHook = myLayoutHook
}

