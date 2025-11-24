import 'package:cloth_ecommerce/core/theming/text_theme_extension.dart';
import 'package:flutter/material.dart';

class OrSeparator extends StatelessWidget {
  const OrSeparator({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        vertical: MediaQuery.sizeOf(context).height * .05,
      ),
      child: Row(
        children: [
          Expanded(
            child: Container(
              height: .8,
              color: const Color.fromARGB(255, 172, 171, 171),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 17),
            child: Text(
              'or',
              style: context.bodyMedium,
            ),
          ),
          Expanded(
            child: Container(
              height: .8,
              color: const Color.fromARGB(255, 172, 171, 171),
            ),
          ),
        ],
      ),
    );
  }
}
