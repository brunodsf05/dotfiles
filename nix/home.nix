{ config, inputs, pkgs, ... }:

{
  # --- Home Manager --- #
  home.username = "bruno";
  home.homeDirectory = "/home/bruno";
  home.stateVersion = "26.05";

  programs.home-manager.enable = true;
  programs.nh.enable = true;

  home.sessionVariables = {
   NH_HOME_FLAKE = "/home/bruno/.local/share/chezmoi";
 };

  targets.genericLinux.enable = true;

  # --- Configuration --- #
  home.packages = with pkgs; [
    zed-editor
  ];

  services.syncthing.enable = true;
}
