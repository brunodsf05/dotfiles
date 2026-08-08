{ config, inputs, pkgs, ... }:

{
  # --- Home Manager --- #
  home.username = "bruno";
  home.homeDirectory = "/home/bruno";
  home.stateVersion = "26.05";

  programs.home-manager.enable = true;
  programs.nh.enable = true;

  targets.genericLinux.enable = true;

  # --- Configuration --- #
  home.sessionVariables = {
    NH_HOME_FLAKE = "/home/bruno/.local/share/chezmoi";
  };

  home.packages = with pkgs; [
    # Software
    mise
    starship
    yazi
    zed-editor
    zellij
    # Fonts
    nerd-fonts.cousine
    nerd-fonts.departure-mono
    nerd-fonts.jetbrains-mono
  ];

  services.syncthing.enable = true;
}
