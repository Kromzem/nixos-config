# Edit this configuration file to define what should be installed on
# your system. Help is available in the configuration.nix(5) man page, on
# https://search.nixos.org/options and in the NixOS manual (`nixos-help`).

{ config, lib, pkgs, ... }:

{
  imports =
    [ # Include the results of the hardware scan.
      ./hardware-configuration.nix
      ./virtualisation.nix
    ];

  # Use the systemd-boot EFI boot loader.
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  nixpkgs.config.allowUnfree = true;
  
  services.logind.extraConfig = "HandleLidSwitch=hibernate";
  environment.sessionVariables.NIXOS_OZONE_WL = "1";

  networking.hostName = "palikin-laptop"; # Define your hostname.
  # Pick only one of the below networking options.
  # networking.wireless.enable = true;  # Enables wireless support via wpa_supplicant.
  # networking.wireless.userControlled.enable = true;
  networking.networkmanager.enable = true;  # Easiest to use and most distros use this by default.

  fonts.packages = [ pkgs.font-awesome pkgs.jetbrains-mono];
  
  programs.niri.enable = true;

  # Set your time zone.
  time.timeZone = "Europe/Berlin";

  services.blueman.enable = true;

  # Configure network proxy if necessary
  # networking.proxy.default = "http://user:password@proxy:port/";
  # networking.proxy.noProxy = "127.0.0.1,localhost,internal.domain";

  # Select internationalisation properties.
  i18n.defaultLocale = "de_DE.UTF-8";
  console = {
  #   font = "Lat2-Terminus16";
  #   keyMap = "de";
     useXkbConfig = true; # use xkb.options in tty.
  };

  # Enable the X11 windowing system.
  # services.xserver.enable = true;

  services.xserver = {
    enable = true;
    # desktopManager.gnome.enable = true;
    # displayManager.gdm.enable = true;
    displayManager.gdm = {
      enable = true;
      wayland = true;
    };
    xkb.layout = "de";
  };  

#   programs.hyprland = {
#     enable = true;
#     xwayland = {
#       enable = true;
#       hidpi = true;
#     };
#     nvidiaPatches = true;
# };
  
  # Configure keymap in X11
  # services.xserver.xkb.layout = "us";
  # services.xserver.xkb.options = "eurosign:e,caps:escape";

  # Enable CUPS to print documents.
  # services.printing.enable = true;

  # Enable sound.
  # hardware.pulseaudio.enable = true;
  # hardware.pulseaudio.package = pkgs.pulseaudioFull;
  # services.pipewire.enable = false;
  # OR
  # services.pipewire = {
  #   enable = true;
  #   pulse.enable = true;
  # };

  # Enable touchpad support (enabled default in most desktopManager).
  # services.libinput.enable = true;

  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.palikin = {
    isNormalUser = true;
    extraGroups = [ 
      "wheel"
      "networkManager"
      "adbuser" 
      "docker"
    ]; # Enable ‘sudo’ for the user.
    packages = with pkgs; [
      brave
      libreoffice
      # tutanota-desktop
      bitwarden-desktop
      protontricks
      android-tools
      jetbrains-toolbox
      rustup
      gcc
      google-chrome
      discord
      freetube
      gitui
      # rpi-imager   
    ];
  };

  virtualisation.docker.enable = true;
  systemd.services.flatpak-repo = {
    wantedBy = [ "multi-user.target" ];
    path = [ pkgs.flatpak ];
    script = ''
      flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo
    '';
  };


  nix.settings.experimental-features = [ "nix-command" "flakes" ];  
  # List packages installed in system profile. To search, run:
  # $ nix search wget
  environment.systemPackages = with pkgs; [
    git
    wget
    helix
    flatpak
    nixd
    alacritty
    fuzzel
    swaylock
    swaybg
    waybar
    xwayland-satellite
    font-awesome
    killall
    mako
    xdg-desktop-portal
    xdg-desktop-portal-gnome
    nautilus
    gparted
    # kitty
  ];

  services.gvfs.enable = true;

  environment.variables.EDITOR = "hx";

  # programs.hyprland = {
  #   # Install the packages from nixpkgs
  #   enable = true;
  #   # Whether to enable XWayland
  #   xwayland.enable = true;
  # };
  # Some programs need SUID wrappers, can be configured further or are
  # started in user sessions.
  # programs.mtr.enable = true;
  # programs.gnupg.agent = {
  #   enable = true;
  #   enableSSHSupport = true;
  # };

  programs = {
    steam.enable = true;
    adb.enable = true;
  };

  # List services that you want to enable:

  # Enable the OpenSSH daemon.
  # services.openssh.enable = true;

  # Open ports in the firewall.
  # networking.firewall.allowedTCPPorts = [ ... ];
  # networking.firewall.allowedUDPPorts = [ ... ];
  # Or disable the firewall altogether.
  # networking.firewall.enable = false;

  # Copy the NixOS configuration file and link it from the resulting system
  # (/run/current-system/configuration.nix). This is useful in case you
  # accidentally delete configuration.nix.
  # system.copySystemConfiguration = true;

  # This option defines the first version of NixOS you have installed on this particular machine,
  # and is used to maintain compatibility with application data (e.g. databases) created on older NixOS versions.
  #
  # Most users should NEVER change this value after the initial install, for any reason,
  # even if you've upgraded your system to a new NixOS release.
  #
  # This value does NOT affect the Nixpkgs version your packages and OS are pulled from,
  # so changing it will NOT upgrade your system - see https://nixos.org/manual/nixos/stable/#sec-upgrading for how
  # to actually do that.
  #
  # This value being lower than the current NixOS release does NOT mean your system is
  # out of date, out of support, or vulnerable.
  #
  # Do NOT change this value unless you have manually inspected all the changes it would make to your configuration,
  # and migrated your data accordingly.
  #
  # For more information, see `man configuration.nix` or https://nixos.org/manual/nixos/stable/options#opt-system.stateVersion .
  system.stateVersion = "24.05"; # Did you read the comment?

}

