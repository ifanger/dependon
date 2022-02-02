import 'routes.dart';

abstract class BaseRouter {
  String get path;

  RouteWidget get widget;
}
