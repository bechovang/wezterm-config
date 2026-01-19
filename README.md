lưu ở : C:\Users\Admin\.config\wezterm\wezterm.lua

# Cài đặt và Cấu hình WezTerm Nâng cao cho Windows

Đây là một bộ cấu hình hoàn chỉnh cho WezTerm, được tối ưu hóa cho người dùng Windows, mang lại một giao diện đẹp mắt, các phím tắt tiện lợi và một hệ thống "cheatsheet" (bảng tra cứu) tích hợp.

![wezterm-preview](https://user-images.githubusercontent.com/example/wezterm.png) <!-- Bạn có thể thay thế link này bằng ảnh chụp màn hình của bạn -->

## Mục lục
1.  [Tính năng Nổi bật](#tính-năng-nổi-bật)
2.  [Yêu cầu Cần có](#yêu-cầu-cần-có)
3.  [Hướng dẫn Cài đặt Chi tiết](#hướng-dẫn-cài-đặt-chi-tiết)
    -   [Bước 1: Cài đặt WezTerm](#bước-1-cài-đặt-wezterm)
    -   [Bước 2: Cài đặt Font chữ](#bước-2-cài-đặt-font-chữ)
    -   [Bước 3: Tạo Thư mục và File Cấu hình](#bước-3-tạo-thư-mục-và-file-cấu-hình)
    -   [Bước 4: (QUAN TRỌNG) Tùy chỉnh Cấu hình cho Máy của Bạn](#bước-4-quan-trọng-tùy-chỉnh-cấu-hình-cho-máy-của-bạn)
    -   [Bước 5: Tạo File Cheatsheet](#bước-5-tạo-file-cheatsheet)
4.  [Cách Sử dụng và các Phím tắt chính](#cách-sử-dụng-và-các-phím-tắt-chính)

## Tính năng Nổi bật
-   **Giao diện Hiện đại:** Sử dụng theme `Tokyo Night` với nền hơi trong suốt.
-   **Font chữ Lập trình:** Cấu hình sẵn `JetBrains Mono` và `FiraCode Nerd Font` với ligature (nối chữ).
-   **Thanh Tab ở Dưới:** Di chuyển thanh tab xuống dưới màn hình cho không gian làm việc thoáng hơn.
-   **Phím tắt Tối ưu cho Windows:** Tất cả các phím tắt chính đều sử dụng phím `CTRL` thay vì `ALT`, quen thuộc hơn với người dùng Windows.
-   **Cheatsheet Tích hợp:** Mở một bảng tra cứu phím tắt cá nhân bằng trình duyệt chỉ với một phím tắt (`CTRL + SHIFT + P`).

## Yêu cầu Cần có
1.  **Hệ điều hành:** Windows 10 hoặc Windows 11.
2.  **Font chữ:** Đã cài đặt font **JetBrains Mono Nerd Font** (khuyến khích) hoặc một Nerd Font bất kỳ. Bạn có thể tải tại [Nerd Fonts website](https://www.nerdfonts.com/font-downloads).
3.  **Trình duyệt:** Google Chrome hoặc một trình duyệt khác (bạn sẽ cần biết đường dẫn đến file `.exe` của nó).

## Hướng dẫn Cài đặt Chi tiết

Hãy làm theo từng bước dưới đây để có một trải nghiệm hoàn hảo.

### Bước 1: Cài đặt WezTerm
-   Truy cập trang [**phát hành chính thức của WezTerm**](https://github.com/wez/wezterm/releases).
-   Tải về file cài đặt cho Windows (thường có tên `WezTerm-*.exe`).
-   Chạy file `.exe` để cài đặt.

### Bước 2: Cài đặt Font chữ
-   Nếu bạn chưa có, hãy tải về font **JetBrains Mono Nerd Font** từ [link này](https://github.com/ryanoasis/nerd-fonts/releases/download/v3.2.1/JetBrainsMono.zip).
-   Giải nén file `.zip`.
-   Chọn tất cả các file font (`.ttf`), nhấp chuột phải và chọn **Install** hoặc **Install for all users**.

### Bước 3: Tạo Thư mục và File Cấu hình
WezTerm tìm kiếm file cấu hình ở một vị trí cụ thể trong thư mục người dùng của bạn.

1.  **Mở Command Prompt hoặc PowerShell** và chạy lệnh sau để tạo thư mục cần thiết:
    ```cmd
    mkdir %USERPROFILE%\.config\wezterm
    ```
2.  Trong thư mục vừa tạo, hãy tạo một file mới tên là `wezterm.lua`.
3.  Mở file `wezterm.lua` bằng bất kỳ trình soạn thảo văn bản nào (như Notepad, VS Code,...) và dán toàn bộ nội dung dưới đây vào:

<details>
<summary>Nhấn vào đây để xem và sao chép mã nguồn wezterm.lua</summary>

```lua
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
  {
    key = 'F1',
    mods = 'NONE',
    action = wezterm.action.ShowLauncherArgs {
      flags = 'KEY_ASSIGNMENTS',
    },
  },
  
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
      -- !!! LƯU Ý: BẠN CẦN CHỈNH SỬA DÒNG 'args' BÊN DƯỚI CHO MÁY CỦA BẠN !!!
      -- Xem hướng dẫn ở Bước 4 trong file README.md
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
config.scrollback_lines = 10000

--================================================================
-- Trả về đối tượng config để WezTerm áp dụng
--================================================================
return config

```

</details>

### Bước 4: (QUAN TRỌNG) Tùy chỉnh Cấu hình cho Máy của Bạn

Phím tắt `CTRL + SHIFT + P` được thiết kế để mở một file `cheatsheet.html` bằng trình duyệt của bạn. Tuy nhiên, đường dẫn đến trình duyệt có thể khác nhau trên mỗi máy.

1.  **Mở lại file `wezterm.lua`** của bạn.
2.  Tìm đến dòng sau:
    ```lua
    args = { 'C:\\Program Files\\Google\\Chrome\\Application\\chrome.exe', wezterm.home_dir .. '\\.config\\wezterm\\cheetsheet.html' },
    ```
3.  Dòng này có 2 phần:
    -   `'C:\\Program Files\\Google\\Chrome\\Application\\chrome.exe'`: Đây là đường dẫn đến trình duyệt.
    -   `wezterm.home_dir .. '\\.config\\wezterm\\cheetsheet.html'`: Đây là đường dẫn đến file cheatsheet, **bạn không cần thay đổi phần này**.

4.  **Cách tìm đường dẫn trình duyệt của bạn:**
    -   Tìm shortcut của trình duyệt (ví dụ Google Chrome) trên Desktop hoặc Start Menu.
    -   Nhấp chuột phải vào shortcut và chọn **Properties**.
    -   Trong tab **Shortcut**, copy toàn bộ nội dung trong ô **Target**.
    -   **Ví dụ:** ` "C:\Program Files\Google\Chrome\Application\chrome.exe" `
    
5.  **Cập nhật file cấu hình:**
    -   Dán đường dẫn bạn vừa copy vào phần đầu tiên của dòng `args`.
    -   **Quan trọng:** Trong Lua, bạn phải **thay thế mỗi dấu `\` bằng hai dấu `\\`**.
    -   **Ví dụ sau khi sửa:**
        ```lua
        -- Dành cho Google Chrome (mặc định)
        args = { 'C:\\Program Files\\Google\\Chrome\\Application\\chrome.exe', ... },

        -- Dành cho Microsoft Edge
        -- args = { 'C:\\Program Files (x86)\\Microsoft\\Edge\\Application\\msedge.exe', ... },
        
        -- Dành cho Firefox
        -- args = { 'C:\\Program Files\\Mozilla Firefox\\firefox.exe', ... },
        ```


## Cách Sử dụng và các Phím tắt chính
-   **Khởi động WezTerm:** Nó sẽ tự động đọc file `wezterm.lua` và áp dụng tất cả các cấu hình.
-   **Tải lại cấu hình:** Nếu bạn chỉnh sửa file `wezterm.lua` trong lúc WezTerm đang chạy, nó sẽ tự động tải lại cấu hình mới.

| Phím tắt | Hành động |
| :--- | :--- |
| `F1` | Hiện danh sách tất cả phím tắt của WezTerm (Launcher) |
| `CTRL + SHIFT + P` | Mở lại file Cheatsheet này |
| `CTRL + T` | Mở Tab mới |
| `CTRL + SHIFT + W` | Đóng Tab hiện tại |
| `CTRL + D` | Chia đôi khung theo chiều ngang |
| `CTRL + SHIFT + D` | Chia đôi khung theo chiều dọc |
| `CTRL + W` | Đóng khung (Pane) hiện tại |
| `CTRL + Mũi tên` | Di chuyển giữa các khung |
| `CTRL + K` | Xóa màn hình và lịch sử cuộn |
| `Chuột phải` | Dán từ Clipboard |

---

Chúc mừng! Bạn đã hoàn tất việc cài đặt. Hãy tận hưởng terminal mới của mình
