{ config, pkgs, inputs, ... }:

{
  imports = [
    inputs.nixcord.homeManagerModules.nixcord
  ];
  xdg.configFile."Vencord/themes".source = ./themes;
  programs.nixcord = {
    enable = true;
    discord.vencord.unstable = true;
    config = {
      transparent = true;
      themeLinks = [ ];
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
