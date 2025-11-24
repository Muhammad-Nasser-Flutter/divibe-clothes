import 'package:cloth_ecommerce/core/cache_helper/cache_helper.dart';
import 'package:cloth_ecommerce/core/theming/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../theming/colors.dart';

class CustomTextFormField extends StatelessWidget {
  final TextEditingController? controller;
  final String? labelText;
  final String? hintText;
  final String? helperText;
  final String? errorText;
  final bool? obscureText;
  final bool? autofocus;
  final bool? autocorrect;
  final bool? enableSuggestions;
  final bool? readOnly;
  final bool? showCursor;
  final TextStyle? hintStyle;
  final Color? textColor;
  final int? maxLength;
  final TextInputType? keyboardType;
  final TextInputAction? textInputAction;
  final ValueChanged<String>? onChanged;
  final String? Function(String?)? validator;
  final FormFieldSetter<String>? onSaved;
  final List<TextInputFormatter>? inputFormatters;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final bool? enabled;
  final autofillHints;
  final EdgeInsets? contentPadding;
  final EdgeInsets? padding;
  final bool? expands;
  final int? maxLines;
  final int? minLines;
  final ValueChanged<String>? onFieldSubmitted;
  final List<TextInputFormatter>? buildCounter;
  final ScrollPhysics? scrollPhysics;
  final VoidCallback? onTap;
  final BorderRadius? borderRadius;
  final Color? backgroundColor;
  final Color? borderColor;
  final double borderWidth;
  final double? textSize;
  final TextAlign? textAlign;
  final FontWeight? textWeight;
  final FocusNode? focusNode;
  final InputBorder? errorBorder;
  final bool? isTextDirectionReversed;
  final void Function()? onEditingComplete;
  final TextStyle? textStyle;
  final bool unfocusWhenTapOutside;
  const CustomTextFormField({
    super.key,
    this.controller,
    this.onEditingComplete,
    this.isTextDirectionReversed,
    this.unfocusWhenTapOutside = true,
    this.textStyle,
    this.textAlign,
    this.padding,
    this.textColor,
    this.textWeight,
    this.textSize,
    this.hintStyle,
    this.hintText,
    this.labelText,
    this.backgroundColor,
    this.helperText,
    this.borderColor,
    this.borderWidth = 1,
    this.errorText,
    this.obscureText = false,
    this.autofocus = false,
    this.autocorrect = true,
    this.enableSuggestions = true,
    this.readOnly = false,
    this.showCursor,
    this.maxLength,
    this.keyboardType,
    this.textInputAction,
    this.onChanged,
    this.validator,
    this.borderRadius,
    this.onSaved,
    this.inputFormatters,
    this.prefixIcon,
    this.suffixIcon,
    this.enabled,
    this.autofillHints,
    this.contentPadding,
    this.expands,
    this.maxLines,
    this.minLines,
    this.onFieldSubmitted,
    this.buildCounter,
    this.scrollPhysics,
    this.onTap,
    this.errorBorder,
    this.focusNode,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      cursorColor: textColor,
      onEditingComplete: onEditingComplete,
      textAlign: textAlign ?? TextAlign.start,
      style:
          textStyle ??
          style14.copyWith(
            fontSize: textSize,
            fontWeight: textWeight,
            color: textColor,
            height: 1.3,
            letterSpacing: 0.2,
          ),
      autofillHints: autofillHints,
      onTapOutside: (event) {
        if (unfocusWhenTapOutside) FocusScope.of(context).unfocus();
      },
      autovalidateMode: AutovalidateMode.onUnfocus,
      controller: controller,
      obscureText: obscureText!,
      autofocus: autofocus!,
      autocorrect: autocorrect!,
      enableSuggestions: enableSuggestions!,
      readOnly: readOnly!,
      showCursor: showCursor,
      maxLength: maxLength,
      keyboardType: keyboardType,
      textInputAction: textInputAction,
      onChanged: onChanged,
      validator: validator,
      onSaved: onSaved,
      textDirection: isTextDirectionReversed != null
          ? isTextDirectionReversed == true
                ? (CacheHelper.isEn ? TextDirection.rtl : TextDirection.ltr)
                : (CacheHelper.isEn ? TextDirection.ltr : TextDirection.rtl)
          : null,
      inputFormatters: inputFormatters,
      textAlignVertical: TextAlignVertical.center,
      decoration: InputDecoration(
        errorStyle: style12.copyWith(
          fontSize: 13,
          fontWeight: FontWeight.w500,
          color: Colors.red,
        ),
        labelStyle:
            hintStyle ??
            style14.copyWith(
              fontSize: textSize,
              fontWeight: textWeight,
              color: textColor,
              height: 1.4,
            ),
        fillColor: backgroundColor ?? Colors.transparent,
        filled: true,
        enabledBorder: OutlineInputBorder(
          borderSide: borderWidth == 0
              ? BorderSide.none
              : BorderSide(color: borderColor ?? AppColors.secondary100Color, width: borderWidth),
          borderRadius: borderRadius ?? BorderRadius.circular(4),
        ),
        border: OutlineInputBorder(
          borderSide: borderWidth == 0
              ? BorderSide.none
              : BorderSide(color: borderColor ?? AppColors.secondary100Color, width: borderWidth),
          borderRadius: borderRadius ?? BorderRadius.circular(4),
        ),

        ///on error
        errorBorder:
            errorBorder ??
            OutlineInputBorder(
              borderSide: borderWidth == 0
                  ? BorderSide.none
                  : BorderSide(
                      color: borderColor ?? AppColors.secondary100Color,
                      width: borderWidth,
                    ),
              borderRadius: borderRadius ?? BorderRadius.circular(4),
            ),

        ///wna dayes 3leeh
        focusedBorder: OutlineInputBorder(
          borderSide: borderWidth == 0
              ? BorderSide.none
              : BorderSide(color: borderColor ?? AppColors.secondary100Color, width: borderWidth),
          borderRadius: borderRadius ?? BorderRadius.circular(4),
        ),
        disabledBorder: OutlineInputBorder(
          borderSide: borderWidth == 0
              ? BorderSide.none
              : BorderSide(color: borderColor ?? Colors.grey.shade500, width: borderWidth),
          borderRadius: borderRadius ?? BorderRadius.circular(4),
        ),
        labelText: labelText,
        hintStyle:
            hintStyle ??
            style14.copyWith(
              fontSize: textSize,
              fontWeight: textWeight,
              color: textColor ?? AppColors.gray400Color,
              height: 1.4,
              letterSpacing: 0.2,
            ),
        hintText: hintText,
        helperText: helperText,
        errorText: errorText,
        prefixIcon: prefixIcon,
        suffixIcon: suffixIcon,
        enabled: enabled ?? true,
        contentPadding: contentPadding ?? const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      ),
      expands: expands ?? false,
      maxLines: maxLines ?? 1,
      minLines: minLines,
      onFieldSubmitted: onFieldSubmitted,
      scrollPhysics: scrollPhysics,
      onTap: onTap,
      focusNode: focusNode,
    );
  }
}
