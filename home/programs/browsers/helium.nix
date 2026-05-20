{
  config,
  inputs,
  ...
}: {
  imports = [inputs.helium-browser.homeModules.default];

  programs.helium = {
    enable = true;

    commandLineArgs = [
      "--enable-features=UseOzonePlatform"
      "--ozone-platform=wayland"
    ];

    extensions = builtins.attrValues {
      "Angular DevTools" = "ienfalfjdbdpebioblfackkekamfmbnh";
      "Anti Adblock Detector" = "kjhdffcfinhkdfbbhjlfoadcdfgihmlp";
      "Catppuccin Chrome Theme - ${config.theme.flavor}" = let
        identifiers = {
          frappe = "olhelnoplefjdmncknfphenjclimckaf";
          latte = "jhjnalhegpceacdhbplhnakmkdliaddd";
          macchiato = "cmpdlhmnmjhihmcfnigoememnffkimlk";
          mocha = "bkkmolkhemgaeaeggcmfbghljjjoofoh";
        };
      in
        identifiers.${config.theme.flavor};
      "Catppuccin for Web File Explorer Icons" = "lnjaiaapbakfhlbjenjkhffcdpoompki";
      "Dark Reader" = "eimadpbcbfnmbkopoojfekhnkhdbieeh";
      "DeArrow - Better Titles and Thumbnails" = "enamippconapkdmgfgjchkhakpfinmaj";
      "Decentraleyes" = "ldpochfccmkkmhdbclfhpagapcfdljkj";
      "Enable right click - allow copy & select" = "mlloloooolpffjkjaclpfpeednngpjon";
      "Indie Wiki Buddy" = "fkagelmloambgokoeokbpihmgpkbgbfm";
      "MetaMask" = "nkbihfbeogaeaoehlefnkodbefgpgknn";
      "Microslop" = "mlidmgkpgfmogmplpgifmkbhohpioknp";
      "Modrinthify" = "gjjlcbppchpjacimpkjhoancdbdmpcoc";
      "nightTab" = "hdpcadigjkbcpnlcpbcohpafiaefanki";
      "Privacy Badger" = "pkehgijcmpdhfbdbbnkijodmdjhbjlgp";
      "React Developer Tools" = "fmkadmapgofadopljbjfkapdkoienihi";
      "Return YouTube Dislike" = "gebbhagfogifgggkldgodflihgfeippi";
      "SponsorBlock for YouTube - Skip Sponsorships" = "mnjggcdmjocbbbhaepdhchncahnbgone";
      "Stylus (beta)" = "apmmpaebfobifelkijhaljbmpcgbjbdo";
      "Svelte DevTools" = "kfidecgcdjjfpeckbblhmfkhmlgecoff";
      "Tampermonkey" = "dhdgffkkebhmkfjojejmpbldmpobfkfo";
      "uBlock Origin" = "cjpalhdlnbpafiamejdnhcphjbkeiagm";
      "Vimium" = "dbepggeogbaibhgnhhndojpepiihcmeb";
      "Vue.js devtools" = "nhdogjmejiglipccpnnnanhbledajbpd";
      "Wappalyzer - Technology profiler" = "gppongmhjkpfnbhagpmjfkannfbllamg";
      "Remove YouTube Shorts" = "mgngbgbhliflggkamjnpdmegbkidiapm";
    };
  };
}
