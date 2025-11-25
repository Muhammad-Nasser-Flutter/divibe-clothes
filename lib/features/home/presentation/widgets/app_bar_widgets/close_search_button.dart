

import 'package:cloth_ecommerce/core/theming/colors.dart';
import 'package:cloth_ecommerce/core/widgets/scale_widget.dart';
import 'package:cloth_ecommerce/features/home/presentation/providers/search_provider.dart';
import 'package:cloth_ecommerce/features/home/presentation/providers/search_ui_provider.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:iconify_flutter/iconify_flutter.dart';
import 'package:iconify_flutter/icons/gg.dart';

class CloseSearchButton extends ConsumerWidget {
  const CloseSearchButton({
    super.key,
    required this.searchController,
    required this.searchFocusNode,
  });

  final TextEditingController searchController;
  final FocusNode searchFocusNode;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ScaleWidget(
      child: IconButton(
        icon: const Iconify(
          Gg.close,
          color: AppColors.textPrimary,
        ),
        onPressed: () {
          ref.read(isSearchOpenProvider.notifier).state = false;
          searchController.clear();
          ref.read(searchProvider.notifier).clear();
          searchFocusNode.requestFocus();
        },
      ),
    );
  }
}