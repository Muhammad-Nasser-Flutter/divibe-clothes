import 'package:cloth_ecommerce/core/cache_helper/cache_helper.dart';
import 'package:cloth_ecommerce/core/utilies/app_preferences.dart';
import 'package:get_it/get_it.dart';
import 'package:cloth_ecommerce/core/Api/quest_dio.dart';
import 'package:shared_preferences/shared_preferences.dart';

// import '../utilies/app_preferences.dart';

final getIt = GetIt.instance;

class ServicesLocator {
  Future<void> init() async {
    /// App Preferences
    // getIt.registerLazySingleton<AppPreferences>(() => AppPreferences(getIt()));

    // /// Shared Preferences
    // SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    // getIt.registerFactory<SharedPreferences>(() => sharedPreferences);

    // Network info
    // getIt.registerLazySingleton<NetworkInfo>(() => NetworkInfoImpl(getIt()));
    final dio = QuestDio();
    dio.init();
    getIt.registerLazySingleton<QuestDio>(() => dio);
    await CacheHelper.init();
    getIt.registerFactory<SharedPreferences>(() => CacheHelper.sharedPreferences);
    getIt.registerLazySingleton<AppPreferences>(() => AppPreferences(getIt<SharedPreferences>()));

    // /// Network Connection checker
    // getIt.registerLazySingleton<InternetConnectionChecker>(() => InternetConnectionChecker());
  }
}
