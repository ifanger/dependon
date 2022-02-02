import '../../infrastructure/base_router.dart';
import '../../infrastructure/routes.dart';
import 'home_screen.dart';

class HomeRouter extends BaseRouter {
  @override
  String get path => '/home';

  @override
  RouteWidget get widget => (_) => HomeScreen();
}
