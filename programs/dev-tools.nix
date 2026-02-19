{ config, pkgs, ... }:

{
  # Tmux 配置
  programs.tmux = {
    enable = true;
    terminal = "screen-256color";
    keyMode = "vi";
    mouse = true;
    prefix = "C-a";

    extraConfig = ''
      # 窗口和面板从 1 开始编号
      set -g base-index 1
      setw -g pane-base-index 1

      # 快速重载配置
      bind r source-file ~/.config/tmux/tmux.conf \; display "配置已重载！"

      # 分割窗口
      bind | split-window -h
      bind - split-window -v

      # Vim 风格的面板切换
      bind h select-pane -L
      bind j select-pane -D
      bind k select-pane -U
      bind l select-pane -R

      # 状态栏配置
      set -g status-style 'bg=#1e1e2e fg=#cdd6f4'
      set -g status-left '#[bg=#89b4fa,fg=#1e1e2e] #S '
      set -g status-right '#[bg=#89b4fa,fg=#1e1e2e] %Y-%m-%d %H:%M '
    '';
  };

  # Bat 配置（更好的 cat）
  programs.bat = {
    enable = true;
    config = {
      theme = "TwoDark";
      pager = "less -FR";
    };
  };

  # Btop 配置（系统监控）
  programs.btop = {
    enable = true;
    settings = {
      color_theme = "Default";
      theme_background = false;
      vim_keys = true;
    };
  };

  # Neovim 配置（基础）
  programs.neovim = {
    enable = true;
    defaultEditor = true;
    viAlias = true;
    vimAlias = true;

    extraConfig = ''
      " 基础设置
      set number
      set relativenumber
      set expandtab
      set tabstop=2
      set shiftwidth=2
      set smartindent
      set mouse=a
      set clipboard=unnamedplus

      " 搜索设置
      set ignorecase
      set smartcase
      set hlsearch
      set incsearch

      " 外观
      set termguicolors
      set cursorline
      set signcolumn=yes

      " 快捷键
      let mapleader = " "
      nnoremap <leader>w :w<CR>
      nnoremap <leader>q :q<CR>
      nnoremap <leader>e :Ex<CR>
    '';
  };

  # Lazygit 配置
  programs.lazygit = {
    enable = true;
    settings = {
      gui = {
        theme = {
          lightTheme = false;
        };
      };
    };
  };

  # Direnv（自动加载项目环境）
  programs.direnv = {
    enable = true;
    enableBashIntegration = true;
    enableFishIntegration = true;
    nix-direnv.enable = true;
  };
}
