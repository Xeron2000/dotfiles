/* ---- 💫 https://github.com/JaKooLit 💫 ---- */

// ### DEFAULT Top -Laptop ### //
{
    "include": "~/.config/hypr/component/waybar/modules",
    "layer": "top",
    //"mode": "dock",
    "exclusive": true,
    "passthrough": false,
    "position": "top",
    "spacing": 4,
    "fixed-center": true,
    "ipc": true,
    "margin-top": 5,
    //"margin-bottom": 5,
    "width": 1500,

    "modules-left": ["clock#peony","custom/dynamic_pill",],

    "modules-center": ["hyprland/workspaces#roman",],

    "modules-right": [
        "custom/cava_mviz",
        "tray",
        "backlight#peony",
        "pulseaudio",
        "pulseaudio#microphone",
        "battery#peony",],


        //M O D U L E S //

        "custom/dynamic_pill": {
            "return-type": "json",
            "exec": "~/.config/hypr/scripts/tools/start_dyn",
            "escape":true,
            "format": "{:.27}"
        },
        "clock#peony": {
            "interval": 60,
            "format": "{:%Y.%m.%d | %I:%M}",
            "max-length": 25
        },

        "wireplumber#peony": {
            "format": "{icon} {volume}",
            "format-muted": " Mute",
            "on-click": "~/.config/hypr/scripts/Volume.sh --toggle",
            "on-click-right": "pavucontrol -t 3",
            "on-scroll-up": "~/.config/hypr/scripts/Volume.sh --inc",
            "on-scroll-down": "~/.config/hypr/scripts/Volume.sh --dec",
            "format-icons": ["", "", "󰕾", ""],
        },

        "network#peony": {
            "interval": 1,
            "format": "{ifname}",
            "format-wifi": "{icon}  {bandwidthUpBytes}  {bandwidthDownBytes}",
            "format-ethernet": "󰌘   {bandwidthUpBytes}  {bandwidthDownBytes}",
            "format-disconnected": "󰌙",
            "tooltip-format": "{ipaddr}",
            "format-linked": "󰈁 {ifname} (No IP)",
            "tooltip-format-wifi": "{essid} {icon} {signalStrength}%",
            "tooltip-format-ethernet": "{ifname} 󰌘",
            "tooltip-format-disconnected": "󰌙 Disconnected",
            "max-length": 50,
            "format-icons": ["󰤯","󰤟","󰤢","󰤥","󰤨"]
        },

        "battery#peony": {
            "interval": 60,
            "align": 0,
            "rotate": 0,
            //"bat": "BAT1",
            //"adapter": "ACAD",
            "full-at": 100,
            "design-capacity": false,
            "states": {
                "good": 95,
                "warning": 30,
                "critical": 15
            },
            "format": "{icon}  {capacity}%",
            "format-charging": " {capacity}%",
            "format-plugged": "󱘖 {capacity}%",
            "format-full": "{icon} Full",
            "format-alt": "{icon} {time}",
            "format-icons": ["", "", "", "", ""],
            "format-time": "{H}h {M}min",
            "tooltip": true,
            "tooltip-format": "{timeTo} {power}w",
            "on-click-middle": "~/.config/hypr/scripts/ChangeBlur.sh",
            "on-click-right": "~/.config/hypr/scripts/Wlogout.sh",
        },

        "tray#peony": {
            "icon-size": 17,
            "spacing": 8,
        }
}
