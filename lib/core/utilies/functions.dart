import 'dart:io';

import 'package:cloth_ecommerce/core/routing/routes.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:url_launcher/url_launcher.dart';

void openMaps(double? latitude, double? longitude) async {
  if (latitude == null || longitude == null) {
    return;
  }
  String googleUrl = 'https://www.google.com/maps/search/?api=1&query=$latitude,$longitude';
  String appleUrl = 'https://maps.apple.com/?q=$latitude,$longitude';

  if (Platform.isIOS) {
    if (await canLaunchUrl(Uri.parse(appleUrl))) {
      await launchUrl(
        Uri.parse(appleUrl),
        mode: LaunchMode.externalApplication,
      );
    } else {
      throw 'Could not launch $appleUrl';
    }
  } else {
    if (await canLaunchUrl(Uri.parse(googleUrl))) {
      await launchUrl(
        Uri.parse(googleUrl),
        mode: LaunchMode.externalApplication,
      );
    } else {
      throw 'Could not launch $googleUrl';
    }
  }
}

void openMapsWithDirection({
  required double startLat,
  required double startLng,
  required double endLat,
  required double endLng,
}) async {
  final String googleUrl =
      'https://www.google.com/maps/dir/?api=1&origin=$startLat,$startLng&destination=$endLat,$endLng&travelmode=driving';

  final String appleUrl = 'http://maps.apple.com/?saddr=$startLat,$startLng&daddr=$endLat,$endLng';

  final url = Platform.isIOS ? appleUrl : googleUrl;

  if (await canLaunchUrl(Uri.parse(url))) {
    await launchUrl(Uri.parse(url), mode: LaunchMode.externalApplication);
  } else {
    throw 'Could not launch $url';
  }
}

Future<void> goToHomeSection(GlobalKey key) async {
  // final context = key.currentContext!;
  // final currentRoute = GoRouterState.of(context).matchedLocation;
  // if (currentRoute == '/' || currentRoute == '/home') {
    // Scroll to section
    _scrollToSection(key);
  // }
  //  else {
  //   // Navigate to home first, then scroll
  //   context.goNamed(Routes.homeRoute);
  //   // Delay to allow navigation to complete
  //   Future.delayed(const Duration(milliseconds: 2000), () {
  //     _scrollToSection(key);
  //   });
  // }
}

void _scrollToSection(GlobalKey key) {
  // Use post-frame callback to ensure widget is built
  WidgetsBinding.instance.addPostFrameCallback((_) {
    _attemptScroll(key, 0);
  });
}

void _attemptScroll(GlobalKey key, int attempt) {
  final context = key.currentContext;
  if (context != null) {
    Scrollable.ensureVisible(
      context,
      duration: const Duration(milliseconds: 800),
      curve: Curves.easeInOut,
      alignment: 0.0, // Align to top of viewport
    );
  } else if (attempt < 20) {
    // Retry up to 20 times (2 seconds total) with 100ms intervals
    Future.delayed(const Duration(milliseconds: 100), () {
      _attemptScroll(key, attempt + 1);
    });
  }
}
