{
  description = "NikSne's NixOS and Home-Manager flake";

  outputs = inputs:
    inputs.flake-parts.lib.mkFlake {inherit inputs;} {
      systems = ["x86_64-linux"];

      imports = [
        ./home/profiles
        ./hosts
        ./lib
        ./modules
        ./git-hooks.nix
      ];

      perSystem = {
        config,
        pkgs,
        ...
      }:
        with pkgs; {
          devShells.default = mkShell {
            name = "niksos";
            DIRENV_LOG_FORMAT = "";

            packages = [
              alejandra
              deadnix
              git
            ];

            shellHook = ''
              ${config.pre-commit.installationScript}
            '';
          };

          formatter = alejandra;
        };
    };

  inputs = {
    # important
    master.url = "github:NixOS/nixpkgs/master";
    unstable.url = "github:NixOS/nixpkgs/nixos-unstable";
    stable.url = "github:NixOS/nixpkgs/nixos-26.05";

    nixpkgs.follows = "unstable";

    nixos-hardware = {
      url = "github:NixOS/nixos-hardware";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    assets = {
      url = "github:NikSneMC/NikSOS/assets";
      flake = false;
    };

    systems.url = "github:nix-systems/default";

    flake-parts = {
      url = "github:hercules-ci/flake-parts";
      inputs.nixpkgs-lib.follows = "nixpkgs";
    };

    flake-utils = {
      url = "github:numtide/flake-utils";
      inputs.systems.follows = "systems";
    };

    private = {
      url = "github:NikSneMC/NikSOS-private";
      inputs = {
        nixpkgs.follows = "nixpkgs";
        flake-compat.follows = "";
        flake-utils.follows = "flake-utils";
      };
    };

    git-hooks = {
      url = "github:cachix/git-hooks.nix";
      inputs = {
        nixpkgs.follows = "nixpkgs";
        flake-compat.follows = "";
      };
    };

    templates = {
      url = "github:NikSneMC/templates";
      inputs = {
        nixpkgs.follows = "nixpkgs";
        flake-compat.follows = "";
        systems.follows = "systems";
        flake-parts.follows = "flake-parts";
        git-hooks.follows = "git-hooks";
      };
    };

    naersk = {
      url = "github:nix-community/naersk";
      inputs = {
        nixpkgs.follows = "";
        fenix.inputs.rust-analyzer-src.follows = "";
      };
    };

    rust-overlay = {
      url = "github:oxalica/rust-overlay";
      inputs.nixpkgs.follows = "";
    };

    agenix = {
      url = "github:ryantm/agenix";
      inputs = {
        nixpkgs.follows = "nixpkgs";
        darwin.follows = "";
        home-manager.follows = "hm";
        systems.follows = "systems";
      };
    };

    disko = {
      url = "github:nix-community/disko";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    hm = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    catppuccin.url = "github:catppuccin/nix";

    # common
    danksearch.url = "github:AvengeMedia/danksearch";

    discord-rpc-lsp = {
      url = "gitlab:invra/discord-rpc-lsp";
      inputs.flake-utils.follows = "flake-utils";
    };

    dms = {
      url = "github:AvengeMedia/DankMaterialShell";
      inputs.flake-compat.follows = "";
    };

    dms-plugin-registry = {
      url = "github:AvengeMedia/dms-plugin-registry";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    git-helper = {
      url = "github:NiKSneMC/git-helper";
      inputs = {
        flake-compat.follows = "";
        flake-parts.follows = "flake-parts";
        systems.follows = "systems";
        naersk = {
          follows = "naersk";
          inputs.nixpkgs.follows = "git-helper/nixpkgs";
        };
      };
    };

    helium-browser = {
      url = "github:cjavad/nixpille-helium";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    helix = {
      url = "github:NikSneMC/helix";
      inputs.rust-overlay = {
        follows = "rust-overlay";
        inputs.nixpkgs.follows = "helix/nixpkgs";
      };
    };

    niri = {
      url = "github:sodiboo/niri-flake";
      inputs = {
        nixpkgs-stable.follows = "";
        niri-stable.follows = "";
        xwayland-satellite-stable.follows = "";
      };
    };

    niri-autoselect-portal = {
      url = "git+https://codeberg.org/debugloop/niri-autoselect-portal.git";
      inputs.pre-commit-hooks.follows = "git-hooks";
    };

    nix-cachyos-kernel = {
      url = "github:xddxdd/nix-cachyos-kernel/release";
      inputs = {
        flake-compat.follows = "";
        flake-parts.follows = "flake-parts";
      };
    };

    nix-index-database = {
      url = "github:nix-community/nix-index-database";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    nixos-avf = {
      url = "github:NikSneMC/nixos-avf";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    nixos-wsl = {
      url = "github:nix-community/NixOS-WSL";
      inputs = {
        nixpkgs.follows = "nixpkgs";
        flake-compat.follows = "";
      };
    };

    spicetify-nix = {
      url = "github:Gerg-L/spicetify-nix";
      inputs = {
        nixpkgs.follows = "nixpkgs";
        systems.follows = "systems";
      };
    };

    try-rs = {
      url = "github:tassiovirginio/try-rs";
      inputs = {
        flake-utils.follows = "flake-utils";
        rust-overlay = {
          follows = "rust-overlay";
          inputs.nixpkgs.follows = "try-rs/nixpkgs";
        };
      };
    };

    wakatime-ls = {
      url = "github:mrnossiom/wakatime-ls";
      inputs = {
        gitignore.follows = "git-hooks/gitignore";
        rust-overlay = {
          follows = "rust-overlay";
          inputs.nixpkgs.follows = "wakatime-ls/nixpkgs";
        };
      };
    };

    zen-browser = {
      url = "github:0xc000022070/zen-browser-flake";
      inputs = {
        nixpkgs.follows = "nixpkgs";
        home-manager.follows = "hm";
      };
    };
  };
}
