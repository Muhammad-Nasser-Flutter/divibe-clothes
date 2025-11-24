class FlavorConfigStrings {
  static const String appName = 'APP_NAME';
  static const String isAccommodationsEnabled = 'ACCOMMODATIONS_ENABLED';
  static const String isBusesEnabled = 'BUSES_ENABLED';
  static const String isFlightsEnabled = 'FLIGHTS_ENABLED';
  static const String isTrainsEnabled = 'TRAINS_ENABLED';
  static const String flavor = 'FLAVOR';
  static const String baseUrl = 'BASE_URL';
  static const String webSocketBaseUrl = 'WEBSOCKET_BASE_URL';
  static const String sentryDsn = 'SENTRY_DSN';
  static const String couponsEnabled = 'COUPONS_ENABLED';
  static const String bannersEnabled = 'BANNERS_ENABLED';
  static const String googleMapsApiKey = 'AIzaSyCN5X4ZkTy2VeqLot5k-moydtSH1u2ZggM';
}

class FlavorConfigValues {
  ///Development
  static const String developmentAppName = 'Trego-Development';
  static const String developmentFlavor = 'Development';
  static const String developmentBaseUrl = 'https://api.tregotech.com/';
  static const String developmentWebSocketBaseUrl = 'wss://api.tregotech.com';
  static const String developmentSentryDSN =
      'https://8f1047d690caf2ded72d7ad4c8741d94@o4509145445236736.ingest.de.sentry.io/4509145549635664';
  static const bool developmentBusesEnabled = true;
  static const bool developmentAccommodationsEnabled = true;
  static const bool developmentFlightsEnabled = true;
  static const bool developmentTrainsEnabled = true;
  static const bool developmentCouponsEnabled = true;
  static const bool developmentBannerEnabled = true;

  ///Production
  static const String productionAppName = 'Trego';
  static const String productionFlavor = 'Production';
  static const String productionBaseUrl = 'https://prod.tregotech.com/';
  static const String productionWebSocketBaseUrl = 'wss://prod.tregotech.com';
  static const String productionSentryDSN =
      'https://8f1047d690caf2ded72d7ad4c8741d94@o4509145445236736.ingest.de.sentry.io/4509145549635664';
  static const bool productionBusesEnabled = true;
  static const bool productionAccommodationsEnabled = false;
  static const bool productionFlightsEnabled = false;
  static const bool productionTrainsEnabled = false;
  static const bool productionCouponsEnabled = false;
  static const bool productionBannerEnabled = true;
}
