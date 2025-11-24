import 'package:flutter/material.dart';

import 'package:cloth_ecommerce/core/theming/colors.dart';

final defaultBoxShadow = const BoxShadow(
  color: Colors.black45,
  spreadRadius: -5,
  blurRadius: 12,
  offset: Offset(0, 5), // changes position of shadow
);
final tripOptionShadow = const BoxShadow(
  color: AppColors.primaryColor,
  spreadRadius: -1,
  blurRadius: 2,
  offset: Offset(0, 0),
);
final tregoNavBarShadow = const BoxShadow(
  color: Colors.black26,
  spreadRadius: -1,
  blurRadius: 12,
  offset: Offset(0, 8),
);

final tripTextFieldShadow = const BoxShadow(
  color: AppColors.primaryColor,
  spreadRadius: -1,
  blurRadius: 5,
  offset: Offset(0, 0),
);
