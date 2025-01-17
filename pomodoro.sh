#!/usr/bin/env bash

# Bash skript pro načasování práce a odpočinku pomodoro metodou

while true; do
    # Výběr pracovního intervalu
    WORK_INTERVAL=$(zenity --list --title="Vyber si délku pracovního intervalu" --column="Pracovní interval" "20 minut" "30 minut" "40 minut" --width=300 --height=200)

    # Zkontroluj, zda uživatel zavřel okno
    if [ $? -ne 0 ]; then
        exit
    fi

    # Nastavení délky pracovního intervalu
    case $WORK_INTERVAL in
        "20 minut")
            SLEEP_TIME="20m"
            ;;
        "30 minut")
            SLEEP_TIME="30m"
            ;;
        "40 minut")
            SLEEP_TIME="40m"
            ;;
        *)
            continue
            ;;
    esac

    # Uživatel souhlasil s pracovním intervalem
    gsettings set org.gnome.desktop.notifications show-banners false
    sleep $SLEEP_TIME

    # Přehrání zvukové notifikace
    ffplay /usr/share/sounds/freedesktop/stereo/alarm-clock-elapsed.oga -autoexit -nodisp

    # Zobrazí informační dialog pro odpočinek
    REST_INTERVAL=$(zenity --list --title="Vyber si délku odpočinku" --column="Odpočinek" "5 minut" "10 minut" --width=350 --height=200)

    # Zkontroluj, zda uživatel zavřel okno
    if [ $? -ne 0 ]; then
        exit
    fi

    # Nastavení délky odpočinku
    case $REST_INTERVAL in
        "5 minut")
            REST_TIME="5m"
            ;;
        "10 minut")
            REST_TIME="10m"
            ;;
        *)
            continue
            ;;
    esac

    # Zrušení režimu nerušit
    gsettings set org.gnome.desktop.notifications show-banners true
    sleep $REST_TIME

    # Přehrání zvukové notifikace
    ffplay /usr/share/sounds/freedesktop/stereo/alarm-clock-elapsed.oga -autoexit -nodisp
done
