import 'package:easy_localization/easy_localization.dart';
import 'package:cloth_ecommerce/core/helpers/extensions.dart';
import 'package:cloth_ecommerce/core/theming/styles.dart';
import 'package:cloth_ecommerce/core/widgets/custom_button.dart';
import 'package:cloth_ecommerce/core/widgets/default_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:go_router/go_router.dart';
import 'package:scroll_date_picker/scroll_date_picker.dart';

Future<DateTime?> showDatePickerDialog({
  required BuildContext screenContext,
  required Function(DateTime) onDateSelected,
}) {
  return showDialog<DateTime>(
    context: screenContext,
    builder: (context) {
      return ScrollDatePickerDialog(
        onDateSelected: onDateSelected,
      );
    },
  );
}

class ScrollDatePickerDialog extends HookWidget {
  const ScrollDatePickerDialog({
    super.key,
    required this.onDateSelected,
  });
  final Function(DateTime) onDateSelected;

  @override
  Widget build(BuildContext context) {
    final selectedDate = useState<DateTime>(DateTime.now());
    return DefaultDialog(
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          SizedBox(
            height: 200,
            child: ScrollDatePicker(
              locale: context.locale,
              selectedDate: selectedDate.value,
              maximumDate: DateTime.now(),
              minimumDate: DateTime(1900),
              options: const DatePickerOptions(
                diameterRatio: 3,
                itemExtent: 45,
              ),
              scrollViewOptions: DatePickerScrollViewOptions(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                year: ScrollViewDetailOptions(
                  isLoop: false,
                  // margin: EdgeInsets.symmetric(horizontal: 16),
                  textStyle: style14,
                  selectedTextStyle: style16,
                ),
                month: ScrollViewDetailOptions(
                  // margin: EdgeInsets.symmetric(horizontal: 16),
                  textStyle: style14,
                  selectedTextStyle: style16,
                ),
                day: ScrollViewDetailOptions(
                  // margin: EdgeInsets.symmetric(horizontal: 16),
                  textStyle: style14,
                  selectedTextStyle: style16,
                ),
              ),
              viewType: [DatePickerViewType.year, DatePickerViewType.month, DatePickerViewType.day],
              onDateTimeChanged: (date) {
                selectedDate.value = date;
              },
            ),
          ),
          16.height,
          CustomButton(
            text: "Save".tr(),
            onPressed: () {
              onDateSelected(selectedDate.value);
              context.pop();
            },
          ),
        ],
      ),
    );
  }
}
