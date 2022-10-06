enum AppRoute {
/* Authentification  module part */
  auth("/"),
  otp("/auth/otp"),
  userCreate("/user/create"),
  notif("/notif"),

/* Home */
  home("/home"),
  methodList("/method"),
  rLoading("/recharge/loading"),
  tLoading("/transfer/loading"),

/* Cards */
  cardEmpty("/card/empty"),
  newCard("/new/card"),
  cardConfirmation("/card/confirm"),
  virtualCard("/virtual/card"),

/* Settingd */
  userEdit("/user/edit"),
  ;

  String get pathAsChild {
    final List l = path.split("/");
    l.removeAt(0);
    if (path.startsWith("/")) {
      l.removeAt(0);
    }
    final String t = "/${l.join("/")}";
    return t;
  }

  const AppRoute(this.path);
  final String path;
  String withIdParam(String value) {
    return path.replaceAll(":id", value);
  }
}
