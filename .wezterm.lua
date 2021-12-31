local wezterm = require 'wezterm';
return {
  use_ime = true,
  font_size = 16.0,
  font_antialias = "Subpixel",
  font_hinting = "Full",
  font = wezterm.font_with_fallback({
      "JetBrainsMono Nerd Font",
  }),
  color_scheme = "Batman",
  keys = {
    {key = "f", mods = "CTRL|SUPER", action = "ToggleFullScreen"},
    {key = "=", mods = "CTRL", action = wezterm.action{SplitVertical = {domain = "CurrentPaneDomain"}}},
    {key = "-", mods = "CTRL", action = wezterm.action{SplitHorizontal = {domain = "CurrentPaneDomain"}}},
    {
      key = "h",
      mods = "CTRL|SHIFT",
      action = wezterm.action {ActivatePaneDirection = "Left"}
    }, {
      key = "l",
      mods = "CTRL|SHIFT",
      action = wezterm.action {ActivatePaneDirection = "Right"}
    },
    {
      key = "k",
      mods = "CTRL|SHIFT",
      action = wezterm.action {ActivatePaneDirection = "Up"}
    }, {
      key = "j",
      mods = "CTRL|SHIFT",
      action = wezterm.action {ActivatePaneDirection = "Down"}
    }
  }
}