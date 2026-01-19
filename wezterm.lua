-- wezterm.lua - Cấu hình hoàn chỉnh cho WezTerm trên Windows

-- Nạp thư viện của WezTerm
local wezterm = require 'wezterm'
-- Tạo một đối tượng config để tùy chỉnh
local config = wezterm.config_builder()

--================================================================
-- GIAO DIỆN (APPEARANCE)
--================================================================

config.color_scheme = 'Tokyo Night'
config.window_background_opacity = 0.95
-- config.window_decorations = "RESIZE" -- Vô hiệu hóa để dùng thanh tiêu đề mặc định
config.window_padding = {
  left = 10,
  right = 10,
  top = 10,
  bottom = 5,
}

--================================================================
-- FONT CHỮ
--================================================================

config.font = wezterm.font_with_fallback {
  { family = 'JetBrains Mono', weight = 'Medium' },
  'FiraCode Nerd Font',
  'Segoe UI',  -- Supports Vietnamese characters well
  'Consolas',
}
config.font_size = 14.0
config.harfbuzz_features = { 'calt=1', 'clig=1', 'liga=1' }

--================================================================
-- THANH TAB (TAB BAR)
--================================================================

config.hide_tab_bar_if_only_one_tab = true
config.tab_bar_at_bottom = true
config.use_fancy_tab_bar = false
config.colors = {
  tab_bar = {
    background = '#1a1b26',
    active_tab = {
      bg_color = '#7aa2f7',
      fg_color = '#1a1b26',
      intensity = 'Bold',
    },
    inactive_tab = {
      bg_color = '#292e42',
      fg_color = '#545c7e',
    },
  },
}

--================================================================
-- PHÍM TẮT (KEYBINDINGS) - ĐÃ SỬA CHO WINDOWS (DÙNG CTRL)
--================================================================
config.keys = {
  -- HIỆN BẢNG TRA CỨU PHÍM TẮT (CHEATSHEET)
  -- Nhấn F1 để mở Launcher và hiển thị danh sách phím tắt
  {
    key = 'F1',
    mods = 'NONE',
    action = wezterm.action.ShowLauncherArgs {
      flags = 'KEY_ASSIGNMENTS',
    },
  },
  -- Hoặc dùng Ctrl + Shift + ?
  {
    key = '?',
    mods = 'CTRL|SHIFT',
    action = wezterm.action.ShowLauncherArgs {
      flags = 'KEY_ASSIGNMENTS',
    },
  },

  -- Copy, Paste, không có cut vì nó giống như Copy, không có Select All
  { key = 'c', mods = 'CTRL|SHIFT', action = wezterm.action.CopyTo 'Clipboard' },
  { key = 'v', mods = 'CTRL|SHIFT', action = wezterm.action.PasteFrom 'Clipboard' },
  --{ key = 'a', mods = 'CTRL', action = wezterm.action.SelectAll },

  -- Quản lý khung (Pane)
  { key = 'd', mods = 'CTRL', action = wezterm.action.SplitHorizontal { domain = 'CurrentPaneDomain' } },
  { key = 'd', mods = 'CTRL|SHIFT', action = wezterm.action.SplitVertical { domain = 'CurrentPaneDomain' } },
  { key = 'w', mods = 'CTRL', action = wezterm.action.CloseCurrentPane { confirm = true } },

  -- Quản lý Tab
  { key = 't', mods = 'CTRL', action = wezterm.action.SpawnTab 'CurrentPaneDomain' },
  { key = 'w', mods = 'CTRL|SHIFT', action = wezterm.action.CloseCurrentTab { confirm = true } },
  
  -- Điều hướng giữa các khung
  { key = 'LeftArrow',  mods = 'CTRL', action = wezterm.action.ActivatePaneDirection 'Left' },
  { key = 'RightArrow', mods = 'CTRL', action = wezterm.action.ActivatePaneDirection 'Right' },
  { key = 'UpArrow',    mods = 'CTRL', action = wezterm.action.ActivatePaneDirection 'Up' },
  { key = 'DownArrow',  mods = 'CTRL', action = wezterm.action.ActivatePaneDirection 'Down' },


  -- MỞ FILE CHEATSHEET.HTML BẰNG TRÌNH DUYỆT
  {
    key = 'p',
    mods = 'CTRL|SHIFT',
    action = wezterm.action.SpawnCommandInNewWindow {
      -- Lưu ý: Bạn vẫn cần tạo file cheatsheet.html như hướng dẫn cũ
      args = { 'C:\\Program Files\\Google\\Chrome\\Application\\chrome.exe', wezterm.home_dir .. '\\.config\\wezterm\\cheetsheet.html' },
    },
  },
  
  -- Xóa màn hình và bộ đệm cuộn
  { key = 'k', mods = 'CTRL', action = wezterm.action.ClearScrollback 'ScrollbackAndViewport' },
}

--================================================================
-- CÁC TÙY CHỈNH KHÁC
--================================================================

config.mouse_bindings = {
  {
    event = { Down = { streak = 1, button = 'Right' } },
    mods = 'NONE',
    action = wezterm.action.PasteFrom 'Clipboard',
  },
}
config.max_fps = 80
config.animation_fps = 80
config.cursor_blink_rate = 500
config.audible_bell = 'Disabled'
config.scrollback_lines = 10000
-- config.default_cwd = 'C:\\Users\\Admin\\Projects'
-- config.default_prog = { 'powershell.exe' }

--================================================================
-- Trả về đối tượng config để WezTerm áp dụng
--================================================================
return config
