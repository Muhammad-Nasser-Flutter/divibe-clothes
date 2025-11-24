import 'package:easy_localization/easy_localization.dart';
import 'package:cloth_ecommerce/core/helpers/extensions.dart';
import 'package:cloth_ecommerce/core/theming/assets.dart';
import 'package:cloth_ecommerce/core/theming/colors.dart';
import 'package:cloth_ecommerce/core/theming/text_theme_extension.dart';
import 'package:cloth_ecommerce/core/widgets/icon_widget.dart';
import 'package:flutter/material.dart';

class PdfFileWidget extends StatelessWidget {
  const PdfFileWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const IconWidget(
          iconAsset: Assets.pdf,
          size: 28,
          padding: 6,
          bGColor: AppColors.secondary25Color,
        ),
        12.width,
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Attachmen12.pdf".tr(),
                style: context.bodySmall.copyWith(
                  fontWeight: FontWeight.w500,
                ),
              ),
              5.height,
              Row(
                children: [
                  Expanded(
                    child: Text(
                      "2 Dec 2022".tr(),
                      style: context.bodySmall,
                    ),
                  ),
                  8.width,
                  Text("2 MB".tr(), style: context.bodySmall),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}
