{
  programs.fish.functions = {
    toggle_airplane_mode.body =
      # fish
      ''
        set backup_file ~/.cache/airplane_backup

        if test -e $backup_file
          set -l wifi_status (cat $backup_file | grep -o 'wifi:\(on\|off\)$' | cut -d':' -f2)
          set -l bluetooth_status (cat $backup_file | grep -o 'bluetooth:\(on\|off\)$' | cut -d':' -f2)

          if test "$wifi_status" = "on"
            noctalia msg wifi-enable
          end

          if test "$bluetooth_status" = "on"
            noctalia msg bluetooth-enable
          end

          rm $backup_file
        else
          echo "wifi:$(noctalia msg wifi-status)" > $backup_file
          echo "bluetooth:$(noctalia msg bluetooth-status)" >> $backup_file

          noctalia msg wifi-disable
          noctalia msg bluetooth-disable
        end
      '';
  };
}
