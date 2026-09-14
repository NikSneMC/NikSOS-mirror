{
  programs.nixcord.config.plugins.gifCollections = {
    enable = true;
    collectionPrefix = "gc:";
    collectionsSortOrder = "asc";
    collectionsSortType = 1;
    defaultEmptyCollectionImage = "https://c.tenor.com/YEG33HsLEaIAAAAC/parksandrec-oops.gif";
    itemPrefix = "gc-item:";
    onlyShowCollections = false;
    preventDuplicates = false;
    showCopyImageLink = false;
    stopWarnings = false;
  };
}
