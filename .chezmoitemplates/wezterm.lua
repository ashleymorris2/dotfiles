-- Pull in the wezterm API
local wezterm = require("wezterm")

-- This will hold the configuration.
local config = wezterm.config_builder()

-- FONT SETTINGS
config.font = wezterm.font("JetBrainsMono Nerd Font")
config.font_size = 16
config.line_height = 1.3

-- WINDOW SETTINGS
config.window_background_opacity = 0.8
config.window_decorations = "RESIZE"
config.window_frame = {
 font = wezterm.font { family = 'Noto Sans', weight = 'Regular' },
}

-- MAC SPECIFIC
config.macos_window_background_blur = 10
config.native_macos_fullscreen_mode = false

-- THEME SETTINGS
config.color_scheme = 'hardhacker'

config.use_dead_keys = false

{{- if eq .chezmoi.os "darwin" -}}
	wezterm.on("update-status", function(window, pane)
	  local process_name = pane:get_foreground_process_name()

	  if process_name and process_name:match("nvim") then
	    window:set_config_overrides({
	      window_background_opacity = 1,  -- More solid when Neovim is running
	      macos_window_background_blur = 0,  -- Reduce blur when focused on Neovim
	    })
	  else
	    window:set_config_overrides({
	      window_background_opacity = 0.8,  -- Normal transparency when using other apps
	      macos_window_background_blur = 10,  -- Increase blur when not in Neovim
	    })
	  end
	end)
{{ end -}}

-- KEYS
-- ADD KEYS

return config
