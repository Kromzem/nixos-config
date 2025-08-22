let
  data_dir = "/containers/expense_owl";
in
{
  systemd.tmpfiles.rules = [
    "d ${data_dir} 777 palikin users -"
  ];

  virtualisation.oci-containers.containers."expense_owl" = {
    image = "tanq16/expenseowl:main";
    volumes = [
      "${data_dir}:/app/data"
    ];
    ports = [
      "1003:8080"
    ];
  };
}
