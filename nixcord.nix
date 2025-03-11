{inputs, ...}: {
  imports = [
    inputs.nixcord.homeManagerModules.nixcord
  ];
  #  xdg.configFile."vesktop/themes".source = vesktop/themes;
  programs.nixcord = {
    enable = true;
    vesktop.enable = true;
    discord.enable = false;
    # discord.openASAR.enable = true;
    userPlugins = {
      #systemEmoji = ./vesktop/vc-system-emoji;
      #betterActivities = "github:D3SOX/vc-betterActivities/044b504666b8b753ab45d82c0cd0d316b1ea7e60";
    };
    extraConfig = {
      plugins = {
        #systemEmoji.enable = true;
        #betterActivities.enable = true;
      };
    };
    config = {
      useQuickCss = true; # use out quickCSS
      transparent = true;
      themeLinks = [];
      frameless = false;
      plugins = {
        alwaysTrust = {
          enable = true;
          domain = true;
          file = true;
        };
        biggerStreamPreview.enable = true;
        clearURLs.enable = true;
        fakeNitro.enable = true;
        favoriteEmojiFirst.enable = true;
        favoriteGifSearch.enable = true;
        fixCodeblockGap.enable = true;
        fixImagesQuality.enable = true;
        fixSpotifyEmbeds.enable = true;
        fixYoutubeEmbeds.enable = true;
        gameActivityToggle.enable = true;
        keepCurrentChannel.enable = true;
        messageClickActions.enable = true;
        messageLinkEmbeds.enable = true;
        noF1.enable = true;
        noTypingAnimation.enable = true;
        noUnblockToJump.enable = true;
        nsfwGateBypass.enable = true;
        onePingPerDM.enable = true;
        reverseImageSearch.enable = true;
        shikiCodeblocks.enable = true;
        showAllMessageButtons.enable = true;
        spotifyCrack.enable = true;
        unlockedAvatarZoom.enable = true;
        viewIcons.enable = true;
        youtubeAdblock.enable = true;
      };
    };
  };
}
