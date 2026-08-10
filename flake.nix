# DO-NOT-EDIT. This file was auto-generated using github:vic/flake-file.
# Use `nix run .#write-flake` to regenerate it.
{
  outputs = inputs:
    inputs.flake-parts.lib.mkFlake {inherit inputs;}
    ((inputs.import-tree.match ".*/module\\.nix") ./modules);

  inputs = {
    agenix = {
      url = "github:ryantm/agenix";
      inputs = {
        darwin.follows = "";
        home-manager.follows = "home-manager";
        nixpkgs.follows = "nixpkgs";
        systems.follows = "systems";
      };
    };
    assets = {
      url = "git+https://codeberg.org/NikSne/NikSOS?ref=assets";
      flake = false;
    };
    catppuccin.url = "github:catppuccin/nix";
    den.url = "github:denful/den/v0.18.0";
    discord-rpc-lsp = {
      url = "gitlab:invra/discord-rpc-lsp";
      inputs.flake-utils.follows = "flake-utils";
    };
    disko = {
      url = "github:nix-community/disko";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    flake-compat.url = "github:NixOS/flake-compat";
    flake-file.url = "github:vic/flake-file";
    flake-parts = {
      url = "github:hercules-ci/flake-parts";
      inputs.nixpkgs-lib.follows = "nixpkgs";
    };
    flake-utils = {
      url = "github:numtide/flake-utils";
      inputs.systems.follows = "systems";
    };
    git-helper = {
      url = "github:NiKSneMC/git-helper";
      inputs = {
        flake-compat.follows = "flake-compat";
        flake-parts.follows = "flake-parts";
        naersk = {
          follows = "naersk";
          inputs.nixpkgs.follows = "git-helper/nixpkgs";
        };
        systems.follows = "systems";
      };
    };
    git-hooks = {
      url = "github:cachix/git-hooks.nix";
      inputs = {
        flake-compat.follows = "flake-compat";
        nixpkgs.follows = "nixpkgs";
      };
    };
    gitignore = {
      url = "github:hercules-ci/gitignore.nix";
      inputs.nixpkgs.follows = "nixpkgs";
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
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    import-tree.url = "github:vic/import-tree";
    master.url = "github:NixOS/nixpkgs/master";
    naersk = {
      url = "github:nix-community/naersk";
      inputs = {
        fenix.inputs.rust-analyzer-src.follows = "";
        nixpkgs.follows = "";
      };
    };
    niri = {
      url = "github:sodiboo/niri-flake";
      inputs = {
        niri-stable.follows = "";
        nixpkgs-stable.follows = "";
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
        flake-compat.follows = "flake-compat";
        flake-parts.follows = "flake-parts";
      };
    };
    nix-index-database = {
      url = "github:nix-community/nix-index-database";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    nixcord = {
      url = "github:4evy/nixcord";
      inputs = {
        flake-compat.follows = "flake-compat";
        flake-parts.follows = "flake-parts";
        nixpkgs.follows = "nixpkgs";
        nixpkgs-nixcord.follows = "nixpkgs";
      };
    };
    nixos-hardware = {
      url = "github:NixOS/nixos-hardware";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    nixpkgs.follows = "unstable";
    noctalia.url = "github:noctalia-dev/noctalia/cachix";
    noctalia-greeter.url = "github:noctalia-dev/noctalia-greeter";
    noctalia-plugins-community = {
      url = "github:noctalia-dev/community-plugins";
      flake = false;
    };
    noctalia-plugins-official = {
      url = "github:noctalia-dev/official-plugins";
      flake = false;
    };
    rio = {
      url = "github:raphamorim/rio";
      inputs = {
        flake-parts.follows = "flake-parts";
        rust-overlay = {
          follows = "rust-overlay";
          inputs.nixpkgs.follows = "rio/nixpkgs";
        };
        systems.follows = "systems";
      };
    };
    rust-overlay = {
      url = "github:oxalica/rust-overlay";
      inputs.nixpkgs.follows = "";
    };
    spicetify-nix = {
      url = "github:Gerg-L/spicetify-nix";
      inputs = {
        nixpkgs.follows = "nixpkgs";
        systems.follows = "systems";
      };
    };
    stable.url = "github:NixOS/nixpkgs/nixos-26.05";
    system-manager = {
      url = "github:numtide/system-manager";
      inputs = {
        flake-compat.follows = "flake-compat";
        userborn.inputs = {
          flake-parts.follows = "flake-parts";
          pre-commit-hooks-nix.follows = "git-hooks";
          systems.follows = "systems";
        };
      };
    };
    systems.url = "github:nix-systems/default";
    templates = {
      url = "github:NikSneMC/templates";
      inputs = {
        flake-compat.follows = "flake-compat";
        flake-parts.follows = "flake-parts";
        git-hooks.follows = "git-hooks";
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
    unstable.url = "github:NixOS/nixpkgs/nixos-unstable";
    wakatime-ls = {
      url = "github:mrnossiom/wakatime-ls";
      inputs = {
        gitignore.follows = "gitignore";
        rust-overlay = {
          follows = "rust-overlay";
          inputs.nixpkgs.follows = "wakatime-ls/nixpkgs";
        };
      };
    };
    zen-browser = {
      url = "github:0xc000022070/zen-browser-flake";
      inputs = {
        home-manager.follows = "home-manager";
        nixpkgs.follows = "nixpkgs";
      };
    };
  };
}
