import 'package:cloth_ecommerce/features/cart/presentation/widgets/cart_drawer.dart';
import 'package:cloth_ecommerce/features/favorites/presentation/widgets/favorites_drawer.dart';
import 'package:cloth_ecommerce/features/home/presentation/widgets/app_bar_widgets/custom_app_bar.dart';
import 'package:flutter/material.dart';

class MainLayoutScreen extends StatelessWidget {
  const MainLayoutScreen({super.key, required this.child});
  static final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      appBar: CustomAppBar(scaffoldKey: scaffoldKey),
      drawer: FavoritesDrawer(scaffoldKey: scaffoldKey),
      endDrawer: const CartDrawer(),
      body: child,
    );
  }
}
