import 'package:easy_localization/easy_localization.dart';
import 'package:cloth_ecommerce/core/theming/text_theme_extension.dart';
import 'package:flutter/material.dart';

import 'package:flutter_svg/flutter_svg.dart';
import 'package:cloth_ecommerce/core/helpers/extensions.dart';

class TregoErrorWidget extends StatelessWidget {
  const TregoErrorWidget({
    super.key,
    required this.asset,
    required this.message,
    this.textColor = Colors.black,
    this.secondaryWidget,
  });
  final Color textColor;
  final String asset;
  final String message;
  final Widget? secondaryWidget;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 20),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              height: 350,
              child: SvgPicture.asset(
                asset,
                height: 350,
              ),
            ),
            20.height,
            SelectableText(
              message.tr(),
              style: context.headlineMedium.copyWith(
                fontWeight: FontWeight.w500,
              ),
            ),
            20.height,
            if (secondaryWidget != null) secondaryWidget!,
          ],
        ),
      ),
    );
  }
}
