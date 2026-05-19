{
  inputs,
  lib,
  config,
  ...
}:
{
  imports = [
    inputs.nixcord.homeModules.nixcord
  ];
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
      themeLinks = [ ];
      frameless = false;
      plugins = {
        alwaysTrust = {
          enable = true;
          domain = true;
          file = true;
        };
        biggerStreamPreview.enable = true;
        ClearURLs.enable = true;
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
        OnePingPerDM.enable = true;
        reverseImageSearch.enable = true;
        shikiCodeblocks.enable = true;
        showAllMessageButtons.enable = true;
        spotifyCrack.enable = true;
        textReplace = {
          # regexRules = [
          #   {
          #     find = "(https:\/\/)bsky\.app(\/[^/]+\/[^/]+)(\$?.*)?$";
          #     replace = "$1fxbsky.app$2$3";
          #   }
          #   {
          #     find = "https\:\/\/(?:.*?twitter.*?|.*?x.*?)\.com\/([a-zA-Z0-9_]+\/status\/\d+)\S*src";
          #     replace = "[[source]](<https://fxtwitter.com/$1>) [[raw]](https://fxtwitter.com/$1.mp4)";
          #   }
          #   {
          #     find = "/https?:\/\/(?:(?:vm|www)\.)?tiktok\.com\/((?:(?=@)@.+?\/video|(?!@)).+)/gi";
          #     replace = "https://tiktxk.com/$1";
          #   }
          #   {
          #     find = "/(?:https?:\/\/)?(?:www\.)?instagram\.com\/(?<path>p|reel)\//gi";
          #     replace = "https://www.ddinstagram.com/$<path>/";
          #   }
          #   {
          #     find = "http(?:s)?://(?:[\w-]+?\.)?reddit\.com";
          #     replace = "https://rxddit.com";
          #   }
          #   {
          #     find = "https?:\/\/(?:clips\.twitch\.tv|(?:www\.)?twitch\.tv\/\w+\/clip)\/([A-Za-z0-9\-_]+)";
          #     replace = "https://fxtwitch.seria.moe/clip/$1";
          #   }
          #   {
          #     find = "(?:www\.)?youtube.com\/watch\?v=";
          #     replace = "youtu.be/";
          #   }
          # ];
        };
        unlockedAvatarZoom.enable = true;
        viewIcons.enable = true;
        youtubeAdblock.enable = true;
      };
    };
  };
}
