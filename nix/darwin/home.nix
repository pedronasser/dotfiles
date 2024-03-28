{ home-manager, config, pkgs, lib, inputs, ... }:

let
  personal = import ./personal.nix;
in {
  users.users.${personal.username}.home = "/Users/${personal.username}";
  home-manager.users.${personal.username} = {
    imports = [
      ../shared/zsh.nix
    ];

    home.stateVersion = "23.05";

    home.sessionVariables = {
      EDITOR = "nvim";
      GIT_EDITOR = "nvim";
      LC_ALL = "en_US.UTF-8";
      LANG = "en_US.UTF-8";
    };

    home.shellAliases = {
	vim = "nvim";
    };

    home.packages = with pkgs; [
      #development
      helix
      git
      vim
      neovim
      tree-sitter
      curl
      jq
      unzip
      gcc
      wget
      openssl
      btop
      ripgrep
      nixpkgs-fmt
      coreutils-full
      findutils
      gzip
      fzf
      gnumake
      rustup
      python3
      sqlite

      #utils
      killall
      btop
    ];

    programs = {

      git = {
        enable = true;

        userName = personal.name;
        userEmail = personal.email;
      };

      fzf = rec {
        enable = true;
        defaultCommand = "fd --type f --strip-cwd-prefix";
        fileWidgetCommand = defaultCommand;
        enableZshIntegration = true;
      };


      lazygit = {
        enable = true;
      };

      # programs.home-manager.enable = true;
      bat.enable = true;
    };

    # https://github.com/nix-community/home-manager/issues/3344
    manual.manpages.enable = false;
  };
}
