{ config, pkgs, ... }:

{
  programs.git = {
    enable = true;

    settings = {
      user = {
        name = "Xeron";
        email = "xeron2333@gmail.com";
      };

      alias = {
        st = "status";
        co = "checkout";
        br = "branch";
        ci = "commit";
        lg = "log --graph --pretty=format:'%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset' --abbrev-commit";
        last = "log -1 HEAD";
        unstage = "reset HEAD --";
      };

      init.defaultBranch = "main";
      pull.rebase = false;
      core.editor = "nvim";

      # Delta 配置（更好的 diff 显示）
      core.pager = "delta";
      interactive.diffFilter = "delta --color-only";
      delta = {
        navigate = true;
        light = false;
        side-by-side = true;
      };

      # Merge 配置
      merge.conflictstyle = "diff3";
      diff.colorMoved = "default";
    };

    # Git 忽略文件
    ignores = [
      # 系统文件
      ".DS_Store"
      "Thumbs.db"

      # 编辑器
      ".vscode/"
      ".idea/"
      "*.swp"
      "*.swo"
      "*~"

      # Node
      "node_modules/"
      ".npm/"

      # Python
      "__pycache__/"
      "*.pyc"
      ".venv/"
      "venv/"

      # Rust
      "target/"
      "Cargo.lock"

      # 其他
      ".env"
      ".env.local"
    ];
  };

  # GitHub CLI 配置
  programs.gh = {
    enable = true;
    settings = {
      git_protocol = "ssh";
      editor = "nvim";
    };
  };
}
