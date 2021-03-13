### IMPORTS ###

import os
import subprocess

from libqtile import qtile
from libqtile import hook
from typing import List  # noqa: F401
from libqtile import bar, layout, widget
from libqtile.config import Click, Drag, Group, Key, KeyChord, Match, Screen
from libqtile.lazy import lazy
from re import sub

mod = "mod4" # Windows key
terminal = "alacritty"
#_wallpaper='~/.images/fash1.jpg'
#_wallpaper_mode = 'fill'

keys = [
        ### My launchers ###
        Key(["control", "shift"], "q",
            lazy.spawn("code /home/k0ss4/.config/qtile/config.py"),
            desc='Launches Code with config.py'
            ),
        Key([], "Print",
            lazy.spawn("xfce4-screenshooter"),
            desc='Launches screenshooter'
            ),
        ### The essentials
        Key(["shift"], "F4",
            lazy.spawn("poweroff")
            ),
        Key([mod], "Return",
            lazy.spawn(terminal),
            desc='Launches My Terminal'
            ),
        Key([mod, "shift"], "Return",
            lazy.spawn("rofi -show drun -config -display-drun \"Run: \" -drun-display-format \"{name}\""),
            desc='Run Launcher'
            ),
        Key([mod], "Tab",
            lazy.next_layout(),
            desc='Toggle through layouts'
            ),
        Key([mod], "w",
            lazy.window.kill(),
            desc='Kill active window'
            ),
        Key([mod, "shift"], "r",
            lazy.restart(),
            desc='Restart Qtile'
            ),
        Key([mod, "shift"], "F4",
            lazy.shutdown(),
            desc='Shutdown Qtile'
            ),
        Key(["control", "shift"], "e",
            lazy.spawn("emacsclient -c -a emacs"),
            desc='Doom Emacs'
            ),
        ### Switch focus of monitors
        Key([mod], "period",
            lazy.to_screen(0),
            desc='Move focus to 1 monitor'
            ),
        Key([mod], "comma",
            lazy.to_screen(1),
            desc='Move focus to 2 monitor'
            ),
        ### Window controls
        Key([mod], "k",
            lazy.layout.down(),
            desc='Move focus down in current stack pane'
            ),
        Key([mod], "j",
            lazy.layout.up(),
            desc='Move focus up in current stack pane'
            ),
        Key([mod, "shift"], "k",
            lazy.layout.shuffle_down(),
            desc='Move windows down in current stack'
            ),
        Key([mod, "shift"], "j",
            lazy.layout.shuffle_up(),
            desc='Move windows up in current stack'
            ),
        Key([mod], "l",
            lazy.layout.grow(),
            lazy.layout.increase_nmaster(),
            desc='Expand window (MonadTall), increase number in master pane (Tile)'
            ),
        Key([mod], "h",
            lazy.layout.shrink(),
            lazy.layout.decrease_nmaster(),
            desc='Shrink window (MonadTall), decrease number in master pane (Tile)'
            ),
        Key([mod], "n",
            lazy.layout.normalize(),
            desc='normalize window size ratios'
            ),
        Key([mod], "m",
            lazy.layout.maximize(),
            desc='toggle window between minimum and maximum sizes'
            ),
        Key([mod, "shift"], "f",
            lazy.window.toggle_floating(),
            desc='toggle floating'
            ),
        Key([mod, "shift"], "m",
            lazy.window.toggle_fullscreen(),
            desc='toggle fullscreen'
            ),
        ### Stack controls
        Key([mod, "shift"], "space",
            lazy.layout.rotate(),
            lazy.layout.flip(),
            desc='Switch which side main pane occupies (monadtall)'
            ),
        Key([mod], "space",
            lazy.layout.next(),
            desc='Switch window focus to other pane(s) of stack'
            ),
        Key([], "XF86AudioRaiseVolume",
            lazy.spawn("amixer -D pulse set Master 5%+"),
            desc='Volume up'
            ),
        Key([], "XF86AudioLowerVolume",
            lazy.spawn("amixer -D pulse set Master 5%-"),
            desc='Volume down'
            ),
        Key([], "XF86AudioMute",
            lazy.spawn("amixer -D pulse set Master toggle"),
            desc='Mute volume'
            ),
]

group_names = [("WWW", {'layout': 'monadtall'}),
               ("DEV", {'layout': 'monadtall'}),
               ("SYS", {'layout': 'monadtall'}),
               ("CHAT", {'layout': 'monadtall'}),
               ("FUN", {'layout': 'monadtall'}),
               ("MSC", {'layout': 'monadtall'})]

groups = [Group(name, **kwargs) for name, kwargs in group_names]

for i, (name, kwargs) in enumerate(group_names, 1):
    keys.append(Key([mod], str(i), lazy.group[name].toscreen()))        # Switch to another group
    keys.append(Key([mod, "shift"], str(i), lazy.window.togroup(name))) # Send current window to another group


layouts = [
    layout.MonadTall(
        margin=15
    ),
    layout.Columns(border_focus_stack='#d75f5f'),
    layout.Max(),    
    # Try more layouts by unleashing below layouts.
    # layout.Bsp(),
    # layout.Matrix(),
    # layout.MonadTall(),
    # layout.MonadWide(),
    # layout.RatioTile(),
    # layout.Tile(),
    # layout.TreeTab(),
    # layout.VerticalTile(),
    # layout.Zoomy(),
]

### Nvidia-smi function ###
def get_my_gpu_temp():
    if os.path.isfile("/bin/nvidia-smi"):
        data = subprocess.Popen(["/bin/nvidia-smi",
                                 "--query-gpu=temperature.gpu",
                                 "--format=csv"],
                                stdout=subprocess.PIPE).communicate()
        return "{} °C".format(sub("\D", "", str(data)))

### Power consuption ###
def get_my_power():
    p = subprocess.Popen("/home/k0ss4/./.power.sh", stdout=subprocess.PIPE, shell=True)

    output,err = p.communicate()
    return output.decode("utf-8")

### Kernel version ###
def kernel_version():
    p = subprocess.Popen("uname -r | sed 's/-arch1-1/ /'", stdout=subprocess.PIPE, shell=True)

    output,err = p.communicate()
    output="\n"+output.decode("utf-8")
    return output

### Colors array ###
color = [['0a3f94', '4287f5'], #Left panel widgets background
         ['ffffff', 'ffffff'], #GroupBox font
         ['0a3f94', '0a3f94'], #GroupBox highlight background
         ['4287f5', '4287f5'], #GroupBox background
         ['353536', '353536']] #Panel background

widget_defaults = dict(
    font='Ubuntu',
    fontsize=14,
    padding=3,
)
extension_defaults = widget_defaults.copy()

### Screens and widgets ###
screens = [
    Screen(
        #wallpaper=_wallpaper, #Wallpaper file
        #wallpaper_mode=_wallpaper_mode, #Wallpaper mode

        ### Top bar on the right monitor

        top=bar.Bar(
            [                
                widget.GroupBox(
                    background=color[3],
                    foreground=color[1],
                    active=color[1],
                    inactive=color[1],
                    highlight_color=color[2],
                    this_current_screen_border=color[1],
                    this_screen_border=color[1],
                    other_current_screen_border=color[1],
                    other_screen_border=color[1],
                    block_highlight_text_color=color[1],
                    borderwidth=2,                    
                    highlight_method='line',
                    margin_x=8,
                    fontsize=12,
                    font="Ubuntu Bold"
                ),
                widget.Spacer(
                    length=20
                ),
                widget.CurrentLayoutIcon(
                    background='7300d1',
                    padding=5
                ),
                widget.CurrentLayout(
                    background='7300d1',
                    padding=10
                ),
                widget.Spacer(
                    length=15
                ),
                widget.TaskList(
                    highlight_method='block',
                    icon_size=18,
                    max_title_width=150,
                    rounded=True,
                    padding_x=5,
                    padding_y=8,
                    margin_y=0,
                    fontsize=15
                ),                
                widget.TextBox(
                    text="⚈",
                    width=15,
                    foreground=color[0][1],
                    padding=0,
                    fontsize=45
                ),
                widget.Image(
                    filename='~/.config/qtile/icons/tux.png',
                    background=color[0][1]
                ),
                widget.GenPollText(
                    background=color[0][1],
                    fontsize=15,
                    func=kernel_version,
                    update_interval=20
                ),
                widget.TextBox(
                    text="⚈",
                    width=15,
                    background=color[0][1],
                    foreground=color[0][0],
                    padding=0,
                    fontsize=45
                ),
                widget.Image(
                    filename='~/.config/qtile/icons/update.png',
                    background=color[0][0],
                    mouse_callbacks= {'Button1': lambda: qtile.cmd_spawn(terminal + ' -e sudo pacman -Syu')}
                ),
                widget.TextBox(
                    text="Updates:",
                    background=color[0][0],
                    mouse_callbacks= {'Button1': lambda: qtile.cmd_spawn(terminal + ' -e sudo pacman -Syu')}
                ),
                widget.CheckUpdates(
                    distro='Arch_checkupdates', #pacman-contrib needed
                    no_update_string='0',
                    display_format='{updates}',
                    update_interval=1800,
                    background=color[0][0],
                    mouse_callbacks= {'Button1': lambda: qtile.cmd_spawn(terminal + ' -e sudo pacman -Syu')}
                ),
                widget.TextBox(
                    text="⚈",
                    width=15,
                    foreground=color[0][1],
                    background=color[0][0],
                    padding=0,
                    fontsize=45
                ),
                widget.TextBox(
                    text='Vol:',
                    background=color[0][1]
                ),
                widget.Volume(
                    device='pulse',
                    background=color[0][1]
                ),
                widget.TextBox(
                    text="⚈",
                    width=15,
                    foreground=color[0][0],
                    background=color[0][1],
                    padding=0,
                    fontsize=45
                ),
                widget.Spacer(
                    linewidth=0,
                    length=5,
                    background=color[0][0]
                ),
                widget.Systray(
                    icon_size=22,
                    padding=7,
                    background=color[0][0]
                ),
                widget.Spacer(
                    linewidth=0,
                    length=5,
                    background=color[0][0]
                ),
                widget.Spacer(
                    length=10,
                    background=color[0][0]
                ),
                widget.TextBox(
                    text="⚈",
                    width=15,
                    foreground=color[0][1],
                    background=color[0][0],
                    padding=0,
                    fontsize=45
                ),
                widget.Image(
                    filename='~/.config/qtile/icons/time.png',
                    background=color[0][1]
                ),
                widget.Clock(
                    format='%d.%m %A %H:%M',
                    background=color[0][1]    
                ),
                widget.Sep(
                    linewidth=0,
                    background=color[0][1]
                )
            ],
            30,
            background=color[4],
            opacity=0.8
        ),
    ),

    ### Top bar on the left monitor    

    Screen(
        #wallpaper=_wallpaper,
        #wallpaper_mode=_wallpaper_mode,
        top=bar.Bar(
            [
                widget.GroupBox(
                    background=color[3],
                    foreground=color[1],
                    active=color[1],
                    inactive=color[1],
                    highlight_color=color[2],
                    this_current_screen_border=color[1],
                    this_screen_border=color[1],
                    other_current_screen_border=color[1],
                    other_screen_border=color[1],
                    block_highlight_text_color=color[1],
                    borderwidth=2,                    
                    highlight_method='line',
                    margin_x=8,
                    fontsize=12,
                    font="Ubuntu Bold"
                ),
                widget.Spacer(
                    length=20
                ),
                widget.CurrentLayoutIcon(
                    background='7300d1',
                    padding=5
                ),
                widget.CurrentLayout(
                    background='7300d1',
                    padding=10
                ),
                widget.Spacer(
                    length=15
                ),
                widget.TaskList(
                    highlight_method='block',
                    icon_size=18,
                    max_title_width=150,
                    rounded=True,
                    padding_x=5,
                    padding_y=8,
                    margin_y=0,
                    fontsize=15
                ),
                widget.Spacer(),
                widget.TextBox(
                    text="⚈",
                    width=15,
                    foreground=color[0][1],
                    padding=0,
                    fontsize=45
                ),
                widget.Image(
                    filename='~/.config/qtile/icons/power.png',
                    background=color[0][1]
                ),
                widget.TextBox(
                    text='Power: ',
                    background=color[0][1],
                ),
                widget.GenPollText(
                    background=color[0][1],
                    func=get_my_power,
                    update_interval=2,                    
                ),
                widget.TextBox(
                    text="⚈",
                    width=15,
                    foreground=color[0][0],
                    background=color[0][1],
                    padding=0,
                    fontsize=45
                ),
                widget.Image(
                    filename='~/.config/qtile/icons/display.png',
                    background=color[0][0]
                ),
                widget.TextBox(
                    text=" GPU: ",
                    background=color[0][0]
                ),
                widget.GenPollText(
                    background=color[0][0],
                    func=get_my_gpu_temp,
                    update_interval=2
                ),
                widget.TextBox(
                    text="⚈",
                    width=15,
                    foreground=color[0][1],
                    background=color[0][0],
                    padding=0,
                    fontsize=45
                ),
                widget.Image(
                    filename='~/.config/qtile/icons/cpu.png',
                    background=color[0][1]
                ),
                widget.CPU(
                    background=color[0][1],
                    font='Ubuntu',
                    padding=10,
                    format='CPU {freq_current}GHz   {load_percent}%'
                ),
                widget.ThermalSensor(
                    background=color[0][1],
                    tag_sensor='Tdie'
                ),
                widget.TextBox(
                    text="⚈",
                    width=15,
                    foreground=color[0][0],
                    background=color[0][1],
                    padding=0,
                    fontsize=45
                ),
                widget.Image(
                    filename='~/.config/qtile/icons/ram.png',
                    background=color[0][0],
                ),
                widget.Memory(
                    background=color[0][0],
                    padding=10
                )
            ],
            30,
            background=color[4],
            opacity=0.8
        ),
    ),
]

mouse = [
    Drag([mod], "Button1", lazy.window.set_position_floating(),
         start=lazy.window.get_position()),
    Drag([mod], "Button3", lazy.window.set_size_floating(),
         start=lazy.window.get_size()),
    Click([mod], "Button2", lazy.window.bring_to_front())
]

dgroups_key_binder = None
dgroups_app_rules = []  # type: List
main = None
follow_mouse_focus = True
bring_front_click = False
cursor_warp = False

floating_layout = layout.Floating(float_rules=[
    *layout.Floating.default_float_rules,
    {'wmclass': 'confirmreset'},  # gitk
    {'wmclass': 'makebranch'},  # gitk
    {'wmclass': 'maketag'},  # gitk
    {'wname': 'branchdialog'},  # gitk
    {'wname': 'pinentry'},  # GPG key password entry
    {'wmclass': 'ssh-askpass'},  # ssh-askpass
    {'wmclass': 'galculator'},
    {'wmclass': 'soffice'},
    {'wname': 'Friends List'},  #Steam firends list
    {'wmclass': 'VirtualBox Machine'}
])
auto_fullscreen = True
focus_on_window_activation = "smart"


@hook.subscribe.startup_once
def autostart():
    home = os.path.expanduser('~/.config/qtile/autostart.sh')
    subprocess.call([home])


# XXX: Gasp! We're lying here. In fact, nobody really uses or cares about this
# string besides java UI toolkits; you can see several discussions on the
# mailing lists, GitHub issues, and other WM documentation that suggest setting
# this string if your java app doesn't work correctly. We may as well just lie
# and say that we're a working one by default.
#
# We choose LG3D to maximize irony: it is a 3D non-reparenting WM written in
# java that happens to be on java's whitelist.
wmname = "QTile"
