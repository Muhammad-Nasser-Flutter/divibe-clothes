import 'package:cloth_ecommerce/core/routing/custom_go_router.dart';
import 'package:cloth_ecommerce/core/theming/text_theme_extension.dart';
import 'package:cloth_ecommerce/core/widgets/back.dart';
import 'package:cloth_ecommerce/core/widgets/separator.dart';
import 'package:flutter/material.dart';

class DefaultAppBar extends StatelessWidget implements PreferredSizeWidget {
  const DefaultAppBar({super.key, required this.title, this.backgroundColor, this.actions, this.leading});
  final String title;
  final Color? backgroundColor;
  final List<Widget>? actions;
  final Widget? leading;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      actionsPadding: const EdgeInsets.symmetric(horizontal: 16),
      backgroundColor: backgroundColor,
      leading: leading ?? (router.canPop() ? const Back() : null),
      title: Text(
        title,
        style: context.bodyLarge.copyWith(
          fontWeight: FontWeight.w600,
        ),
      ),
      actions: actions,
      bottom: const PreferredSize(preferredSize: Size.fromHeight(1), child: Separator()),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
