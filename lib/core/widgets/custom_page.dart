import 'package:cloth_ecommerce/core/theming/text_theme_extension.dart' show TextThemeExtension;
import 'package:flutter/material.dart';
import 'package:cloth_ecommerce/core/helpers/extensions.dart';

import 'package:cloth_ecommerce/core/widgets/back.dart';
import 'package:cloth_ecommerce/core/widgets/conditional_repaint_boundary.dart';
import 'package:cloth_ecommerce/core/widgets/finding_button.dart';

class CustomPage extends StatelessWidget {
  final String assetImage;
  final String title;
  final String description;
  final Color backgroundColor;
  final Color textColor;
  final bool hasButton;
  final bool hasBackButton;
  final String buttonText;
  final Alignment imageAlignment;
  final VoidCallback onPressed;
  const CustomPage({
    this.imageAlignment = Alignment.bottomCenter,
    super.key,
    this.hasButton = true,
    this.hasBackButton = true,
    required this.backgroundColor,
    required this.assetImage,
    this.textColor = Colors.white,
    required this.title,
    required this.description,
    required this.buttonText,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: AppBar(
        backgroundColor: backgroundColor,
        automaticallyImplyLeading: false,
        leading: hasBackButton
            ? Back(
                iconColor: textColor,
              )
            : null,
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 40),
          child: Column(
            children: [
              Container(
                alignment: imageAlignment,
                height: 500,
                child: ConditionalRepaintBoundary(
                  child: Image.asset(assetImage),
                ),
              ),
              20.height,
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: context.displayLarge.copyWith(
                        fontSize: 30,
                        letterSpacing: 0,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    10.height,
                    Text(
                      description,
                      style: context.headlineSmall.copyWith(
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: hasButton
          ? IntrinsicHeight(
              child: SafeArea(
                child: Container(
                  margin: const EdgeInsets.only(left: 50, right: 50, bottom: 30),
                  child: FindingButton(
                    disabled: false,
                    // borderRadius: 15,
                    // height: 50,
                    text: buttonText,
                    onPressed: onPressed,
                  ),
                ),
              ),
            )
          : null,
    );
  }
}
