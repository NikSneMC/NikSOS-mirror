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

      cpu = {
        type = "sysmon";
        display = "text";
        stat = "cpu_usage";
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
      cat = {
        type = "noctalia/bongocat:cat";
        audio_spectrum = true;
        color = "primary";
        tappy_mode = true;
        use_mpris_filter = true;
      };

      privacy = {
        type = "privacy";
        hide_inactive = true;
        active_color = "error";
        mic_filter_regex = "^DeepFilter Noise Canceling source$";
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
        hide_when_single_layout = false;
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
        contact_shadow = false;
        font_weight = 500;
        margin_edge = 0;
        margin_ends = 0;
        padding = 10;
        panel_overlap = 0;
        radius = 12;
        radius_bottom_left = 0;
        radius_bottom_right = -12;
        radius_top_left = 0;
        radius_top_right = -12;
        reserve_space = true;
        scale = 1;
        shadow = false;
        background_opacity = 0.75;
        border_width = 0;
        capsule = false;
        capsule_group = [
          {
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
        ];
        center = [
          "cpu"
          "temp"
          "ram"
          "group:datetime"
          "battery"
          "weather"
          "cat"
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
