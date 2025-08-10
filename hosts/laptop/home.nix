{ config, pkgs, ...}: {
  home.username = "palikin";
  home.homeDirectory = "/home/palikin";

  programs = {
    # alacritty.enable = true;
    # fuzzel.enable = true;
    # swaylock.enable = true;
    # waybar.enable = true;
    git = {
      enable = true;
      userName = "kromzem";
      userEmail = "palikin@tutamail.com";
      extraConfig = {
        pull.rebase = false;
      };
    };
  };

  services.mako.enable = true;
  services.swayidle.enable = true;

  programs.bash = {
    enable = true;
    enableCompletion = true;
    # TODO add your custom bashrc here
    # bashrcExtra = '''';

    profileExtra = ''
      export XDG_DATA_DIRS=$XDG_DATA_DIRS:/usr/share:/var/lib/flatpak/exports/share:$HOME/.local/share/flatpak/exports/share

      # Added by Toolbox App
      export PATH="$PATH:/home/palikin/.local/share/JetBrains/Toolbox/scripts"
    '';

    # set some aliases, feel free to add more or remove some
    shellAliases = {
      ll = "ls -l";
      gp = "sudo -E gparted";
    };
  };

    # This value determines the home Manager release that your
  # configuration is compatible with. This helps avoid breakage
  # when a new home Manager release introduces backwards
  # incompatible changes.
  #
  # You can update home Manager without changing this value. See
  # the home Manager release notes for a list of state version
  # changes in each release.
  home.stateVersion = "24.11";

  # Let home Manager install and manage itself.
  programs.home-manager.enable = true;
}
