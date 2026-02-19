{ config, pkgs, ... }:

{
  # 基本信息
  home.username = "xeron";
  home.homeDirectory = "/home/xeron";
  home.stateVersion = "25.11";

  # 导入模块
  imports = [
    ./programs/git.nix
    ./programs/shell.nix
    ./programs/dev-tools.nix
  ];

  # 核心包列表
  home.packages = with pkgs; [
    # 系统工具
    htop
    tree
    wget
    curl

    # 网络工具
    nmap

    # 压缩工具
    unzip
    zip
    p7zip
  ];

  # 环境变量
  home.sessionVariables = {
    EDITOR = "nvim";
    VISUAL = "nvim";
    PAGER = "less";
  };

  # 让 Home Manager 管理自己
  programs.home-manager.enable = true;

  # XDG 目录配置
  xdg.enable = true;
}
