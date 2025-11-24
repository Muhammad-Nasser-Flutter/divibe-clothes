// import 'package:easy_localization/easy_localization.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// // import 'package:internet_connection_checker/internet_connection_checker.dart';
// import 'package:lottie/lottie.dart';
// import 'package:cloth_ecommerce/core/Language/bloc/language_bloc.dart';
// import 'package:cloth_ecommerce/core/Language/bloc/language_state.dart';
// import 'package:cloth_ecommerce/core/routing/custom_go_router.dart';
// import 'package:cloth_ecommerce/core/routing/routes.dart';
// import 'package:cloth_ecommerce/core/theming/assets.dart';
// import 'package:cloth_ecommerce/core/utilies/easy_loading.dart';
// import 'package:cloth_ecommerce/core/widgets/custom_texts.dart';
// import 'package:cloth_ecommerce/core/widgets/error_widget.dart';
// import 'package:cloth_ecommerce/core/widgets/finding_button.dart';

// class InternetConnectionWidget extends StatefulWidget {
//   const InternetConnectionWidget({super.key, required this.widget});
//   final Widget widget;

//   @override
//   State<InternetConnectionWidget> createState() => _InternetConnectionWidgetState();
// }

// class _InternetConnectionWidgetState extends State<InternetConnectionWidget> {
//   bool isConnected = true;
//   @override
//   void initState() {
//     super.initState();
//     WidgetsBinding.instance.addPostFrameCallback(
//       (_) {
//         InternetConnectionChecker().onStatusChange.asBroadcastStream().listen((result) {
//           if (result == InternetConnectionStatus.disconnected) {
//             setState(() {
//               if (router.state.name != Routes.internetDisconnectedScreen) {
//                 router.pushNamed(Routes.internetDisconnectedScreen);
//               }
//               isConnected = false;
//             });
//           }
//           if (result == InternetConnectionStatus.connected) {
//             if (isConnected == false) {
//               setState(() {
//                 if (router.state.name == Routes.internetDisconnectedScreen) {
//                   router.pop();
//                 }
//                 isConnected = true;
//               });
//             }
//           }
//         });
//       },
//     );
//   }

//   @override
//   Widget build(BuildContext context) {
//     return StreamBuilder<InternetConnectionStatus>(
//       stream: InternetConnectionChecker().onStatusChange,
//       initialData: InternetConnectionStatus.connected,
//       builder: (context, snapshot) {
//         return widget.widget;
//       },
//     );
//   }
// }

// class InternetDisconnectedScreen extends StatelessWidget {
//   const InternetDisconnectedScreen({
//     super.key,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return BlocBuilder<LanguageBloc, LanguageState>(
//       builder: (context, state) {
//         return PopScope(
//           canPop: false,
//           child: Scaffold(
//             body: Container(
//               color: Colors.white,
//               width: MediaQuery.sizeOf(context).width,
//               child: TregoErrorWidget(
//                 asset: Assets.offlineFailureImage,
//                 message: "No Internet Connection !".tr(),
//                 secondaryWidget: Text16(
//                   text: "The app will automatically be restored when you connect to the internet".tr(),
//                   textColor: Colors.black54,
//                   weight: FontWeight.w500,
//                   alignment: TextAlign.center,
//                 ),
//                 textColor: Colors.black,
//               ),
//             ),
//             bottomNavigationBar: SafeArea(
//               minimum: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
//               child: FindingButton(
//                 disabled: false,
//                 text: "Try again".tr(),
//                 onPressed: () async {
//                   showCustomLoading(
//                     indicator: LottieBuilder.asset(
//                       height: 100,
//                       Assets.noInternetLottie,
//                       animate: true,
//                     ),
//                     message: "Checking internet connection...".tr(),
//                   );
//                   await Future.delayed(const Duration(seconds: 3));
//                   hideLoading();
//                 },
//               ),
//             ),
//           ),
//         );
//       },
//     );
//   }
// }
