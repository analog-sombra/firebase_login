enum APP_PAGE {
  auth,
  home,
}

extension AppPageExtension on APP_PAGE {
  // create path for routes
  String get routePath {
    switch (this) {
      case APP_PAGE.home:
        return "/";

      case APP_PAGE.auth:
        return "/auth";

      default:
        return "/";
    }
  }

// for named routes
  String get routeName {
    switch (this) {
      case APP_PAGE.home:
        return "HOME";

      case APP_PAGE.auth:
        return "AUTH";

      default:
        return "HOME";
    }
  }
}
