import 'package:cloth_ecommerce/core/widgets/loading_wrapper.dart';
import 'package:cloth_ecommerce/features/home/presentation/screens/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:cloth_ecommerce/core/routing/routes.dart';
import 'package:cloth_ecommerce/main.dart';

final GoRouter router = GoRouter(
  initialLocation: Routes.homeRoute,
  navigatorKey: navigatorKey,
  onException: (context, state, router) {
    router.go(Routes.homeRoute);
  },
  routes: [
    GoRoute(
      path: Routes.homeRoute,
      name: Routes.homeRoute,
      pageBuilder: (context, state) => buildAnimatedPage(LoadingWrapper(child: HomeScreen())),
    ),
    // ShellRoute(
    //   builder: (context, state, child) {
    //     return MainLayoutScreen(child: child);
    //   },
    //   routes: [
    //     GoRoute(
    //       path: Routes.homeRoute,
    //       name: Routes.homeRoute,
    //       pageBuilder: (context, state) => buildAnimatedPage(const HomeScreen()),
    //     ),
    //     GoRoute(
    //       path: Routes.profileRoute,
    //       name: Routes.profileRoute,
    //       pageBuilder: (context, state) => buildAnimatedPage(const ProfileScreen()),
    //     ),
    //     GoRoute(
    //       path: Routes.appointmentsRoute,
    //       name: Routes.appointmentsRoute,
    //       pageBuilder: (context, state) => buildAnimatedPage(const AppointmentsScreen()),
    //     ),
    //     GoRoute(
    //       path: Routes.reportsRoute,
    //       name: Routes.reportsRoute,
    //       pageBuilder: (context, state) => buildAnimatedPage(const ReportsScreen()),
    //     ),
    //   ],
    // ),
    // GoRoute(
    //   path: Routes.onboardingRoute,
    //   name: Routes.onboardingRoute,
    //   pageBuilder: (context, state) => buildAnimatedPage(const OnboardingScreen()),
    // ),
    // GoRoute(
    //   path: Routes.loginRoute,
    //   name: Routes.loginRoute,
    //   pageBuilder: (context, state) => buildAnimatedPage(const LoginScreen()),
    // ),
    // GoRoute(
    //   path: Routes.registerRoute,
    //   name: Routes.registerRoute,
    //   pageBuilder: (context, state) => buildAnimatedPage(const RegisterScreen()),
    // ),

    // GoRoute(
    //   path: Routes.firstQuestionsRoute,
    //   name: Routes.firstQuestionsRoute,
    //   pageBuilder: (context, state) => buildAnimatedPage(const FirstQuestionsScreen()),
    // ),
    // GoRoute(
    //   path: Routes.secondQuestionsRoute,
    //   name: Routes.secondQuestionsRoute,
    //   pageBuilder: (context, state) => buildAnimatedPage(const SecondQuestionsScreen()),
    // ),

    // GoRoute(
    //   path: Routes.notFeelingWellRoute,
    //   name: Routes.notFeelingWellRoute,
    //   pageBuilder: (context, state) => buildAnimatedPage(const NotFeelingWellScreen()),
    // ),
    // GoRoute(
    //   path: Routes.chosenJustForYouRoute,
    //   name: Routes.chosenJustForYouRoute,
    //   pageBuilder: (context, state) => buildAnimatedPage(const ChosenJustForYouScreen()),
    // ),
    // GoRoute(
    //   path: Routes.heresWhatWeFoundRoute,
    //   name: Routes.heresWhatWeFoundRoute,
    //   pageBuilder: (context, state) => buildAnimatedPage(const HeresWhatWeFoundScreen()),
    // ),
    // GoRoute(
    //   path: Routes.processingStateRoute,
    //   name: Routes.processingStateRoute,
    //   pageBuilder: (context, state) => buildAnimatedPage(const ProcessingStateScreen()),
    // ),
    // GoRoute(
    //   path: Routes.uploadMedicalHistoryRoute,
    //   name: Routes.uploadMedicalHistoryRoute,
    //   pageBuilder: (context, state) => buildAnimatedPage(const UploadMedicalHistoryScreen()),
    // ),
    // GoRoute(
    //   path: Routes.bookingSummaryRoute,
    //   name: Routes.bookingSummaryRoute,
    //   pageBuilder: (context, state) => buildAnimatedPage(const BookingSummaryScreen()),
    // ),
    // GoRoute(
    //   path: Routes.bookingConfirmationRoute,
    //   name: Routes.bookingConfirmationRoute,
    //   pageBuilder: (context, state) => buildAnimatedPage(const BookingConfirmationScreen()),
    // ),
    // GoRoute(
    //   path: Routes.reportDetailsRoute,
    //   name: Routes.reportDetailsRoute,
    //   pageBuilder: (context, state) => buildAnimatedPage(const ReportDetailsScreen()),
    // ),
    // GoRoute(
    //   path: Routes.invoicesAndHistoryRoute,
    //   name: Routes.invoicesAndHistoryRoute,
    //   pageBuilder: (context, state) => buildAnimatedPage(const InvoicesAndHistoryScreen()),
    // ),
    // GoRoute(
    //   path: Routes.invoiceDetailsRoute,
    //   name: Routes.invoiceDetailsRoute,
    //   pageBuilder: (context, state) => buildAnimatedPage(const InvoiceDetailsScreen()),
    // ),
    // GoRoute(
    //   path: Routes.notificationsAndFollowupsRoute,
    //   name: Routes.notificationsAndFollowupsRoute,
    //   pageBuilder: (context, state) => buildAnimatedPage(const NotificationsAndFollowupsScreen()),
    // ),
    // GoRoute(
    //   path: Routes.pharmaciesRoute,
    //   name: Routes.pharmaciesRoute,
    //   pageBuilder: (context, state) => buildAnimatedPage(const PharmaciesScreen()),
    // ),
    // GoRoute(
    //   path: Routes.pharmacyDetailsRoute,
    //   name: Routes.pharmacyDetailsRoute,
    //   pageBuilder: (context, state) => buildAnimatedPage(const PharmacyDetailsScreen()),
    // ),
    // GoRoute(
    //   path: Routes.orderMedicineRoute,
    //   name: Routes.orderMedicineRoute,
    //   pageBuilder: (context, state) => buildAnimatedPage(const OrderMedicineScreen()),
    // ),
    // GoRoute(
    //   path: Routes.orderSummary,
    //   name: Routes.orderSummary,
    //   pageBuilder: (context, state) => buildAnimatedPage(const OrderSummaryScreen()),
    // ),
    // GoRoute(
    //   path: Routes.paymentMethodsRoute,
    //   name: Routes.paymentMethodsRoute,
    //   pageBuilder: (context, state) => buildAnimatedPage(const PaymentMethodsScreen()),
    // ),
    // GoRoute(
    //   path: Routes.appointmentDetailsScreen,
    //   name: Routes.appointmentDetailsScreen,
    //   pageBuilder: (context, state) => buildAnimatedPage(const AppointmentDetailsScreen()),
    // ),
  ],
);
CustomTransitionPage buildAnimatedPage(Widget child) {
  return CustomTransitionPage(
    key: ValueKey(child.runtimeType),
    child: child,
    transitionsBuilder: (context, animation, secondaryAnimation, child) {
      return FadeTransition(opacity: animation, child: child);
    },
  );
}
