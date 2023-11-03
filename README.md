# My custom Arch Linux dotfiles. 
### Includes configs for:
- WMs:
  - i3-gaps 
  - sway
- polybar
- waybar
- rofi
- wofi
- st
- kitty
- alacritty
- zsh
- fish
- starship
- neovim
- swaync

This is my personal setup. If you want to use it you can of course do that but I don't take any responsibility if anything bad happens(it shouldn't tho).

## "Dependencies" (You'll have to check how to install them on your distro):  
- betterlockscreen(Obvious I guess)  
- swaylock(for screen locking on wayland)
- For status bar:
    - lm_sensors (for CPU temperature in the status bar)
    - Ubuntu font family (polybar general font)
    - Font Awesome 6 Free (icons in the polybar)
    - Font Awesome 6 Brands (tux logo in the polybar)
    - [waybar-updates](https://github.com/L11R/waybar-updates) (for archlinux updates counter in waybar)
- rofi (applications launcher for i3)
- wofi (applications launcher for sway)
- For terminal
    - [shell-color-scripts](https://gitlab.com/dwt1/shell-color-scripts) (for cool looking terminal)  
    - fish (shell)
        - starship prompt
    - zsh (shell)      
        - oh-my-zsh (zsh framework)
            - starhip prompt
            - zsh-autosuggestions (for suggestions when you're typing in the terminal)
            - zsh-syntax-highlighting (for syntax highlighting when you're typing in the terminal)
- neovim (my text editor)
    - packer (plugins manager for neovim)
    - lua (for the whole config)
    - clangd (c++ language server)
    - lua-language-server
    - ripgrep (for live grep in telescope)
    - llvm and lldb (for C/C++/Rust DAP)
    - cmake (for cmake integration)
    - nerdfonts (icons needed for barbar)
- nitrogen (for i3 wallpaper)
- swaybg (for sway wallpaper)
- hyprpaper (for hyprland wallpaper)
- swayidle (for idle actions)
- maim (X screenshot utility)
- xclip (for copying selected screenshot area to the clipboard - X only)
- slurp (for selecting an area of desktop)
- grim (for taking a wayland screenshot)
- wl-copy (for copying the screen shot to a clipboard - Wayland only)
- playerctl (for manipulation media flow(pause, play etc.))
- [qt-powermenu](https://github.com/k0ss4/qt-powermenu) (my custom power menu)
- swaync (notification system for wayland)

I hope I did not forget about something. You will probably have to adjust my polybar/xmobar scripts for example:  
- the gputemp script searches for "edge" in sensors,  
- the cputemp script searches for "Tctl" in sensors,  
- the updates script is written for arch-based distros specifically(and for paru as an aur helper),  
- the network module in polybar is set to enp42s0 interface  
- the volume module in polybar is written for pipewire

You can probably remove the power script since it is connecting with my local homeassistant instance and grabbing the output from there.

# Screenshots:  
## Neovim
![neovim-alpha](https://i.imgur.com/5XT76yn.png)
![lsp and coq](https://i.imgur.com/u8iRjQ0.png)
![dap and dapui](https://i.imgur.com/pRdPV6i.png)
![telescope-keymaps](https://i.imgur.com/jbbKWyE.png)

## Hyprland
![screenshot1](https://i.imgur.com/1YsRzYV.png)
![screenshot2](https://i.imgur.com/Chk3OKC.png)

## i3-gaps
![screenshot of display 1](https://i.imgur.com/Ykif8Kt.png)
![screenshot of display 0](https://i.imgur.com/EzR77I8.png)

## sway
![screenshot 1](https://i.imgur.com/yeU7kML.png)
![screenshot 2 with neovim](https://i.imgur.com/e4kOKP3.png)
