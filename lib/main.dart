import 'package:easy_localization/easy_localization.dart';
import 'package:cloth_ecommerce/core/Language/bloc/language_bloc.dart';
import 'package:cloth_ecommerce/core/utilies/language.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';

import 'package:cloth_ecommerce/core/bloc_observer.dart';
import 'package:cloth_ecommerce/core/helpers/service_locator.dart';
import 'package:cloth_ecommerce/core/routing/custom_go_router.dart';
import 'package:cloth_ecommerce/core/theming/themes.dart';
import 'package:cloth_ecommerce/core/utilies/easy_loading.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final navigatorKey = GlobalKey<NavigatorState>();
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();
  await ServicesLocator().init();

  EasyLocalization.logger.enableBuildModes = [];
  Bloc.observer = MyBlocObserver();
  runApp(const ClothEcommerce());
}

class ClothEcommerce extends StatefulWidget {
  const ClothEcommerce({super.key});

  @override
  State<ClothEcommerce> createState() => _ClothEcommerceState();
}

class _ClothEcommerceState extends State<ClothEcommerce> {
  @override
  Widget build(BuildContext context) {
    return ProviderScope(
      child: EasyLocalization(
        supportedLocales: const [arabicLocale, englishLocale],
        fallbackLocale: englishLocale,
        startLocale: englishLocale,
        path: localizationPath,
        assetLoader: const RootBundleAssetLoader(),
        saveLocale: true,
        child: MultiBlocProvider(
          providers: [
            BlocProvider(
              create: (context) => LanguageBloc()..initLanguage(),
            ),
          ],
          child: BlocBuilder<LanguageBloc, String>(
            builder: (context, state) {
              return MediaQuery(
                data: MediaQuery.of(context).copyWith(textScaler: const TextScaler.linear(1.0)),
                child: MaterialApp.router(
                  localizationsDelegates: context.localizationDelegates,
                  routerConfig: router,
                  title: 'Cloth Ecommerce',
                  debugShowCheckedModeBanner: false,
                  locale: context.locale,
                  supportedLocales: context.supportedLocales,
                  theme: lightTheme(state),
                  themeMode: ThemeMode.light,
                  builder: (context, widget) {
                    configLoading();
                    return EasyLoading.init()(context, widget);
                  },
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
