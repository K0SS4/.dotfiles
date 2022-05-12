# My custom Arch Linux dotfiles. 
### Includes configs for:
- WMs:
  - xmonad 
  - i3-gaps
  - awesomewm
- polybar
- xmobar
- rofi
- st
- kitty
- alacritty
- zsh
- fish
- starship
- neovim

## This setup includes GreenWithEnvy database wich has my GPU overclocking profile. I receommend you to remove that file(.config/gwe/gwe.db) and I don't take any responsibility if you won't.

This is my personal setup. If you want to use it you can of course do that but I don't take any responsibility if anything bad happens(it shouldn't tho).

## "Dependencies" (You'll have to check how to install them on your distro):  
- betterlockscreen(Obvious I guess)  
- For status bar:
    - lm_sensors (for CPU temperature in the status bar)
    - Ubuntu font family (polybar general font)
    - Font Awesome 6 Free (icons in the polybar)
    - Font Awesome 6 Brands (tux logo in the polybar)
- rofi (applications launcher)  
- For terminal
    - shell-color-scripts (for cool looking terminal. You can grab it from [here](https://gitlab.com/dwt1/shell-color-scripts) )  
    - fish (shell)
        - starship prompt
    - zsh (shell)      
        - oh-my-zsh (zsh framework)
            - starhip prompt
            - zsh-autosuggestions (for suggestions when you're typing in the terminal)
            - zsh-syntax-highlighting (for syntax highlighting when you're typing in the terminal)
- neovim (my text editor)
    - vim-plug (plugins manager for neovim)
- nitrogen (for wallpaper)
- maim (screenshot utility)
- xclip (for copying selected screenshot area to the clipboard)

I hope I did not forget about something. You will probably have to adjust my polybar/xmobar scripts for example:  
- the gputemp script is written for nvidia-smi,  
- the cputemp script should be fine but idk,  
- the updates script is written for arch-based distros specifically(and for paru as an aur helper),  
- the network "module" in polybar/xmobar is set to enp34s0 interface  
- the volume module in polybar is written for pipewire

You can probably remove the power script since it is connecting with my local smart socket and grabbing the output from there.

#Screenshots:  
## xmonad
![screenshot of display 1](https://i.imgur.com/Ofsjoqp.png)
![screenshot of display 0](https://i.imgur.com/jUFx1jg.png)

## i3-gaps
![screenshot of display 1](https://i.imgur.com/Ykif8Kt.png)
![screenshot of display 0](https://i.imgur.com/EzR77I8.png)

## awesomewm
![screenshot of display 1](https://i.imgur.com/NCSufy5.png)
![screenshot of display 0](https://i.imgur.com/TflaaVj.png)
