import 'package:cloth_ecommerce/core/cache_helper/cache_helper.dart';
import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:cloth_ecommerce/core/helpers/date_format.dart';
import 'package:cloth_ecommerce/core/helpers/enums.dart';

extension StringExtensions on String {
  String get firstTwoChars => (length >= 2) ? substring(0, 2).toUpperCase() : this;
}

extension StringExtension on String {
  String removeSpecialCharacters() {
    return replaceAll('\t', '').replaceAll('\r', '').replaceAll('\n', '').replaceAll('\\', '');
  }
}

// extension StringListExtension on BusTripEntity {
//   String toStringListAndRemoveBraces() {
//     return classes
//         .map((element) => element.className?.tr())
//         .toList()
//         .toString()
//         .replaceAll("[", "")
//         .replaceAll("]", "");
//   }
// }

extension RemoveBracesToString on List<String> {
  String toStringListAndRemoveBraces() {
    return toString().replaceAll("[", "").replaceAll("]", "").replaceAll(",", " -");
  }
}

extension DateTimeExtension on DateTime {
  String toCustomFormat() {
    final year = this.year.toString().padLeft(4, '0');
    final month = this.month.toString().padLeft(2, '0');
    final day = this.day.toString().padLeft(2, '0');
    return '$year-$month-$day';
  }
}

extension IsoStringFormatter on String {
  String formatIsoStringToTime(context) {
    try {
      DateTime dateTime = DateTime.parse(this);
      final String period = dateTime.hour < 12 ? 'AM'.tr() : 'PM'.tr();
      final int formattedHour = dateTime.hour % 12 == 0 ? 12 : dateTime.hour % 12;

      return '${formattedHour.toString().padLeft(2, '0')}:${dateTime.minute.toString().padLeft(2, '0')} - $period';
    } catch (e) {
      // Handle parsing errors or invalid ISO strings
      return 'Invalid DateTime';
    }
  }
}

extension TimeAgoExtension on String {
  String formatIsoStringToRelativeTime(BuildContext context) {
    try {
      DateTime dateTime = DateTime.parse(this);
      Duration difference = DateTime.now().difference(dateTime);

      // Check for negative duration
      if (difference.isNegative) {
        return 'Invalid DateTime';
      }

      if (difference.inMinutes < 60) {
        return difference.inMinutes == 1
            ? "a minute ago".tr()
            : "minutes ago".tr(
                namedArgs: {"minutes": difference.inMinutes.toArabicDigits},
              );
      } else if (difference.inMinutes > 60 && difference.inMinutes < 1440) {
        return difference.inHours == 1
            ? "an hour ago".tr()
            : "hours ago".tr(
                namedArgs: {"hours": difference.inHours.toArabicDigits},
              );
      } else {
        return difference.inDays == 1
            ? "Yesterday".tr()
            : CustomDateFormat.weekDayDayMonth(theTime: this, context: context);
      }
    } catch (e) {
      return 'Invalid DateTime';
    }
  }
}

extension RowPaddingExtension on Row {
  Row addPaddingBetweenChildren(double padding) {
    final childrenWithPadding = <Widget>[];
    for (int i = 0; i < children.length; i++) {
      childrenWithPadding.add(children[i]);
      if (i < children.length - 1) {
        childrenWithPadding.add(SizedBox(width: padding));
      }
    }
    return Row(
      mainAxisAlignment: mainAxisAlignment,
      children: childrenWithPadding,
    );
  }
}

extension DoubleExtraction on String {
  double extractDouble() {
    final numericPart = replaceAll(RegExp(r'[^0-9.]'), ''); // Remove non-numeric characters
    return double.tryParse(numericPart) ?? 0.0;
  }
}

extension IPAddressExtension on String {
  String removeLastSegment() {
    List<String> segments = split('.');
    if (segments.length >= 4) {
      segments.removeLast();
      return segments.join('.');
    }
    return this; // If the string doesn't contain a valid IP address, return the original string
  }
}

extension ListExtension<T> on List<T> {
  int indexOfContainingInt(int tableNum) {
    for (int i = 0; i < length; i++) {
      if (this[i].toString().contains(tableNum.toString())) {
        return i;
      }
    }
    return -1;
  }
}

extension SeatTypeExtension on SeatType {
  String get typeName {
    switch (this) {
      case SeatType.empty:
        return "empty";
      case SeatType.toilet:
        return "toilet";
      case SeatType.seat:
        return "seat";
    }
  }
}

extension SeatStatusExtension on SeatStatus {
  String get statusName {
    switch (this) {
      case SeatStatus.available:
        return "available";
      case SeatStatus.notAvailable:
        return "not available";
      case SeatStatus.reserved:
        return "reserved";
    }
  }
}

extension SizedBoxExtension on double {
  SizedBox get height => SizedBox(height: this);
  SizedBox get width => SizedBox(width: this);
}

extension SizedBoxExtension1 on int {
  SizedBox get height => SizedBox(height: toDouble());
  SizedBox get width => SizedBox(width: toDouble());
}

extension StringToDuration on String {
  Duration get toDuration {
    final regex = RegExp(r'(\d+)d\s*(\d+)h\s*(\d+)m');
    final match = regex.firstMatch(this);

    if (match != null) {
      final days = int.parse(match.group(1)!);
      final hours = int.parse(match.group(2)!);
      final minutes = int.parse(match.group(3)!);

      return Duration(days: days, hours: hours, minutes: minutes);
    } else {
      return Duration.zero;
    }
  }
}

extension CapitalizeFirstEnglishLetter on String {
  String get capitalizeFirstEnglishLetter {
    if (isEmpty) return this;

    final firstChar = this[0];
    final rest = substring(1);

    final isEnglishLetter = RegExp(r'[a-zA-Z]').hasMatch(firstChar);

    if (isEnglishLetter) {
      return '${firstChar.toUpperCase()}$rest';
    }

    return this;
  }
}

extension SymmetricPadding on Widget {
  Widget paddingAll({required double marginAll}) => Padding(
    padding: EdgeInsets.all(marginAll),
    child: this,
  );
  Widget paddingSymmetric({double? horizontal, double? vertical}) => Padding(
    padding: EdgeInsets.symmetric(horizontal: horizontal ?? 0, vertical: vertical ?? 0),
    child: this,
  );
  Widget paddingOnly({double? left, double? top, double? right, double? bottom}) => Padding(
    padding: EdgeInsets.only(left: left ?? 0, top: top ?? 0, right: right ?? 0, bottom: bottom ?? 0),
    child: this,
  );
}

extension CityNameNormalized on String {
  String get normalizeCityName {
    return toLowerCase()
        .replaceAll(RegExp(r'[^a-z0-9]'), '') // Remove punctuation & spaces
        .replaceAll('el', 'al'); // Normalize "El" to "Al"
  }
}

extension ArabicDigits on num {
  String get toArabicDigits {
    final westernToArabic = {
      '0': '٠',
      '1': '١',
      '2': '٢',
      '3': '٣',
      '4': '٤',
      '5': '٥',
      '6': '٦',
      '7': '٧',
      '8': '٨',
      '9': '٩',
      '.': ',', // keep the dot if needed
    };

    final result = toString().split('').map((char) => westernToArabic[char] ?? char).join();
    // Remove trailing .0 if exists
    if (result.endsWith('.0') || result.endsWith(',٠')) {
      return CacheHelper.isEn ? toString().substring(0, toString().length - 2) : result.substring(0, result.length - 2);
    } else {
      return CacheHelper.isEn ? toString() : result;
    }
  }
}

extension StringArabicDigits on String {
  String get toArabicDigits {
    final westernToArabic = {
      '0': '٠',
      '1': '١',
      '2': '٢',
      '3': '٣',
      '4': '٤',
      '5': '٥',
      '6': '٦',
      '7': '٧',
      '8': '٨',
      '9': '٩',
      '.': ',', // keep the dot if needed
    };

    final result = toString().split('').map((char) => westernToArabic[char] ?? char).join();
    // Remove trailing .0 if exists
    if (result.endsWith('.0') || result.endsWith(',٠')) {
      return CacheHelper.isEn ? substring(0, length - 2) : result.substring(0, result.length - 2);
    } else {
      return CacheHelper.isEn ? this : result;
    }
  }
}

extension IntToTimerDaysMinutesSeconds on int {
  String get toTimerDaysMinutesSeconds {
    final days = this ~/ (24 * 60 * 60);
    final hours = (this ~/ (60 * 60)) % 24;
    final minutes = (this ~/ 60) % 60;
    final seconds = this % 60;
    return "$days:$hours:$minutes:$seconds";
  }
}

extension ColorParsing on String {
  /// Converts a hex color string to a Color object
  /// Supports formats: '#RRGGBB', 'RRGGBB', '#RGB', 'RGB'
  /// Returns black if the string is not parsable
  Color toColor() {
    try {
      String hex = replaceAll('#', '');

      // Handle short format (#RGB -> #RRGGBB)
      if (hex.length == 3) {
        hex = hex.split('').map((char) => char + char).join();
      }

      // Add alpha channel if not present
      if (hex.length == 6) {
        hex = 'FF$hex';
      }

      return Color(int.parse(hex, radix: 16));
    } catch (e) {
      // Return black if parsing fails
      return Colors.black;
    }
  }
}
