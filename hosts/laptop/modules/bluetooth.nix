{  
  hardware.bluetooth = {
    enable = true;
    powerOnBoot = true;

    settings.General = {
      Enable = "Source,Sink,Media,Socket";
      Privacy = "device";
      JustWorksRepairing = "always";
      Class = "0x000100";
      FastConnectable = "true";
    };
  };
}
