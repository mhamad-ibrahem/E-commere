import 'sub_routes/auth_routes.dart';
import 'sub_routes/main_routes.dart';
import 'sub_routes/orders_routes.dart';
import 'sub_routes/product_view_routes.dart';
import 'sub_routes/profile_routes.dart';

class AppRoutes with AuthRoutes,MainRoutes,ProductViewRoutes,ProfileRoutes,OrdersRoutes {
  static String splashScreen = "/";
}
