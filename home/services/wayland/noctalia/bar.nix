{inputs, ...}: {
  programs.noctalia.settings = {
    widget = {
      launcher = {
        type = "launcher";
        custom_image = "${inputs.assets}/niksos/niksos100.png";
      };
      workspaces = {
        type = "workspaces";
        display = "name";
        empty_color = "surface_variant";
        hide_when_empty = true;
        labels_only_when_occupied = true;
        occupied_color = "outline";
      };
      anilist = {
        type = "cleboost/anilist:tracker";
      };
      pomodoro = {
        type = "thepunkoff/pomodoro:widget";
      };
      todo = {
        type = "nightwatch75/todo:todo";
      };

      catwalk = {
        type = "dotnetrob/cat:cat";
        show_cpu_percent = true;
        cat_color = "on_surface";
        cat_color_mode = "custom";
      };
      temp = {
        type = "sysmon";
        display = "text";
        stat = "cpu_temp";
      };
      ram = {
        type = "sysmon";
        display = "text";
        stat = "ram_pct";
      };
      clock = {
        type = "clock";
        tooltip_format = "{:%H:%M:%S}";
      };
      date = {
        type = "clock";
        color = "primary";
        format = "{:%d %m}";
      };
      bongo_cat = {
        type = "noctalia/bongocat:cat";
        audio_spectrum = true;
        tappy_mode = true;
        use_mpris_filter = true;
        color = "primary";
      };

      privacy = {
        type = "privacy";
        hide_inactive = true;
        active_color = "error";
      };
      tray = {
        type = "tray";
        drawer = true;
        drawer_columns = 5;
        match_adjacent_spacing = true;
      };
      notifications = {
        type = "notifications";
        color = "primary";
      };
      bluetooth = {
        type = "bluetooth";
        color = "primary";
      };
      network = {
        type = "network";
        color = "primary";
        show_label = false;
      };
      output_volume = {
        type = "volume";
        device = "output";
      };
      input_volume = {
        type = "volume";
        device = "input";
      };
      keyboard_layout = {
        type = "keyboard_layout";
        custom_labels = {
          "English (US)" = "EN";
          Russian = "RU";
        };
        hide_when_single_layout = true;
        show_icon = false;
      };
    };
    bar = {
      order = ["main"];
      main = {
        enabled = true;
        layer = "top";
        position = "left";
        thickness = 30;
        widget_spacing = 6;
        auto_hide = false;
        smart_auto_hide = false;
        contact_shadow = false;
        font_weight = 500;
        margin_edge = 0;
        margin_ends = 0;
        margin_opposite_edge = 0;
        padding = 10;
        panel_overlap = 0;
        concave_edge_corners = true;
        radius = 12;
        radius_bottom_left = 0;
        radius_bottom_right = 12;
        radius_top_left = 0;
        radius_top_right = 12;
        reserve_space = true;
        scale = 1;
        shadow = false;
        background_opacity = 0.75;
        border_width = 0;
        capsule = false;
        show_on_workspace_switch = false;
        hover_highlight = true;
        capsule_group = [
          {
            enabled = true;
            fill = "surface_variant";
            id = "datetime";
            members = [
              "clock"
              "date"
            ];
            opacity = 0.5;
            padding = 3;
          }
        ];
        start = [
          "launcher"
          "clipboard"
          "workspaces"
          "caffeine"
          "power_profile"
          "anilist"
          "pomodoro"
          "todo"
        ];
        center = [
          "catwalk"
          "temp"
          "ram"
          "group:datetime"
          "battery"
          "weather"
          "bongo_cat"
        ];
        end = [
          "privacy"
          "tray"
          "notifications"
          "brightness"
          "bluetooth"
          "network"
          "output_volume"
          "input_volume"
          "keyboard_layout"
        ];
      };
    };
  };
}
