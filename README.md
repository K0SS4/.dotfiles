# My custom Arch Linux dotfiles. i3gaps and Polybar

This is my personal setup. If you want to use it you can of course do that but I don't take any responsibility if anything bad happens(it shouldn't tho).

## Needed dependencies (You'll have to check how to install them on your distro):  
- i3gaps(The WM I'm using)  
- polybar (The bar)  
    - lm_sensors (for CPU temperature in the status bar)
    - Ubuntu font family (polybar general font)
    - Font Awesome 5 Free (icons in the polybar)
    - Font Awesome 5 Brands (tux logo in the polybar)
- rofi (applications launcher)  
- alacritty (my terminal)
    - shell-color-scripts (for cool looking terminal. You can grab it from [here](https://gitlab.com/dwt1/shell-color-scripts) )  
    - zsh (shell)      
        - oh-my-zsh (zsh framework)
            - starhip prompt (the zsh prompt)
            - zsh-autosuggestions (for suggestions when you're typing in the terminal)
            - zsh-syntax-highlighting (for syntax highlighting when you're typing in the terminal)
- neovim (my text editor)
    - vim-plug (plugins manager for neovim)
- nitrogen (for wallpaper)
- maim (screenshot utility)
- xclip (for copying selected screenshot area to the clipboard)

#### Autostart
- network-manager-applet(network manager icon in the systray)
- xfce4-clipman-plugin (clipboard manager)
- picom (compositor)
- lxsession (polkit)
- nvidia-settings -l (load my nvidia config)

I hope I did not forget about something. You will probably have to adjust my polybar scripts for example:  
- the kernel script is written for zen kernel specifically,  
- the gputemp script is written for nvidia-smi,  
- the cputemp script should be fine but idk,  
- the updates script is written for arch specifically(and for paru as an aur helper),  
- the network "module" in polybar is set to enp24s0 interface  

You can probably remove the power script since it is connecting with my local smart socket and grabbing the output from there.

Screenshots:  
![screenshot of display 1](https://i.imgur.com/zKEMvzn.png)
![screenshot of display 0](https://i.imgur.com/UMXNepG.png)

Alternatively you can grab my qtile, awesomewm or xmonad setup from the other branches of this repo.
