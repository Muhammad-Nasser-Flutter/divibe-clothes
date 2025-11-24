import 'dart:io';

import 'package:cloth_ecommerce/core/theming/text_theme_extension.dart';
import 'package:flutter/cupertino.dart' show CupertinoButton;
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:cloth_ecommerce/core/widgets/conditional_repaint_boundary.dart';

import '../theming/colors.dart';

class CustomButton extends StatefulWidget {
  final String text;
  final VoidCallback? onPressed;
  final Color? color;
  final Color? textColor;
  final double? fontSize;
  final FontWeight? fontWeight;
  final double? width;
  final double? height;
  final EdgeInsetsGeometry? margin;
  final EdgeInsetsGeometry? padding;
  final double? borderRadius;
  final Border? border;
  final double? elevation;
  final bool? enableShadow;
  final bool disabled;
  final List<Color>? gradientColors;
  final bool isIcon;
  final String? iconAsset;
  final Color iconColor;
  final double iconSize;

  final List<BoxShadow>? boxShadow;
  const CustomButton({
    super.key,
    required this.text,
    this.onPressed,
    this.color,
    this.textColor,
    this.fontSize,
    this.fontWeight,
    this.width,
    this.height,
    this.margin,
    this.padding,
    this.borderRadius,
    this.border,
    this.elevation,
    this.enableShadow,
    this.disabled = false,
    this.boxShadow,
    this.iconSize = 20,
    this.iconColor = Colors.white,
    this.isIcon = false,
    this.iconAsset,
    this.gradientColors,
  });

  @override
  State<CustomButton> createState() => _CustomButtonState();
}

class _CustomButtonState extends State<CustomButton> {
  bool _isPressed = false;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.disabled ? null : widget.onPressed,
      onTapDown: (_) {
        setState(() {
          if (widget.disabled) return;
          _isPressed = true;
        });
      },
      onTapUp: (_) {
        setState(() {
          if (widget.disabled) return;
          _isPressed = false;
        });
      },
      onTapCancel: () {
        setState(() {
          if (widget.disabled) return;
          _isPressed = false;
        });
      },
      child: SizedBox(
        height: widget.height ?? 52,
        child: AnimatedScale(
          duration: const Duration(milliseconds: 100),
          scale: _isPressed ? 0.99 : 1,
          child: AnimatedContainer(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(widget.borderRadius ?? 8),
              border: widget.border ?? Border.all(color: Colors.transparent),
            ),
            duration: const Duration(milliseconds: 100),
            width: widget.width,
            child: Platform.isIOS
                ? CupertinoButton(
                    disabledColor: Colors.grey,
                    pressedOpacity: 0.8,
                    onPressed: widget.disabled ? null : widget.onPressed,
                    color: widget.disabled ? Colors.grey : (widget.color ?? AppColors.primary400Color),
                    borderRadius: BorderRadius.circular(widget.borderRadius ?? 8),
                    padding: widget.padding ?? EdgeInsets.zero,
                    child: Center(
                      child: !widget.isIcon
                          ? Text(
                              widget.text,
                              style: context.bodyMedium.copyWith(
                                fontSize: widget.fontSize,
                                fontWeight: widget.fontWeight,
                                color: widget.textColor ?? Colors.white,
                              ),
                            )
                          : ConditionalRepaintBoundary(
                              child: SvgPicture.asset(
                                widget.iconAsset!,
                                colorFilter: ColorFilter.mode(widget.iconColor, BlendMode.srcIn),
                                width: widget.iconSize,
                              ),
                            ),
                    ),
                  )
                : ElevatedButton(
                    onPressed: widget.disabled ? null : widget.onPressed,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: widget.color ?? AppColors.primary400Color,
                      foregroundColor: widget.textColor ?? Colors.white,
                      padding: widget.padding,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(widget.borderRadius ?? 8),
                      ),
                      elevation: widget.elevation,
                      shadowColor: widget.enableShadow == true ? Colors.black : Colors.transparent,
                    ),
                    child: Center(
                      child: !widget.isIcon
                          ? Text(
                              widget.text,
                              style: context.bodyMedium.copyWith(
                                fontSize: widget.fontSize,
                                fontWeight: widget.fontWeight,
                                color: widget.textColor ?? Colors.white,
                              ),
                            )
                          : ConditionalRepaintBoundary(
                              child: SvgPicture.asset(
                                widget.iconAsset!,
                                colorFilter: ColorFilter.mode(widget.iconColor, BlendMode.srcIn),
                                width: widget.iconSize,
                              ),
                            ),
                    ),
                  ),
          ),
        ),
      ),
    );
  }
}
