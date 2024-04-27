{ config, pkgs, ... }: 

{
  imports = [
    ./zsh/zsh.nix
    ./alacritty/alacritty.nix
    ./fzf/fzf.nix
    # ./git/git.nix
    # ./nvim/nvim.nix
    # ./sioyek/sioyek.nix
    # ./hyprland/hyprland.nix
    # ./hyprpaper/hyprpaper.nix
    # ./waybar/waybar.nix
    # ./wofi/wofi.nix
    # ./ags/ags.nix
  ];
}
