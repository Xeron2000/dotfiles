{ config, pkgs, ... }:

{
  # Ghostty
  xdg.configFile."ghostty/config".source = ../configs/ghostty/config;

  # Alacritty
  xdg.configFile."alacritty/alacritty.toml".source = ../configs/alacritty/alacritty.toml;
  xdg.configFile."alacritty/dank-theme.toml".source = ../configs/alacritty/dank-theme.toml;

  # Kitty
  xdg.configFile."kitty/kitty.conf".source = ../configs/kitty/kitty.conf;

  # Fastfetch
  xdg.configFile."fastfetch/config.jsonc".source = ../configs/fastfetch/config.jsonc;

  # Fontconfig
  xdg.configFile."fontconfig/fonts.conf".source = ../configs/fontconfig/fonts.conf;

  # Hyprland: 仅备份，不由 home-manager 管理
  # hyprland.conf 使用相对路径 source = ./dms/*.conf，
  # 做成 nix store symlink 会导致相对路径解析失败。
  # 恢复方式: cp -r configs/hypr/* ~/.config/hypr/
}
