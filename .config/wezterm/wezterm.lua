-- Import the wezterm module
local wezterm = require 'wezterm'
-- Creates a config object which we will be adding our config to
local config = wezterm.config_builder()

-- (This is where our config will go)

-- Returns our config to be evaluated. We must always do this at the bottom of this file
-- Pick a colour scheme. WezTerm ships with more than 1,000!
-- Find them here: https://wezfurlong.org/wezterm/colorschemes/index.html
config.color_scheme = 'Tokyo Night'

-- Slightly transparent and blurred background
config.window_background_opacity = 0.9
config.macos_window_background_blur = 30
-- Removes the title bar, leaving only the tab bar. Keeps
-- the ability to resize by dragging the window's edges.
-- On macOS, 'RESIZE|INTEGRATED_BUTTONS' also looks nice if
-- you want to keep the window controls visible and integrate
-- them into the tab bar.
config.window_decorations = 'RESIZE'
-- Sets the font for the window frame (tab bar)
config.window_frame = {
  -- Berkeley Mono for me again, though an idea could be to try a
  -- serif font here instead of monospace for a nicer look?
  font = wezterm.font({ family = 'Berkeley Mono', weight = 'Bold' }),
  font_size = 15,
}

wezterm.on('update-status', function(window)
    -- Grab the utf8 character for the "powerline" left facing
    -- solid arrow.
    local SOLID_LEFT_ARROW = utf8.char(0xe0b2)

    -- Grab the current window's configuration, and from it the
    -- palette (this is the combination of your chosen colour scheme
    -- including any overrides).
    local color_scheme = window:effective_config().resolved_palette
    local bg = color_scheme.background
    local fg = color_scheme.foreground

    window:set_right_status(wezterm.format({
      -- First, we draw the arrow...
      { Background = { Color = 'none' } },
      { Foreground = { Color = bg } },
      { Text = SOLID_LEFT_ARROW },
      -- Then we draw our text
      { Background = { Color = bg } },
      { Foreground = { Color = fg } },
      { Text = ' ' .. wezterm.hostname() .. ' ' },
    }))
  end)



config.font_size = 15

return config