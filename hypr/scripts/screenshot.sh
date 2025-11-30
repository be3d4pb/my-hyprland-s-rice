#!/bin/bash

# Папка для сохранения скринов
save_dir="/home/torncrown/Pictures/Screenshots"
mkdir -p "$save_dir"

# Настройки
sound_file="/usr/share/sounds/freedesktop/stereo/screen-capture.oga"
swpy_dir="$HOME/.config/swappy"
save_file="screenshot_$(date +'%y%m%d_%H%M%S').png"
full_path="$save_dir/$save_file"

mkdir -p "$swpy_dir"
echo -e "[Default]\nsave_dir=$save_dir\nsave_filename_format=$save_file" > "$swpy_dir/config"

# Функция для звука
ss_sound() {
    paplay "$sound_file"
}

# Делаем скрин выделенной области
grimblast --freeze save area "$full_path" && ss_sound && swappy -f "$full_path"

# Уведомление о сохранении
if [ -f "$full_path" ]; then
    notify-send "Screenshot saved" "$full_path" -i "$full_path" -r 91190 -t 2200
fi

# Перезапускаем уведомления
swaync &
