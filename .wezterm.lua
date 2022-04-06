local wezterm = require("wezterm")

wezterm.on("update-right-status", function(window, pane)
  -- "Wed Mar 3 08:14"
  local date = wezterm.strftime("%a %b %-d %H:%M ")

  window:set_right_status(wezterm.format({
    { Text = wezterm.nerdfonts.mdi_clock .. " " .. date },
  }))
end)

return {
  use_ime = true,
  font_size = 16.0,
  font_antialias = "Subpixel",
  font_hinting = "Full",
  font = wezterm.font_with_fallback({
    "JetBrainsMono Nerd Font",
  }),
  -- https://github.com/mbadolato/iTerm2-Color-Schemes
  color_scheme = "Doom Peacock",
  keys = {
    { key = "f", mods = "CTRL|SUPER", action = "ToggleFullScreen" },
    { key = "=", mods = "CTRL", action = wezterm.action({ SplitVertical = { domain = "CurrentPaneDomain" } }) },
    { key = "-", mods = "CTRL", action = wezterm.action({ SplitHorizontal = { domain = "CurrentPaneDomain" } }) },
    {
      key = "h",
      mods = "CTRL|SHIFT",
      action = wezterm.action({ ActivatePaneDirection = "Left" }),
    },
    {
      key = "l",
      mods = "CTRL|SHIFT",
      action = wezterm.action({ ActivatePaneDirection = "Right" }),
    },
    {
      key = "k",
      mods = "CTRL|SHIFT",
      action = wezterm.action({ ActivatePaneDirection = "Up" }),
    },
    {
      key = "j",
      mods = "CTRL|SHIFT",
      action = wezterm.action({ ActivatePaneDirection = "Down" }),
    },
  },
}
