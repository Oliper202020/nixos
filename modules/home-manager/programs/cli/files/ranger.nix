{
  programs.ranger = {
    enable = true;
    mappings = {
      y = "move left=1";
      n = "move down=1";
      e = "move up=1";
      o = "move right=1";

      Y = "history_go -1";
      N = "move down=0.5 pages=True";
      E = "move up=0.5 pages=True";
      O = "history_go 1";

      #y = "pager_move left=4";
      #n = "pager_move down=1";
      #e = "pager_move up=1";
      #o = "pager_move right=4";

  #    y = "taskview_move left=4";
   #   n = "taskview_move down=1";
    #  e = "taskview_move up=1";
     # o = "taskview_move right=4";


    };
    # settings = {
    #preview_images = true;
    #  preview_images_method = "kitty";
    #  };
  };
}
