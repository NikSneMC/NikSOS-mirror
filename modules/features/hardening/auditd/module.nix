{
  den.aspects.auditd = {
    os = {
      security = {
        auditd = {
          enable = true;

          settings = {
            max_log_file = 32;
            max_log_file_action = "rotate";
            num_logs = 8;

            space_left = 512;
            space_left_action = "rotate";

            admin_space_left = 256;
            admin_space_left_action = "rotate";

            disk_full_action = "suspend";
            disk_error_action = "syslog";
          };
        };

        audit.enable = true;
      };
    };
  };
}
