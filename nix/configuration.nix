
{ config, pkgs, unstable, nixpkgs-unstable, ... }:

{
  imports =
    [ # Include the results of the hardware scan.
      ./amogus-hardware-configuration.nix
    ];

  nix = {
    registry.nixpkgs.flake = nixpkgs-unstable;
    settings = {
      experimental-features = [ "nix-command" "flakes" ];
      auto-optimise-store = true;
    };
  };

  boot = {
    loader.systemd-boot.enable = true;
    loader.efi.canTouchEfiVariables = true;

    tmp.useTmpfs = true;

    # Enable sysrq for emergency REISUB etc
    kernel.sysctl."kernel.sysrq" = 502;
  };

 networking = {
  hostName = "amogus";
  networkmanager.enable = true;

  # wpa_supplicant.
  wireless.enable = false;

  nameservers = [ "1.1.1.1" "1.0.0.1"];

  # Configure network proxy if necessary
  #networking.proxy.default = "http://user:password@proxy:port/";
  #networking.proxy.noProxy = "127.0.0.1,localhost,internal.domain";
 };

  time.timeZone = "Europe/Berlin";

  i18n = {
    defaultLocale = "en_US.UTF-8";

    extraLocaleSettings = {
      LC_ADDRESS = "de_DE.UTF-8";
      LC_IDENTIFICATION = "de_DE.UTF-8";
      LC_MEASUREMENT = "de_DE.UTF-8";
      LC_MONETARY = "de_DE.UTF-8";
      LC_NAME = "de_DE.UTF-8";
      LC_NUMERIC = "de_DE.UTF-8";
      LC_PAPER = "de_DE.UTF-8";
      LC_TELEPHONE = "de_DE.UTF-8";
      LC_TIME = "de_DE.UTF-8";
    };
  };


  services.xserver = {
    enable = true;

    displayManager.gdm.enable = true;
    desktopManager.gnome.enable = true;

    layout = "de";
    xkbVariant = "us";
  };

  xdg.portal.enable = true;

  console.keyMap = "de";

  # Enable CUPS to print documents.
  services.printing.enable = true;

  # Enable SANE for scanner support
  hardware.sane.enable = true;

  # Enable sound with pipewire.
  sound.enable = true;
  hardware.pulseaudio.enable = false;
  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
    # If you want to use JACK applications, uncomment this
    #jack.enable = true;

    # use the example session manager (no others are packaged yet so this is enabled by default,
    # no need to redefine it in your config for now)
    #media-session.enable = true;
  };

  hardware.bluetooth = {
    enable = true;
    # powerOnBoot = true
  };

  hardware.opengl.enable = true;

  security.pam.services.swaylock = {};

  security.sudo.wheelNeedsPassword = false;

  # Enable touchpad support (enabled default in most desktopManager).
  # services.xserver.libinput.enable = true;

  users.users.darius = {
    isNormalUser = true;
    description = "Darius Schefer";
    extraGroups = [ "networkmanager" "wheel" "docker" "scanner" "lp" ];
    shell = pkgs.zsh;
    packages = with pkgs; [
      firefox
    ];
  };

  nixpkgs.config.allowUnfree = true;

  environment.systemPackages = with pkgs; [

    unstable.alacritty
    unstable.neovim

    gcc
    clang-tools
    nodejs_20

    file
    unzip
    wget
    htop
    man-pages
    man-pages-posix
    git
    git-lfs
    gnupg
    openssh
    pass
    stow
    ripgrep
    fd
    fzf
    zoxide
    brightnessctl
    pamixer
    networkmanager-openvpn
    poppler_utils

    texlive.combined.scheme-full

    zathura
    imv
    mpv
    thunderbird
    zotero

    emacs29-pgtk
    auctex
    hunspell
    hunspellDicts.en_US

    noto-fonts
    noto-fonts-color-emoji
    nerdfonts
    iosevka-comfy.comfy-fixed
    roboto
    font-awesome

    libnotify
    mako

    wdisplays
    waybar
    rofi-wayland
    swww
    slurp
    grim
    swappy
    wl-clipboard
    networkmanagerapplet
    pavucontrol
    swaylock
    swayidle
  ];

  # Add manpages for libraries and development utilities
  documentation.dev.enable = true;

  programs.steam = {
    enable = true;
    remotePlay.openFirewall = true;
    dedicatedServer.openFirewall = true;
  };

  programs.hyprland = {
    enable = true;
    xwayland.enable = true;
    package = unstable.hyprland;
  };

  programs.zsh.enable = true;

  programs.mtr.enable = true;
  programs.gnupg.agent = {
    enable = true;
    pinentryFlavor = "gnome3";
    enableSSHSupport = true;
  };

  virtualisation.docker.enable = true;

  # List services that you want to enable:

  services.blueman.enable = true;

  services.dbus.packages = [ pkgs.gcr ];
  services.gnome.gnome-keyring.enable = true;

  services.logind.extraConfig = ''
    HandlePowerKey=suspend
  '';

  # Enable the OpenSSH daemon.
  services.openssh.enable = true;

  # Open ports in the firewall.
  # networking.firewall.allowedTCPPorts = [ ... ];
  # networking.firewall.allowedUDPPorts = [ ... ];
  # Or disable the firewall altogether.
  # networking.firewall.enable = false;

  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It‘s perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "23.11"; # Did you read the comment?

}
