--[[
     Multicolor Awesome WM theme 2.0
     github.com/lcpz

--]]

local gears = require("gears")
local lain  = require("lain")
local awful = require("awful")
local wibox = require("wibox")

local os = os
local my_table = awful.util.table or gears.table -- 4.{0,1} compatibility

local theme                                     = {}
theme.confdir                                   = os.getenv("HOME") .. "/.config/awesome/themes/multicolor"
--Fonts
theme.font                                      = "Ubuntu Mono 13"
theme.taglist_font                              = "Font Awesome 5 Free 14"
theme.numbers_font                              = "Ubuntu Mono 14"
--Icons
theme.updates_icon                              = ""
theme.textclock_icon                            = ""
theme.memory_icon                               = ""
theme.volume_icon                               = ""
theme.netdown_icon                              = ""
theme.net_icon                                  = ""
theme.gputemp_icon                              = ""
theme.cputemp_icon                              = ""
theme.power_icon                                = ""
theme.kernel_icon                               = ""
--Colors
--Widget colors
theme.separator_fg                              = "#ffffff"
theme.updates_fg                                = "#96b869"
theme.textclock_fg                              = "#ff6c6b"
theme.memory_fg                                 = "#96b869"
theme.volume_fg                                 = "#e6a80b"
theme.net_fg                                    = "#e6a80b"
theme.gputemp_fg                                = "#e6a80b"
theme.cputemp_fg                                = "#e6a80b"
theme.power_fg                                  = "#ff6c6b"
theme.kernel_fg                                 = "#ff6c6b"
--Other colors
theme.menu_bg_normal                            = "#000000"
theme.menu_bg_focus                             = "#000000"
theme.bg_normal                                 = "#282827"
theme.bg_focus                                  = "#000000"
theme.bg_urgent                                 = "#000000"
theme.fg_normal                                 = "#aaaaaa"
theme.fg_focus                                  = "#ff8c00"
theme.fg_urgent                                 = "#af1d18"
theme.fg_minimize                               = "#ffffff"
theme.border_width                              = 2
theme.border_normal                             = "#1c2022"
theme.border_focus                              = "#ff0000"
theme.border_marked                             = "#3ca4d8"
theme.menu_border_width                         = 0
theme.menu_width                                = 140
theme.menu_submenu_icon                         = theme.confdir .. "/icons/submenu.png"
theme.menu_fg_normal                            = "#aaaaaa"
theme.menu_fg_focus                             = "#ff8c00"
theme.menu_bg_normal                            = "#050505dd"
theme.menu_bg_focus                             = "#050505dd"
theme.tasklist_plain_task_name                  = true
theme.tasklist_disable_icon                     = true
theme.useless_gap                               = 3 
theme.taglist_squares_sel                       = theme.confdir .. "/icons/square_a.png"
theme.taglist_squares_unsel                     = theme.confdir .. "/icons/square_b.png"
theme.layout_tile                               = theme.confdir .. "/icons/tile.png"
theme.layout_tilegaps                           = theme.confdir .. "/icons/tilegaps.png"
theme.layout_tileleft                           = theme.confdir .. "/icons/tileleft.png"
theme.layout_tilebottom                         = theme.confdir .. "/icons/tilebottom.png"
theme.layout_tiletop                            = theme.confdir .. "/icons/tiletop.png"
theme.layout_fairv                              = theme.confdir .. "/icons/fairv.png"
theme.layout_fairh                              = theme.confdir .. "/icons/fairh.png"
theme.layout_spiral                             = theme.confdir .. "/icons/spiral.png"
theme.layout_dwindle                            = theme.confdir .. "/icons/dwindle.png"
theme.layout_max                                = theme.confdir .. "/icons/max.png"
theme.layout_fullscreen                         = theme.confdir .. "/icons/fullscreen.png"
theme.layout_magnifier                          = theme.confdir .. "/icons/magnifier.png"
theme.layout_floating                           = theme.confdir .. "/icons/floating.png"
theme.titlebar_close_button_normal              = theme.confdir .. "/icons/titlebar/close_normal.png"
theme.titlebar_close_button_focus               = theme.confdir .. "/icons/titlebar/close_focus.png"
theme.titlebar_minimize_button_normal           = theme.confdir .. "/icons/titlebar/minimize_normal.png"
theme.titlebar_minimize_button_focus            = theme.confdir .. "/icons/titlebar/minimize_focus.png"
theme.titlebar_ontop_button_normal_inactive     = theme.confdir .. "/icons/titlebar/ontop_normal_inactive.png"
theme.titlebar_ontop_button_focus_inactive      = theme.confdir .. "/icons/titlebar/ontop_focus_inactive.png"
theme.titlebar_ontop_button_normal_active       = theme.confdir .. "/icons/titlebar/ontop_normal_active.png"
theme.titlebar_ontop_button_focus_active        = theme.confdir .. "/icons/titlebar/ontop_focus_active.png"
theme.titlebar_sticky_button_normal_inactive    = theme.confdir .. "/icons/titlebar/sticky_normal_inactive.png"
theme.titlebar_sticky_button_focus_inactive     = theme.confdir .. "/icons/titlebar/sticky_focus_inactive.png"
theme.titlebar_sticky_button_normal_active      = theme.confdir .. "/icons/titlebar/sticky_normal_active.png"
theme.titlebar_sticky_button_focus_active       = theme.confdir .. "/icons/titlebar/sticky_focus_active.png"
theme.titlebar_floating_button_normal_inactive  = theme.confdir .. "/icons/titlebar/floating_normal_inactive.png"
theme.titlebar_floating_button_focus_inactive   = theme.confdir .. "/icons/titlebar/floating_focus_inactive.png"
theme.titlebar_floating_button_normal_active    = theme.confdir .. "/icons/titlebar/floating_normal_active.png"
theme.titlebar_floating_button_focus_active     = theme.confdir .. "/icons/titlebar/floating_focus_active.png"
theme.titlebar_maximized_button_normal_inactive = theme.confdir .. "/icons/titlebar/maximized_normal_inactive.png"
theme.titlebar_maximized_button_focus_inactive  = theme.confdir .. "/icons/titlebar/maximized_focus_inactive.png"
theme.titlebar_maximized_button_normal_active   = theme.confdir .. "/icons/titlebar/maximized_normal_active.png"
theme.titlebar_maximized_button_focus_active    = theme.confdir .. "/icons/titlebar/maximized_focus_active.png"

local markup = lain.util.markup

-- Textclock
os.setlocale(os.getenv("LANG")) -- to localize the clock
local mytextclock = wibox.widget.textclock(markup(theme.textclock_fg, theme.textclock_icon .. markup.font(theme.numbers_font, " %d") .. "/" .. markup.font(theme.numbers_font, "%m") .. "/" .. markup.font(theme.numbers_font, "%y") .. "(" .. markup.font(theme.numbers_font, "%H") .. ":" .. markup.font(theme.numbers_font, "%M") .. ") "))
mytextclock.font = theme.font

-- ALSA volume
theme.volume = lain.widget.alsa({
    settings = function()
        if volume_now.status == "off" then
            volume_now.level = "M"
        end

        widget:set_markup(markup.fontfg(theme.font, theme.volume_fg, theme.volume_icon .. " " .. volume_now.level .. "% "))
    end
})

-- Net
local netdowninfo = wibox.widget.textbox()
local netupinfo = lain.widget.net({
    settings = function()
        widget:set_markup(markup.fontfg(theme.font, theme.net_fg, markup.font(theme.numbers_font, net_now.sent) .. "kb "))
        netdowninfo:set_markup(markup.fontfg(theme.font, theme.net_fg, theme.net_icon .. " " .. markup.font(theme.numbers_font, net_now.received) .. "kb "))
    end
})

-- MEM
local memory = lain.widget.mem({
    settings = function()
        widget:set_markup(markup.fontfg(theme.font, theme.memory_fg, theme.memory_icon .. " " .. markup.font(theme.numbers_font, mem_now.used) .. "M/" .. markup.font(theme.numbers_font, mem_now.total) .. "M "))
    end
})

local scripts_beg = "bash -c '~/.config/awesome/scripts'"

--Updates widget
local updatestext = wibox.widget.textbox(markup.fontfg(theme.font, theme.updates_fg, theme.updates_icon .. " Updates: "))
local updates = awful.widget.watch(string.format("%s/updates", scripts_beg), 600,
   function (widget, stdout)
      widget:set_markup(markup.fontfg(theme.numbers_font, theme.updates_fg, stdout))
   end)

--GPU temperature widget
local gputemptext = wibox.widget.textbox(markup.fontfg(theme.font, theme.gputemp_fg, theme.gputemp_icon .. " GPU: "))
local gputemp = awful.widget.watch(string.format("%s/gputemp", scripts_beg), 2,
   function (widget, stdout)
      widget:set_markup(markup.fontfg(theme.font, theme.gputemp_fg, stdout))
   end)

--CPU temperature widget
local cputemptext = wibox.widget.textbox(markup.fontfg(theme.font, theme.cputemp_fg, theme.cputemp_icon .. " CPU: "))
local cputemp = awful.widget.watch(string.format("%s/cputemp", scripts_beg), 2,
   function (widget, stdout)
      widget:set_markup(markup.fontfg(theme.font, theme.cputemp_fg, stdout))
   end)

--Power usage widget
local powertext = wibox.widget.textbox(markup.fontfg(theme.font, theme.power_fg, theme.power_icon .. " Power: "))
local power = awful.widget.watch("bash -c '~/.power.sh'", 2,
   function (widget, stdout)
      widget:set_markup(markup.fontfg(theme.font, theme.power_fg, stdout))
   end)

--Kernel version widget
local kerneltext = wibox.widget.textbox(markup.fontfg(theme.font, theme.kernel_fg, theme.kernel_icon .. " "))
local kernel = awful.widget.watch(string.format("%s/kernel", scripts_beg), 3600,
   function (widget, stdout)
      widget:set_markup(markup.fontfg(theme.font, theme.kernel_fg, stdout))
   end)

local separator = wibox.widget.textbox(markup.fontfg(theme.font, theme.separator_fg, " |  "))

function theme.at_screen_connect(s, monitor)
   -- Tags
   awful.tag(awful.util.tagnames, s, awful.layout.layouts[1])
    
   -- Create an imagebox widget which will contains an icon indicating which layout we're using.
   -- We need one layoutbox per screen.
   s.mylayoutbox = awful.widget.layoutbox(s)
   s.mylayoutbox:buttons(my_table.join(
                           awful.button({ }, 1, function () awful.layout.inc( 1) end),
                           awful.button({ }, 3, function () awful.layout.inc(-1) end)))
   -- Create a taglist widget
   s.mytaglist = awful.widget.taglist(s, awful.widget.taglist.filter.all, awful.util.taglist_buttons)

   -- Create a tasklist widget
   s.mytasklist = awful.widget.tasklist(s, awful.widget.tasklist.filter.currenttags, awful.util.tasklist_buttons)
   -- Create the wibox
   s.mywibox = awful.wibar({ position = "top", screen = s, height = 20, bg = theme.bg_normal, fg = theme.fg_normal })
   --First monitor

   if monitor == 0 then
      -- Add widgets to the wibox
      s.mywibox:setup {
         layout = wibox.layout.align.horizontal,
         { -- Left widgets
            layout = wibox.layout.fixed.horizontal,
            --s.mylayoutbox,
            s.mytaglist,
            s.mylayoutbox,
         },
         nil,
         { -- Right widgets
            layout = wibox.layout.fixed.horizontal,
            updatestext,
            updates,
            separator,
            theme.volume.widget,
            separator,
            netdowninfo,
            netupinfo.widget,
            separator,
            kerneltext,
            kernel,
            separator,
            mytextclock,
            separator,
            wibox.widget.systray(),
         },
      }
   --Second monitor
   else
      s.mywibox:setup {
         layout = wibox.layout.align.horizontal,
         { -- Left widgets
            layout = wibox.layout.fixed.horizontal,
            --s.mylayoutbox,
            s.mytaglist,
            s.mylayoutbox,
         },
         nil,
         { -- Right widgets
            layout = wibox.layout.fixed.horizontal,
            powertext,
            power,
            powerletter,
            separator,
            cputemptext,
            cputemp,
            separator,
            gputemptext,
            gputemp,
            separator,
            memory.widget,
         },
      }
end
 end

return theme
