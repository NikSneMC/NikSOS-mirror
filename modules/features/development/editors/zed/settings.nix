{
  programs.zed-editor.userSettings = {
    agent = {
      default_profile = "write";
      dock = "right";
      play_sound_when_agent_done = "always";
      show_turn_stats = true;
      sidebar_side = "right";
      tool_permissions.default = "allow";
    };
    agent_servers = {
      codex-acp.type = "registry";
      github-copilot-cli.type = "registry";
      opencode.type = "registry";
    };
    auto_update = false;
    buffer_font_family = "JetBrainsMono Nerd Font Mono";
    buffer_font_size = 15;
    calls.mute_on_join = true;
    cli_default_open_behavior = "new_window";
    close_on_file_delete = false;
    collaboration_panel.dock = "right";
    colorize_brackets = true;
    completion_menu_item_kind = "symbol";
    context_servers.mcp-server-github.enabled = true;
    diagnostics.inline = {enabled = true;};
    disable_ai = false;
    document_folding_ranges = "on";
    edit_predictions = {
      allow_data_collection = "no";
      provider = "copilot";
    };
    git.inline_blame.show_commit_summary = true;
    git_panel = {
      dock = "left";
      file_icons = true;
      show_count_badge = true;
      sort_by_path = true;
      tree_view = true;
    };
    helix_mode = true;
    indent_guides.coloring = "indent_aware";
    inlay_hints.enabled = true;
    line_ending = "enforce_lf";
    minimap.show = "always";
    multi_cursor_modifier = "cmd_or_ctrl";
    outline_panel.dock = "left";
    project_panel = {
      diagnostic_badges = true;
      dock = "left";
      git_status_indicator = true;
    };
    relative_line_numbers = "enabled";
    search = {
      center_on_match = true;
      regex = true;
    };
    semantic_tokens = "combined";
    status_bar = {
      line_endings_button = true;
      show_active_file = true;
    };
    tab_bar = {
      show = true;
      show_pinned_tabs_in_separate_row = true;
    };
    tabs = {
      file_icons = true;
      git_status = true;
      show_diagnostics = "all";
    };
    telemetry = {
      diagnostics = false;
      metrics = false;
    };
    terminal = {
      copy_on_select = true;
      toolbar.breadcrumbs = true;
    };
    title_bar = {
      button_layout = "platform_default";
      show_branch_status_icon = true;
      show_menus = true;
    };
    toolbar.code_actions = true;
    ui_font_family = "JetBrainsMono Nerd Font Propo";
    ui_font_size = 16;
    vim = {
      toggle_relative_line_numbers = true;
      use_smartcase_find = true;
    };
    which_key.enabled = true;
  };
}
