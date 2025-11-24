import 'package:cloth_ecommerce/core/Language/bloc/language_bloc.dart';
import 'package:cloth_ecommerce/core/cache_helper/cache_helper.dart';
import 'package:cloth_ecommerce/core/theming/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class LanguageWidget extends HookWidget {
  const LanguageWidget({super.key, this.onChanged});
  final Function()? onChanged;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LanguageBloc, String>(
      builder: (context, state) {
        var cubit = context.read<LanguageBloc>();
        return IconButton(
          onPressed: () async {
            if (CacheHelper.isEn) {
              await cubit.changeLanguage(context: context, languageCode: "ar");
            } else {
              await cubit.changeLanguage(context: context, languageCode: "en");
            }
            onChanged?.call();
          },
          icon: const Icon(Icons.language, color: AppColors.secondary600Color, size: 24),
        );
      },
    );
  }
}
