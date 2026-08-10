{den, ...}: {
  den.aspects.gateway = {
    includes = with den.aspects; [
      fail2ban

      ({host, ...}: {
        os.assertions = [
          {
            assertion = host.addrs.public != {};
            message = ''
              host ${host.name} has role "gateway" but no addrs.public entry; it would be unreachable when the VPN is down
            '';
          }
        ];
      })
    ];
  };
}
