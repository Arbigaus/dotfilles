-- Pull in the wezterm API
local wezterm = require 'wezterm'

-- This will hold the configuration.
local config = wezterm.config_builder()

-- System configuration
config.window_close_confirmation = 'NeverPrompt'

config = {
  -- Font configuration
  font = wezterm.font('JetBrainsMono Nerd Font'),
  font_size = 14.0,
  color_scheme = 'Gruvbox Dark (Gogh)',

  -- Window configuration
  enable_tab_bar = false,
  window_background_opacity = 0.9,
  macos_window_background_blur = 20,
  window_decorations = "RESIZE",
  use_resize_increments = true,
  initial_cols = 120,
  initial_rows = 35
}

return config
