{ config, pkgs, ... }:

{
  # Bash 配置
  programs.bash = {
    enable = true;
    enableCompletion = true;

    shellAliases = {
      # 基础命令增强
      ls = "eza --icons";
      ll = "eza -l --icons";
      la = "eza -la --icons";
      tree = "eza --tree --icons";

      # Git 快捷方式
      g = "git";
      gs = "git status";
      ga = "git add";
      gc = "git commit";
      gp = "git push";
      gl = "git pull";

      # 系统管理
      update = "sudo pacman -Syu";
      cleanup = "sudo pacman -Sc";

      # 工具
      cat = "bat";
      grep = "rg";
      find = "fd";

      # 目录导航
      ".." = "cd ..";
      "..." = "cd ../..";
      "...." = "cd ../../..";

      # Home Manager
      hm = "home-manager";
      hms = "home-manager switch";
      hme = "nvim ~/.config/home-manager/home.nix";

      # 合成器切换
      switch-wm = "switch-compositor";
    };

    bashrcExtra = ''
      # 添加 ~/bin 到 PATH
      export PATH="$HOME/bin:$PATH"

      # 自定义提示符
      PS1='\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$ '

      # 历史记录配置
      export HISTSIZE=10000
      export HISTFILESIZE=20000
      export HISTCONTROL=ignoredups:erasedups

      # FZF 配置
      export FZF_DEFAULT_COMMAND='fd --type f --hidden --follow --exclude .git'
      export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"

      # 加载 Nix 环境
      if [ -e ~/.nix-profile/etc/profile.d/nix.sh ]; then
        . ~/.nix-profile/etc/profile.d/nix.sh
      fi
    '';
  };

  # Fish 配置
  programs.fish = {
    enable = true;

    shellAliases = {
      # 基础命令增强
      ls = "eza --icons";
      ll = "eza -l --icons";
      la = "eza -la --icons";
      tree = "eza --tree --icons";

      # Git 快捷方式
      g = "git";
      gs = "git status";
      ga = "git add";
      gc = "git commit";
      gp = "git push";
      gl = "git pull";

      # 工具
      cat = "bat";
      grep = "rg";
      find = "fd";

      # Home Manager
      hm = "home-manager";
      hms = "home-manager switch";
      hme = "nvim ~/.config/home-manager/home.nix";

      # 合成器切换
      switch-wm = "switch-compositor";
    };

    interactiveShellInit = ''
      # 添加 ~/bin 到 PATH
      set -gx PATH $HOME/bin $PATH

      # FZF 配置
      set -gx FZF_DEFAULT_COMMAND 'fd --type f --hidden --follow --exclude .git'
      set -gx FZF_CTRL_T_COMMAND "$FZF_DEFAULT_COMMAND"

      # 合成器切换函数
      function switch-wm
        switch-compositor $argv
      end
    '';
  };

  # Starship 提示符（可选，更美观）
  programs.starship = {
    enable = true;
    settings = {
      add_newline = true;
      character = {
        success_symbol = "[➜](bold green)";
        error_symbol = "[➜](bold red)";
      };
    };
  };

  # FZF 配置
  programs.fzf = {
    enable = true;
    enableBashIntegration = true;
    enableFishIntegration = true;
  };
}
