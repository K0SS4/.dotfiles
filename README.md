#My custom GNU/Linux dotfiles

This is my personal setup. If you want to use it you can of course do that but I don't take any responsibility if anything bad happens(it shouldn't tho).

###Needed dependencies (You'll have to check how to install them on your distro):  

- xmonad(The WM I'm using)  
- xmonad-contrib(For some of the libraries)  
- xmobar (status panel)  
- alacritty (terminal)  
- rofi (applications launcher)  
- shell-color-scripts (for cool looking temrinal. You can grab it from [here](https://gitlab.com/dwt1/shell-color-scripts) )  
- zsh (shell)  
- - oh-my-zsh (zsh framework)
- - - zsh-autosuggestions (for suggestions when you're typing in the terminal)
- - - zsh-syntax-highlighting (for syntax highlighting when you're typing in the terminal)
- neovim (my text editor)
- - vim-plug (plugins manager for neovim)
- feh (for wallpaper)
- network-manager-applet(network manager icon in the systray)
- volumeicon (Volume icon in the systray)
- xfce4-clipman-plugin (clipboard manager)
- xfce4-screenshooter (screenshot utility)
- picom (compositor)
- lxsession (polkit)
- lm_sensors (for CPU temperature)
- trayer (systray)
- sxiv (for images preview when clicking M-xK_`<F1>`)
- Ubuntu font family (xmobar font)
- Font Awesome 5 Free (icons in the xmobar)
- Font Awesome 5 Brands (tux logo in the xmobar)
- Mononoki Nerd Font (separators in the xmobar)

I hope i did not forget about something. You will probably have adjust my xmobar scripts for example:  
- the kernel script is written for zen kernel specifically,  
- the gputemp script is written for nvidia-smi,  
- the cputemp script should be fine but idk.  
You can probably remove the power script since it is connecting with my local smart socket and grabbing the output from there.

Also the xmobar position is set statically so don't forget to take care of that.

Screenshots:  
![screenshot of display 1](https://i.imgur.com/zKEMvzn.png)
![screenshot of display 0](https://i.imgur.com/sgiaR4n.png)
  
Alternatively you can grab my qtile setup from the second branch of this repo.
