import 'package:flutter/material.dart';
import '../../features/auth/login/presentation/view/pages/login_page.dart';
import '../../features/auth/register/presentation/view/pages/register_page.dart';
import '../../features/main/presentation/view/page/main_page.dart';
import '../../features/splash/presentation/view/pages/splash_page.dart';
import 'route_export.dart';

class AppRouter {
  static Map<String, Widget Function(BuildContext)> routes = {
    AppRoutes.splashScreen: (context) => const SplashPage(),
    AppRoutes().mainRoute: (context) => const MainPage(),
    //auth
    AppRoutes().login: (context) => const LoginPage(),
    AppRoutes().register: (context) => const RegisterPage(),
    // AppRoutes().forgetPasswordRoute: (context) => const ForgetPasswordPage(),
    // //product details
    // AppRoutes().productDetailsRoute: (context) => const ProductDetailsPage(),
    // //profile routes
    // AppRoutes().addressesRoute: (context) => const ViewAddressesPage(),
    // AppRoutes().addAddressesRoute: (context) => const AddEditAddressPage(),
    // AppRoutes().changePasswordRoute: (context) => const ChangePasswordPage(),
    // AppRoutes().editProfileRoute: (context) => const EditProfilePage(),
    // AppRoutes().myOrdersRoute: (context) => const MyOrdersPage(),
    // AppRoutes().paymentMethodsRoute: (context) => const PaymentMethodPage(),

    // //orders
    // AppRoutes().successShipping: (context) => const SuccessShippingPage(),
    // AppRoutes().finishShipping: (context) => const FinishShippingPage(),
    // AppRoutes().myOrderDetailsRoute: (context) => const MyOrdersDetailsPage(),
    // AppRoutes().checkoutRoute: (context) => const CheckoutPage(),
  };

  static void navigateToNamed(
      {required BuildContext context,
      required String routeName,
      dynamic arguments}) {
    Navigator.of(context).pushNamed(routeName, arguments: arguments);
  }

  static void navigateOffNamed(
      {required BuildContext context,
      required String routeName,
      dynamic arguments}) {
    Navigator.of(context).popAndPushNamed(routeName, arguments: arguments);
  }

  static void navigateOffAllNamed(
      {required BuildContext context,
      required String routeName,
      dynamic arguments}) {
    Navigator.of(context).pushNamedAndRemoveUntil(
        routeName, (Route<dynamic> route) => false,
        arguments: arguments);
  }

  static void back({
    required BuildContext context,
  }) {
    Navigator.of(context).pop();
  }
}
