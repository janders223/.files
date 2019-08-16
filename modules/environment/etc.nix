{ pkgs }:

{
  "per-user/alacritty/alacritty.yml".text = import ../../config/alacritty.nix { zsh = pkgs.zsh; };
  "per-user/.gitconfig".text = import ../../config/gitconfig.nix;
  "per-user/.git_template/hooks/ctags".text = import ../../config/git_template/ctags.nix { ctags = pkgs.ctags; };
  "per-user/.git_template/hooks/post-checkout".text = import ../../config/git_template/post-checkout.nix;
  "per-user/.git_template/hooks/post-commit".text = import ../../config/git_template/post-commit.nix;
  "per-user/.git_template/hooks/post-merge".text = import ../../config/git_template/post-merge.nix;
  "per-user/.git_template/hooks/post-rewrite".text = import ../../config/git_template/post-rewrite.nix;
  "per-user/.gitignore".text = import ../../config/gitignore.nix;
  "per-user/.zshrc".text = import ../../config/zshrc.nix;
  }
