local wezterm = require("wezterm")
local act = wezterm.action

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
  check_for_updates = false,
  show_update_window = false,

  font = wezterm.font_with_fallback({
    "JetBrainsMono Nerd Font",
  }),
  -- https://github.com/mbadolato/iTerm2-Color-Schemes
  -- color_scheme = "Doom Peacock",
  color_scheme = "Batman",
  keys = {
    { key = "q", mods = "CTRL", action = act({ CloseCurrentTab = { confirm = true } }) },
    { key = "h", mods = "ALT", action = act({ ActivateTabRelative = -1 }) },
    { key = "l", mods = "ALT", action = act({ ActivateTabRelative = 1 }) },
    { key = "h", mods = "ALT|CTRL", action = act({ MoveTabRelative = -1 }) },
    { key = "l", mods = "ALT|CTRL", action = act({ MoveTabRelative = 1 }) },
    { key = "1", mods = "ALT", action = act({ ActivateTab = 0 }) },
    { key = "2", mods = "ALT", action = act({ ActivateTab = 1 }) },
    { key = "3", mods = "ALT", action = act({ ActivateTab = 2 }) },
    { key = "4", mods = "ALT", action = act({ ActivateTab = 3 }) },
    { key = "5", mods = "ALT", action = act({ ActivateTab = 4 }) },
    { key = "6", mods = "ALT", action = act({ ActivateTab = 5 }) },
    { key = "7", mods = "ALT", action = act({ ActivateTab = 6 }) },
    { key = "8", mods = "ALT", action = act({ ActivateTab = 7 }) },
    { key = "9", mods = "ALT", action = act({ ActivateTab = 8 }) },

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
