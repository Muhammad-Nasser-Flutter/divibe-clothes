import 'package:easy_localization/easy_localization.dart' as easy_localization;
import 'package:cloth_ecommerce/core/theming/assets.dart';
import 'package:cloth_ecommerce/core/theming/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:cloth_ecommerce/core/Language/bloc/language_bloc.dart';
import 'package:cloth_ecommerce/core/cache_helper/cache_helper.dart';
import 'package:cloth_ecommerce/core/constant.dart';
import 'package:cloth_ecommerce/core/helpers/extensions.dart';
import 'package:cloth_ecommerce/core/widgets/backgrounded_text.dart';

class LanguageRow extends StatelessWidget {
  const LanguageRow({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LanguageBloc, String>(
      builder: (context, state) {
        printDebug("CacheHelper.isEn: ${CacheHelper.isEn}");
        return Row(
          textDirection: TextDirection.ltr,
          children: [
            Expanded(
              child: BackgroundedText(
                hasPrefix: true,
                prefixIconAsset: Assets.ukIcon,
                text: "English".tr(),
                onPressed: () async {
                  printDebug("Before Pressing English: ${CacheHelper.isEn}");
                  await context.read<LanguageBloc>().changeLanguage(
                    languageCode: "en",
                    context: context,
                  );
                  printDebug("After Pressing English: ${CacheHelper.isEn}");
                },
                textColor: CacheHelper.isEn ? Colors.white : AppColors.gray400Color,
                border: !CacheHelper.isEn ? Border.all(color: AppColors.secondary100Color, width: 1) : null,
                backgroundColor: !CacheHelper.isEn ? Colors.white : AppColors.primary400Color,
              ),
            ),
            12.width,
            Expanded(
              child: BackgroundedText(
                hasPrefix: true,
                prefixIconAsset: Assets.egyptIcon,
                text: "Arabic".tr(),
                onPressed: () async {
                  printDebug("Before Pressing Arabic: ${!CacheHelper.isEn}");
                  await context.read<LanguageBloc>().changeLanguage(
                    languageCode: "ar",
                    context: context,
                  );
                  printDebug("After Pressing Arabic: ${!CacheHelper.isEn}");
                },
                textColor: !CacheHelper.isEn ? Colors.white : AppColors.gray400Color,
                border: CacheHelper.isEn ? Border.all(color: AppColors.secondary100Color, width: 1) : null,
                backgroundColor: CacheHelper.isEn ? Colors.white : AppColors.primary400Color,
              ),
            ),
          ],
        );
      },
    );
  }
}
