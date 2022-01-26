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

keys = [
        ### My launchers ###
        Key(["control", "shift"], "q",
            lazy.spawn(terminal + " -e nvim /home/k0ss4/.config/qtile/config.py"),
            desc='Launches qtile config with my editor'
            ),
        Key([], "Print",
            lazy.spawn("bash -c 'maim -s -l --color=1,1,1,0.2 --format png /dev/stdout | xclip -selection clipboard -t image/png -i'"),
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
            lazy.spawn("rofi -show drun"),
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
        Key([mod, "shift"], "q",
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
    layout.MonadWide(),
    # Try more layouts by unleashing below layouts.
    # layout.Bsp(),
    # layout.Matrix(),
    # layout.MonadTall(),
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
    p = subprocess.Popen("~/./.power.sh", stdout=subprocess.PIPE, shell=True)

    output,err = p.communicate()
    return output.decode("utf-8")

### Kernel version ###
def kernel_version():
    p = subprocess.Popen("~/.config/qtile/scripts/./kernel", stdout=subprocess.PIPE, shell=True)

    output,err = p.communicate()
    output="\n"+output.decode("utf-8")
    return output

### Colors array ###
color = [['3b0066', '3b0066'], #Panel background
         ['ffffff', 'ffffff'], #GroupBox font
         ['420070', '420070'], #GroupBox highlight background
         ['892bff', '892bff']] #GroupBox background

widget_defaults = dict(
    font='Ubuntu',
    fontsize=14
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
                    font="Ubuntu Bold",
                    padding=5
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
                    fontsize=15,
                ),                
                widget.TextBox(
                    text="",
                    foreground="#000000",
                    fontsize=35,
                    padding=0
                ),
                widget.GenPollText(
                    fontsize=15,
                    func=kernel_version,
                    update_interval=20,
                    padding=5 
                ),
                widget.Sep(
                    padding=20,
                    linewidth=3,
                    foreground="2f174d",
                ),
                widget.TextBox(
                    text="",
                    foreground="#000000",
                    fontsize=20,
                    padding=8,
                    mouse_callbacks={'Button1': lambda: qtile.cmd_spawn(terminal + ' -e paru -Syu')}
                ),
                widget.TextBox(
                    text="Updates:",
                    padding=0,
                    mouse_callbacks={'Button1': lambda: qtile.cmd_spawn(terminal + ' -e paru -Syu')}
                ),
                widget.CheckUpdates(
                    distro='Arch_checkupdates', #pacman-contrib needed
                    no_update_string=' 0',
                    display_format='{updates}',
                    update_interval=1800,
                    padding=3,
                    mouse_callbacks={'Button1': lambda: qtile.cmd_spawn(terminal + ' -e paru -Syu')}
                ),
                widget.Sep(
                    padding=20,
                    linewidth=3,
                    foreground="2f174d",
                ),
                widget.TextBox(
                    text="",
                    foreground="#ffffff",
                    fontsize=35,
                    padding=5
                ),
                widget.Volume(
                    device='pulse',
                    padding=3
                ),   
                widget.Sep(
                    padding=20,
                    linewidth=3,
                    foreground="2f174d",
                ),
                widget.Systray(
                    icon_size=22,
                    padding=4,
                ),
                widget.Sep(
                    padding=20,
                    linewidth=3,
                    foreground="2f174d",
                ),
                widget.TextBox(
                    text="",
                    foreground="#000000",
                    fontsize=40,
                    padding=5
                ),
                widget.Clock(
                    format='%d.%m %A %H:%M',
                    padding=5
                ),
            ],
            30,
            background=color[0],
            opacity=0.9
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
                widget.TextBox(
                    text="",
                    foreground="#ffffff",
                    fontsize=22,
                    padding=5
                ),
                widget.TextBox(
                    text='Power: ',
                    padding=2
                ),
                widget.GenPollText(
                    func=get_my_power,
                    update_interval=2,
                    padding=0
                ),
                widget.Sep(
                    padding=20,
                    linewidth=3,
                    foreground="2f174d",
                ),
                widget.TextBox(
                    text="",
                    foreground="#ffffff",
                    fontsize=35,
                    padding=5
                ),
                widget.TextBox(
                    text=" GPU: ",
                    padding=4
                ),
                widget.GenPollText(
                    func=get_my_gpu_temp,
                    update_interval=2,
                    padding=2
                ),
                widget.Sep(
                    padding=20,
                    linewidth=3,
                    foreground="2f174d",
                ),
                widget.TextBox(
                    text="",
                    foreground="#ffffff",
                    fontsize=30,
                    padding=5
                ),
                widget.CPU(
                    font='Ubuntu',
                    padding=5,
                    format='CPU {freq_current}GHz   {load_percent}%'
                ),
                widget.ThermalSensor(
                    tag_sensor='Tdie'
                ),
                widget.Sep(
                    padding=20,
                    linewidth=3,
                    foreground="2f174d",
                ),
                widget.TextBox(
                    text="",
                    foreground="#ffffff",
                    fontsize=35,
                    padding=5
                ),
                widget.Memory(
                    padding=10
                )
            ],
            30,
            background=color[0],
            opacity=0.9
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
