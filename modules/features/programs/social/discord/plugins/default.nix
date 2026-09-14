{
  imports = [
    ./extra

    ./accountPanelServerProfile.nix
    ./advancedPermissions.nix
    ./betterActivities.nix
    ./betterCommands.nix
    ./betterForwards.nix
    ./betterRoleContext.nix
    ./betterSessions.nix
    ./channelTabs.nix
    ./customTimestamps.nix
    ./dragify.nix
    ./equibopStreamFixes.nix
    ./experiments.nix
    ./exportMessages.nix
    ./fakeNitro.nix
    ./findReply.nix
    ./friendshipRanks.nix
    ./gifCollections.nix
    ./gitHubRepos.nix
    ./googleThat.nix
    ./inviteDefaults.nix
    ./keyboardNavigation.nix
    ./messageBurst.nix
    ./messageLatency.nix
    ./moreQuickReactions.nix
    ./musicControls.nix
    ./newGuildSettings.nix
    ./pictureInPicture.nix
    ./platformSpoofer.nix
    ./quoter.nix
    ./relationshipNotifier.nix
    ./replaceGoogleSearch.nix
    ./scheduledMessages.nix
    ./settings.nix
    ./shikiCodeblocks.nix
    ./silentMessageToggle.nix
    ./songLink.nix
    ./sortFriendRequests.nix
    ./splitLargeMessages.nix
    ./spotifyCrack.nix
    ./timezones.nix
    ./typingIndicator.nix
    ./universalMention.nix
    ./unlimitedAccounts.nix
    ./viewRaw.nix
    ./voiceRejoin.nix
    ./volumeBooster.nix
  ];

  programs.nixcord.config.plugins = {
    anonymiseFileNames.enable = true;
    betterBlockedUsers.enable = true;
    betterGifAltText.enable = true;
    betterGifPicker.enable = true;
    betterInvites.enable = true;
    betterSettings.enable = true;
    betterUploadButton.enable = true;
    biggerStreamPreview.enable = true;
    blurNsfw.enable = true;
    callTimer.enable = true;
    characterCounter.enable = true;
    clearUrls.enable = true;
    consoleJanitor.enable = true;
    consoleShortcuts.enable = true;
    copyEmojiMarkdown.enable = true;
    copyFileContents.enable = true;
    copyProfileColors.enable = true;
    copyStatusUrls.enable = true;
    copyStickerLinks.enable = true;
    copyUserMention.enable = true;
    copyUserUrls.enable = true;
    crashHandler.enable = true;
    dearrow.enable = true;
    decor.enable = true;
    disableCallIdle.enable = true;
    disableCameras.enable = true;
    disableDeepLinks.enable = true;
    dontRoundMyTimestamps.enable = true;
    downloadAllAttachments.enable = true;
    expressionCloner.enable = true;
    favoriteEmojiFirst.enable = true;
    fixCodeblockGap.enable = true;
    fixFileExtensions.enable = true;
    fixImagesQuality.enable = true;
    fixSpotifyEmbeds.enable = true;
    fixYoutubeEmbeds.enable = true;
    forceOwnerCrown.enable = true;
    friendCodes.enable = true;
    friendInvites.enable = true;
    fullSearchContext.enable = true;
    fullUserInChatbox.enable = true;
    gameActivityToggle.enable = true;
    gifPaste.enable = true;
    greetStickerPicker.enable = true;
    guildPickerDumper.enable = true;
    homeTyping.enable = true;
    iLoveSpam.enable = true;
    iRememberYou.enable = true;
    iconViewer.enable = true;
    imageFilename.enable = true;
    imageLink.enable = true;
    imageZoom.enable = true;
    implicitRelationships.enable = true;
    jumpTo.enable = true;
    keepCurrentChannel.enable = true;
    lastActive.enable = true;
    memberCount.enable = true;
    mentionAvatars.enable = true;
    messageClickActions.enable = true;
    messageLinkEmbeds.enable = true;
    messageLogger.enable = true;
    mutualGroupDms.enable = true;
    noDevtoolsWarning.enable = true;
    noNitroUpsell.enable = true;
    noOnboardingDelay.enable = true;
    noTypingAnimation.enable = true;
    noUnblockToJump.enable = true;
    normalizeMessageLinks.enable = true;
    pauseInvitesForever.enable = true;
    permissionFreeWill.enable = true;
    permissionsViewer.enable = true;
    petpet.enable = true;
    plainFolderIcon.enable = true;
    platformIndicators.enable = true;
    quickMention.enable = true;
    reactErrorDecoder.enable = true;
    readAllNotificationsButton.enable = true;
    replyTimestamp.enable = true;
    revealAllSpoilers.enable = true;
    reverseImageSearch.enable = true;
    reviewDb.enable = true;
    roleColorEverywhere.enable = true;
    searchFix.enable = true;
    secretRingToneEnabler.enable = true;
    sendTimestamps.enable = true;
    serverInfo.enable = true;
    showConnections.enable = true;
    showHiddenChannels.enable = true;
    showHiddenThings.enable = true;
    showMeYourName.enable = true;
    showTimeoutDuration.enable = true;
    silentTyping.enable = true;
    spotifyControls.enable = true;
    spotifyShareCommands.enable = true;
    startupTimings.enable = true;
    stickerPaste.enable = true;
    streamerModeOnStream.enable = true;
    tenorGifSearch.enable = true;
    themeAttributes.enable = true;
    translate.enable = true;
    typingTweaks.enable = true;
    unindent.enable = true;
    unlockedAvatarZoom.enable = true;
    userMessagesPronouns.enable = true;
    userVoiceShow.enable = true;
    usrbg.enable = true;
    validReply.enable = true;
    validUser.enable = true;
    viewIcons.enable = true;
    voiceChatDoubleClick.enable = true;
    voiceDownload.enable = true;
    voiceMessages.enable = true;
    voiceStats.enable = true;
    webContextMenus.enable = true;
    webKeybinds.enable = true;
    webScreenShareFixes.enable = true;
    whoReacted.enable = true;
    youtubeAdblock.enable = true;
    zipPreview.enable = true;
  };
}
