// import 'package:flutter/material.dart';
//
// import 'package:intl_phone_number_input/intl_phone_number_input.dart';
// import '../cache_helper/cache_helper.dart';
// import '../theming/colors.dart';

// class InternationalPhoneWidget extends StatelessWidget {
//   const InternationalPhoneWidget({
//     super.key,
//     required this.controller,
//     this.validator,
//     this.onInputChanged,
//     this.isEnabled = true,
//     this.phoneNumberFocusNode,
//     this.borderColor,
//     this.backgroundColor,
//   });
//   final TextEditingController controller;
//   final String? Function(String?)? validator;
//   final Function(PhoneNumber)? onInputChanged;
//   final FocusNode? phoneNumberFocusNode;
//   final bool isEnabled;
//   final Color? backgroundColor;
//   final Color? borderColor;
//   @override
//   Widget build(BuildContext context) {
//     return Directionality(
//       textDirection: TextDirection.ltr,
//       child: InternationalPhoneNumberInput(
//         isEnabled: isEnabled,
//         autoFocusSearch: true,
//         focusNode: phoneNumberFocusNode,
//         countries: const ["EG"],
//         autoValidateMode: AutovalidateMode.onUserInteraction,
//         validator: validator,
//         keyboardAction: TextInputAction.done,
//         selectorConfig: SelectorConfig(
//           setSelectorButtonAsPrefixIcon: true,
//           leadingPadding: 15,
//           trailingSpace: false,
//           showFlags: true,
//           useBottomSheetSafeArea: false,
//           selectorType: PhoneInputSelectorType.BOTTOM_SHEET,
//         ),
//         inputBorder: OutlineInputBorder(
//           borderSide: BorderSide(
//             color: borderColor ?? AppColors.purpleColor,
//             width: 1,
//           ),
//           borderRadius: BorderRadius.circular(15),
//         ),
//         selectorTextStyle: CacheHelper.isEn
//             ? TextStyle(
//                 fontSize: 15,
//                 fontWeight: FontWeight.w500,
//                 color: Colors.black,
//                 fontFamily: "NeueHaas",
//                 letterSpacing: 2,
//               )
//             : TextStyle(
//                 fontSize: 15,
//                 fontWeight: FontWeight.w500,
//                 color: Colors.black,
//                 letterSpacing: 2,
//                 fontFamily: "Graphik",
//               ),
//         searchBoxDecoration: InputDecoration(
//           errorStyle: CacheHelper.isEn
//               ? TextStyle(
//                   fontSize: 12,
//                   fontWeight: FontWeight.w400,
//                   color: Colors.red,
//                   fontFamily: "NeueHaas",
//                 )
//               : TextStyle(
//                   fontSize: 12,
//                   fontWeight: FontWeight.w400,
//                   color: Colors.red,
//                   fontFamily: "Graphik",
//                 ),
//           hintText: "",
//           hintStyle: CacheHelper.isEn
//               ? TextStyle(
//                   fontSize: 15,
//                   fontWeight: FontWeight.w500,
//                   color: Colors.black,
//                   fontFamily: "NeueHaas",
//                   letterSpacing: 1,
//                 )
//               : TextStyle(
//                   fontSize: 15,
//                   fontWeight: FontWeight.w500,
//                   color: Colors.black,
//                   letterSpacing: 1,
//                   fontFamily: "Graphik",
//                 ),
//           border: OutlineInputBorder(
//             borderSide: const BorderSide(
//               color: AppColors.purpleColor,
//               width: 1,
//             ),
//             borderRadius: BorderRadius.circular(15),
//           ),
//           enabledBorder: OutlineInputBorder(
//             borderSide: const BorderSide(
//               color: AppColors.purpleColor,
//               width: 1,
//             ),
//             borderRadius: BorderRadius.circular(15),
//           ),
//           focusedBorder: OutlineInputBorder(
//             borderSide: const BorderSide(
//               color: AppColors.purpleColor,
//               width: 1,
//             ),
//             borderRadius: BorderRadius.circular(15),
//           ),
//           errorBorder: OutlineInputBorder(
//             borderSide: const BorderSide(
//               color: AppColors.purpleColor,
//               width: 1,
//             ),
//             borderRadius: BorderRadius.circular(15),
//           ),
//         ),
//         formatInput: false,
//         textFieldController: controller,
//         cursorColor: AppColors.purpleColor,
//         keyboardType: TextInputType.phone,
//         inputDecoration: InputDecoration(
//           contentPadding: EdgeInsets.symmetric(
//             vertical: 20,
//             horizontal: 5,
//           ),
//           fillColor: backgroundColor,
//           filled: true,
//           errorStyle: CacheHelper.isEn
//               ? TextStyle(
//                   fontSize: 12,
//                   fontWeight: FontWeight.w400,
//                   color: Colors.red,
//                   fontFamily: "NeueHaas",
//                 )
//               : TextStyle(
//                   fontSize: 12,
//                   fontWeight: FontWeight.w400,
//                   color: Colors.red,
//                   fontFamily: "Graphik",
//                 ),
//           errorBorder: OutlineInputBorder(
//             borderSide: BorderSide(
//               color: borderColor ?? AppColors.purpleColor,
//               width: 1,
//             ),
//             borderRadius: BorderRadius.circular(15),
//           ),
//           border: OutlineInputBorder(
//             borderSide: BorderSide(
//               color: borderColor ?? AppColors.purpleColor,
//               width: 1,
//             ),
//             borderRadius: BorderRadius.circular(15),
//           ),
//           enabledBorder: OutlineInputBorder(
//             borderSide: BorderSide(
//               color: borderColor ?? AppColors.purpleColor,
//               width: 1,
//             ),
//             borderRadius: BorderRadius.circular(15),
//           ),
//           focusedBorder: OutlineInputBorder(
//             borderSide: BorderSide(
//               color: borderColor ?? AppColors.purpleColor,
//               width: 1,
//             ),
//             borderRadius: BorderRadius.circular(15),
//           ),
//           disabledBorder: OutlineInputBorder(
//             borderSide: BorderSide(
//               color: borderColor ?? AppColors.purpleColor,
//               width: 1,
//             ),
//             borderRadius: BorderRadius.circular(15),
//           ),
//         ),
//         textStyle: CacheHelper.isEn
//             ? TextStyle(
//                 fontSize: 15,
//                 fontWeight: FontWeight.w500,
//                 color: Colors.black,
//                 fontFamily: "NeueHaas",
//                 letterSpacing: 2,
//               )
//             : TextStyle(
//                 fontSize: 15,
//                 fontWeight: FontWeight.w500,
//                 color: Colors.black,
//                 letterSpacing: 2,
//                 fontFamily: "Graphik",
//               ),
//         onInputChanged: onInputChanged,
//       ),
//     );
//   }
// }
