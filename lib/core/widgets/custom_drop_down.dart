import 'package:easy_localization/easy_localization.dart';
import 'package:cloth_ecommerce/core/theming/text_theme_extension.dart';
import 'package:flutter/material.dart';
import 'package:cloth_ecommerce/core/theming/colors.dart';

class CustomDropDown extends StatefulWidget {
  CustomDropDown({
    super.key,
    required this.dropdownValue,
    required this.options,
    required this.hintText,
    this.backgroundColor,
    this.borderColor,
    this.fontSize,
    required this.onChanged,
    this.height,
    this.width,
    this.shadow,
    this.verticalPadding,
    this.horizontalPadding,
    this.borderRadius,
  });
  final Color? borderColor;
  dynamic dropdownValue;
  final List<dynamic> options;
  final String hintText;
  final Color? backgroundColor;
  final double? fontSize;
  final Function(dynamic) onChanged;
  final double? height;
  final double? width;
  final double? verticalPadding;
  final double? horizontalPadding;
  final double? borderRadius;
  final BoxShadow? shadow;

  @override
  State<CustomDropDown> createState() => _CustomDropDownState();
}

class _CustomDropDownState extends State<CustomDropDown> {
  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      height: widget.height,
      width: widget.width,
      decoration: BoxDecoration(
        color: widget.backgroundColor ?? Colors.transparent,
        borderRadius: BorderRadius.circular(widget.borderRadius ?? 4),
        border: Border.all(width: 1, color: widget.borderColor ?? AppColors.secondary100Color),
        boxShadow: widget.shadow != null ? [widget.shadow!] : [],
      ),
      child: DropdownButton<dynamic>(
        isDense: true,
        padding: EdgeInsets.symmetric(
          horizontal: widget.horizontalPadding ?? 16,
          vertical: widget.verticalPadding ?? 12,
        ),
        borderRadius: BorderRadius.circular(4),
        value: widget.dropdownValue,
        onChanged: (dynamic value) {
          setState(() {
            widget.dropdownValue = value!;
            widget.onChanged(value);
          });
        },
        hint: Text(
          widget.hintText.tr(),
          style: context.bodyMedium.copyWith(
            fontSize: widget.fontSize,

            fontWeight: FontWeight.w500,
          ),
        ),
        underline: const SizedBox(),
        isExpanded: true,
        dropdownColor: Colors.white,
        icon: const Icon(Icons.keyboard_arrow_down, color: AppColors.secondary800Color, size: 24),
        selectedItemBuilder: (BuildContext context) {
          return widget.options.map((dynamic value) {
            return Align(
              alignment: AlignmentDirectional.centerStart,
              child: Text(
                value.toString().tr(),
                style: context.bodyMedium.copyWith(
                  fontSize: widget.fontSize,
                  fontWeight: FontWeight.w500,
                ),
              ),
            );
          }).toList();
        },

        items: widget.options.map<DropdownMenuItem<dynamic>>((dynamic value) {
          return DropdownMenuItem<dynamic>(
            value: value,
            child: Text(
              value.toString().tr(),
              style: context.bodyMedium.copyWith(
                fontWeight: FontWeight.w500,
              ),
            ),
          );
        }).toList(),
      ),
    );
  }
}
