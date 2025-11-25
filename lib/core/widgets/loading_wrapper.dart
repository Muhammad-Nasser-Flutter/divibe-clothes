import 'package:cloth_ecommerce/core/widgets/el_mostashfa_loading.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class LoadingWrapper extends StatefulWidget {
  const LoadingWrapper({
    super.key,
    required this.child,
    this.loadingDuration = const Duration(seconds: 1),
  });

  final Widget child;
  final Duration loadingDuration;

  @override
  State<LoadingWrapper> createState() => _LoadingWrapperState();
}

class _LoadingWrapperState extends State<LoadingWrapper> {
  bool _isLoading = true;
  String? _currentRoute;

  @override
  void initState() {
    super.initState();
    _startLoadingTimer();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    // Track route changes using GoRouter location
    final newRoute = GoRouterState.of(context).uri.toString();

    // Only trigger loading if the route actually changed
    if (_currentRoute != null && _currentRoute != newRoute) {
      setState(() {
        _isLoading = true;
      });
      _startLoadingTimer();
    }

    _currentRoute = newRoute;
  }

  void _startLoadingTimer() {
    Future.delayed(widget.loadingDuration, () {
      if (mounted) {
        setState(() {
          _isLoading = false;
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        // The actual child content loads in the background
        widget.child,
        // Show loading indicator on top
        if (_isLoading)
          Positioned.fill(
            child: Container(
              color: Colors.white,
              child: const LoadingWidget(),
            ),
          ),
      ],
    );
  }
}
