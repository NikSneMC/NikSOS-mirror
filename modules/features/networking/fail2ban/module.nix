{
  den.aspects.fail2ban = {
    os = {
      services.fail2ban = {
        enable = true;

        maxretry = 5;
        bantime = "1h";
      };
    };
  };
}
