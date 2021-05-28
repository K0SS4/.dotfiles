#!/usr/bin/env bash

function run {
  if ! pgrep -f $1 ;
  then
    $@&
  fi
}

run lxsession
run picom
run nm-applet
run xfce4-clipman
run "nitrogen --restore"
nvidia-settings -l
