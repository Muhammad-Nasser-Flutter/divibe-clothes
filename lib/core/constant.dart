import 'package:flutter/foundation.dart';
import 'package:url_launcher/url_launcher.dart';

void printDebug(dynamic text) {
  if (kDebugMode) {
    print(text.toString());
  }
}

double get defaultPageHorizontalPadding => 50;

Future<void> launchAppStoreUrl() async {
  final url = 'https://apps.apple.com/';
  if (await canLaunchUrl(Uri.parse(url))) {
    await launchUrl(Uri.parse(url));
  } else {
    throw 'Could not launch $url';
  }
}

Future<void> launchPlayStoreUrl() async {
  final url = 'https://play.google.com/';
  if (await canLaunchUrl(Uri.parse(url))) {
    await launchUrl(Uri.parse(url));
  } else {
    throw 'Could not launch $url';
  }
}
