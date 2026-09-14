{pkgs, ...}: {
  programs.helix = {
    languages = {
      language = [
        {
          name = "css";
          language-servers = [
            "tailwindcss-ls"
            "vscode-css-language-server"
          ];
        }
        {
          name = "html";
          language-servers = [
            "tailwindcss-ls"
            "emmet"
            "vscode-html-language-server"
          ];
        }
        {
          name = "javascript";
          auto-format = true;
        }
        {
          name = "jsx";
          auto-format = true;
          language-servers = [
            "tailwindcss-ls"
            "emmet"
            "typescript-language-server"
          ];
        }
        {
          name = "typescript";
          auto-format = true;
        }
        {
          name = "tsx";
          auto-format = true;
          language-servers = [
            "tailwindcss-ls"
            "emmet"
            "typescript-language-server"
          ];
        }
        {
          name = "svelte";
          auto-format = true;
          language-servers = [
            "emmet"
            "tailwindcss-ls"
            "svelteserver"
          ];
        }
        {
          name = "astro";
          auto-format = true;
          language-servers = [
            "emmet"
            "tailwindcss-ls"
            "astro-ls"
          ];
        }
      ];

      language-server = {
        emmet = {
          command = "emmet-language-server";
          args = ["--stdio"];
        };
        typescript-language-server = {
          config = {
            typescript-language-server.source = {
              addMissingImports.ts = true;
              fixAll.ts = true;
              organizeImports.ts = true;
              removeUnusedImports.ts = true;
              sortImports.ts = true;
            };
          };
        };
      };
    };

    extraPackages = with pkgs; [
      vscode-langservers-extracted
      tailwindcss-language-server
      emmet-language-server
      typescript-language-server
      svelte-language-server
      astro-language-server
    ];

    steelixGrammarOverrides = [
      {
        name = "css";
        fetcher = "github";
        owner = "tree-sitter";
        repo = "tree-sitter-css";
        rev = "6e327db434fec0ee90f006697782e43ec855adf5";
        hash = "sha256-en379DlqzzvQNvKgE8CtiA00j7phUyipttqbnETGHKc=";
      }
      {
        name = "javascript";
        fetcher = "github";
        owner = "tree-sitter";
        repo = "tree-sitter-javascript";
        rev = "3a837b6f3658ca3618f2022f8707e29739c91364";
        hash = "sha256-apgWWYD0XOvH5c3BY7kAF7UYtwPJaEvJzC5aWvJ9YQ8=";
      }
      {
        name = "svelte";
        fetcher = "github";
        owner = "tree-sitter-grammars";
        repo = "tree-sitter-svelte";
        rev = "ae5199db47757f785e43a14b332118a5474de1a2";
        hash = "sha256-cH9h7i6MImw7KlcuVQ6XVKNjd9dFjo93J1JdTWmEpV4=";
      }
      {
        name = "tsx";
        fetcher = "github";
        owner = "tree-sitter";
        repo = "tree-sitter-typescript";
        rev = "75b3874edb2dc714fb1fd77a32013d0f8699989f";
        hash = "sha256-A0M6IBoY87ekSV4DfGHDU5zzFWdLjGqSyVr6VENgA+s=";
      }
      {
        name = "typescript";
        fetcher = "github";
        owner = "tree-sitter";
        repo = "tree-sitter-typescript";
        rev = "75b3874edb2dc714fb1fd77a32013d0f8699989f";
        hash = "sha256-A0M6IBoY87ekSV4DfGHDU5zzFWdLjGqSyVr6VENgA+s=";
      }
    ];
  };
}
