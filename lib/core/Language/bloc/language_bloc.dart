import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../core/helpers/service_locator.dart';
import '../../../core/utilies/app_preferences.dart';

class LanguageBloc extends Cubit<String> {
  LanguageBloc() : super('en');

  Future<void> initLanguage() async {
    emit(await getIt.get<AppPreferences>().getAppLanguage());
  }

  Future<void> changeLanguage({
    required BuildContext context,
    required String languageCode,
  }) async {
    await context.setLocale(Locale(languageCode));

    String x = await getIt.get<AppPreferences>().getAppLanguage();
    if (languageCode != x) {
      await getIt.get<AppPreferences>().changeAppLanguage(languageCode).then((
        value,
      ) {
        emit(languageCode);
      });
    }
  }
}
