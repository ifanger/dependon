import 'package:flutter/material.dart';

import '../presentation/home/home_router.dart';
import 'base_router.dart';

typedef RouteWidget = Widget Function(BuildContext);

final Set<BaseRouter> _routes = {
  HomeRouter(),
};

final BaseRouter initialRoute = _routes.first;

final Map<String, RouteWidget> routes = {
  for (var route in _routes) route.path: route.widget
};
