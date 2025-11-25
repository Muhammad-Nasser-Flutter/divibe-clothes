import 'package:cloth_ecommerce/core/theming/colors.dart';
import 'package:cloth_ecommerce/core/theming/text_theme_extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class SizeWidget extends HookWidget {
  const SizeWidget({super.key, required this.isSelected, required this.size, required this.onTap});
  final bool isSelected;
  final String size;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final isHovered = useState(false);
    final scale = isHovered.value ? 1.1 : 1.0;
    return MouseRegion(
      onEnter: (event) {
        isHovered.value = true;
      },
      onExit: (event) {
        isHovered.value = false;
      },
      child: AnimatedScale(
        duration: const Duration(milliseconds: 200),
        scale: scale,
        child: InkWell(
          onTap: onTap,
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 200),
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
            decoration: BoxDecoration(
              color: isHovered.value || isSelected ? AppColors.pureBlack : Colors.transparent,
              border: Border.all(
                color: isHovered.value || isSelected ? AppColors.pureBlack : AppColors.gray300,
                width: 1,
              ),
              borderRadius: BorderRadius.circular(6),
            ),
            child: Center(
              child: Text(
                size,
                style: context.bodySmall.copyWith(
                  color: isHovered.value || isSelected ? AppColors.pureWhite : AppColors.textSecondary,
                  fontSize: 11,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
