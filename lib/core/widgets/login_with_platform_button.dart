import 'package:cloth_ecommerce/core/theming/text_theme_extension.dart';
import 'package:flutter/material.dart';

import 'package:flutter_svg/svg.dart';
import 'package:cloth_ecommerce/core/helpers/extensions.dart';
import 'package:cloth_ecommerce/core/widgets/conditional_repaint_boundary.dart';

class LoginWithPlatformButton extends StatelessWidget {
  final Color buttonColor;
  final Color textColor;
  final String text;
  final String assetPath;
  final VoidCallback onTap;
  final Border? border;
  const LoginWithPlatformButton({
    super.key,
    required this.buttonColor,
    required this.textColor,
    required this.text,
    required this.assetPath,
    required this.onTap,
    this.border,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        height: 50,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          color: buttonColor,
          border: border,
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ConditionalRepaintBoundary(
              child: SvgPicture.asset(
                assetPath,
                height: 24,
              ),
            ),
            20.width,
            Text(
              text,
              style: context.bodyLarge.copyWith(
                fontSize: 14,
                fontWeight: FontWeight.w600,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
