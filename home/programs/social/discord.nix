{
  config,
  inputs,
  ...
}: {
  imports = [inputs.nixcord.homeModules.nixcord];
  programs.nixcord = {
    enable = true;

    discord.vencord.enable = true;
    vesktop = {
      enable = true;
      settings = {
        tray = true;
        minimizeToTray = true;
        arRPC = true;
        staticTitle = true;
        trayMainOverride = false;
        splashColor = "#${config.theme.colors.text}";
        splashBackground = "#${config.theme.colors.base}";
        trayColorType = "custom";
        trayAutoFill = "auto";
        disableMinSize = true;
        splashAnimationPath = "/var/lib/AccountsService/icons/${config.home.user}";
      };
    };

    config = {
      autoUpdate = true;
      autoUpdateNotification = true;
      disableMinSize = true;
      enabledThemeLinks = [
        "https://catppuccin.github.io/discord/dist/catppuccin-${config.theme.flavor}-${config.theme.accent}.theme.css"
        "https://raw.githubusercontent.com/NikSneMC/discord-css/main/jetbrainsmono-nerd-font.css"
        "https://raw.githubusercontent.com/NikSneMC/discord-css/main/make-discord-ui-great-again.css"
      ];
      enableReactDevtools = true;
      frameless = true;
      notifyAboutUpdates = true;

      plugins = {
        accountPanelServerProfile = {
          enable = true;
          prioritizeServerProfile = true;
        };
        anonymiseFileNames.enable = true;
        betterGifAltText.enable = true;
        betterGifPicker.enable = true;
        betterRoleContext = {
          enable = true;
          roleIconFileFormat = "webp";
        };
        betterSessions = {
          enable = true;
          backgroundCheck = true;
        };
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
        copyStickerLinks.enable = true;
        copyUserUrls.enable = true;
        crashHandler.enable = true;
        dearrow.enable = true;
        decor.enable = true;
        disableCallIdle.enable = true;
        disableDeepLinks.enable = true;
        dontRoundMyTimestamps.enable = true;
        expressionCloner.enable = true;
        fakeNitro = {
          enable = true;
          transformCompoundSentence = true;
          disableEmbedPermissionCheck = true;
        };
        favoriteEmojiFirst.enable = true;
        favoriteGifSearch.enable = true;
        fixCodeblockGap.enable = true;
        fixImagesQuality.enable = true;
        fixSpotifyEmbeds.enable = true;
        fixYoutubeEmbeds.enable = true;
        forceOwnerCrown.enable = true;
        friendInvites.enable = true;
        fullSearchContext.enable = true;
        fullUserInChatbox.enable = true;
        gameActivityToggle.enable = true;
        gifPaste.enable = true;
        greetStickerPicker.enable = true;
        ignoreActivities = {
          listMode = 1;
        };
        iLoveSpam.enable = true;
        imageFilename.enable = true;
        imageLink.enable = true;
        imageZoom.enable = true;
        implicitRelationships.enable = true;
        keepCurrentChannel.enable = true;
        memberCount.enable = true;
        mentionAvatars.enable = true;
        messageClickActions.enable = true;
        messageLatency = {
          enable = true;
          showMillis = true;
        };
        messageLinkEmbeds.enable = true;
        messageLogger.enable = true;
        moreQuickReactions = {
          enable = true;
          reactionCount = 7;
        };
        mutualGroupDms.enable = true;
        newGuildSettings = {
          guild = false;
          everyone = false;
          role = false;
          highlights = false;
          events = false;
        };
        noDevtoolsWarning.enable = true;
        noOnboardingDelay.enable = true;
        noTypingAnimation.enable = true;
        noUnblockToJump.enable = true;
        pauseInvitesForever.enable = true;
        permissionFreeWill.enable = true;
        permissionsViewer.enable = true;
        petpet.enable = true;
        pictureInPicture = {
          enable = true;
          loop = false;
        };
        pinDms = {
          enable = true;
          pinOrder = 1;
          canCollapseDmSection = true;
          userBasedCategoryList = {
            "760511113795207168" = [];
          };
        };
        plainFolderIcon.enable = true;
        platformIndicators.enable = true;
        quickMention.enable = true;
        reactErrorDecoder.enable = true;
        readAllNotificationsButton.enable = true;
        relationshipNotifier = {
          enable = true;
          notices = true;
        };
        replaceGoogleSearch = {
          enable = true;
          replacementEngine = "custom";
          customEngineName = "DuckDuckGo";
        };
        replyTimestamp.enable = true;
        revealAllSpoilers.enable = true;
        reverseImageSearch.enable = true;
        reviewDb.enable = true;
        roleColorEverywhere.enable = true;
        secretRingToneEnabler.enable = true;
        sendTimestamps.enable = true;
        serverInfo.enable = true;
        shikiCodeblocks = {
          enable = true;
          theme = "https://raw.githubusercontent.com/shikijs/textmate-grammars-themes/bc5436518111d87ea58eb56d97b3f9bec30e6b83/packages/tm-themes/themes/catppuccin-mocha.json";
          useDevIcon = "COLOR";
        };
        showConnections.enable = true;
        showHiddenChannels.enable = true;
        showHiddenThings.enable = true;
        showMeYourName.enable = true;
        showTimeoutDuration.enable = true;
        silentMessageToggle = {
          enable = true;
          persistState = "restarts";
        };
        silentTyping.enable = true;
        sortFriendRequests = {
          enable = true;
          showDates = true;
        };
        spotifyControls.enable = true;
        spotifyCrack = {
          enable = true;
          keepSpotifyActivityOnIdle = true;
        };
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
        viewRaw = {
          enable = true;
          messageContextMenu = true;
        };
        voiceChatDoubleClick.enable = true;
        voiceDownload.enable = true;
        voiceMessages.enable = true;
        volumeBooster = {
          enable = true;
          multiplier = 5.;
        };
        webContextMenus.enable = true;
        webKeybinds.enable = true;
        webScreenShareFixes.enable = true;
        whoReacted.enable = true;
        youtubeAdblock.enable = true;
      };
    };
    extraConfig.plugins = {
      fakeNitro = {
        useHyperLinks = true;
      };
      messageClickActions = {
        enableDeleteOnClick = true;
        enableDoubleClickToEdit = true;
        enableDoubleClickToReply = true;
        requireModifier = false;
      };
      platformIndicators = {
        badges = true;
      };
      showHiddenChannels = {
        hideUnreads = true;
      };
      showMeYourName = {
        mode = "nick-user";
        friendNicknames = "dms";
        displayNames = false;
        inReplies = true;
      };
      silentTyping = {
        showIcon = false;
        contextMenu = true;
        isEnabled = true;
      };
    };
  };
}
