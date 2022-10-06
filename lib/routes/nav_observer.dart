import 'dart:async';
// ignore: depend_on_referenced_packages
import 'package:collection/collection.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:rxdart/subjects.dart';

class NavObserver extends RouteObserver<PageRoute> {
  final List<Route<dynamic>> routeStack = [];

  // final StreamController<Route<dynamic>> _streamController =StreamController<Route<dynamic>>.broadcast();
  final BehaviorSubject<Route<dynamic>> _streamController =
      BehaviorSubject<Route<dynamic>>();

  Stream<Route<dynamic>> get currentRouteStream => _streamController.stream;

  Route<dynamic>? _currentRoute;
  Route<dynamic>? get currentRoute => _currentRoute;

  void _onActiveRoute(Route<dynamic> activeRoute) {
    _currentRoute = activeRoute;
    _streamController.sink.add(activeRoute);
    // log("NavObserver $activeRoute");
    // onChange(activeRoute);
  }

  void dispose() {
    _streamController.close();
  }

  Route getActiveRoute() {
    return routeStack.last;
  }

  Route<dynamic>? getRouteByName(String routeName) {
    late Route<dynamic>? foundRoute;
    if (routeStack.isNotEmpty) {
      try {
        foundRoute = routeStack.firstWhereOrNull(
          (el) => el.settings.name == routeName,
        );
      } catch (e) {
        if (kDebugMode) {
          print("getRouteByName.Failed $routeName $e");
        }
        // rethrow;
      }
    }
    return foundRoute;
  }

  // String? get triggeredFullPath => _triggeredFullPath;

  void _addRoute(Route<dynamic> route) {
    routeStack.add(route);

    _onActiveRoute(route);
  }

  @override
  void didPush(Route<dynamic> route, Route<dynamic>? previousRoute) {
    _addRoute(route);
  }

  @override
  void didPop(Route<dynamic> route, Route<dynamic>? previousRoute) {
    _removeLast(route);
  }

  @override
  void didRemove(Route route, Route? previousRoute) {
    _removeLast(route);
  }

  void _removeLast(Route<dynamic> route) {
    /*if (routeStack.length > 0) {
      routeStack.removeLast();
    }*/
    routeStack.remove(route);
    _onActiveRoute(routeStack.last);
  }

  @override
  void didReplace({Route<dynamic>? newRoute, Route<dynamic>? oldRoute}) {
    if (newRoute == null || oldRoute == null) return;
    final index = routeStack.indexOf(oldRoute);
    routeStack[index] = newRoute;
    _onActiveRoute(newRoute);
  }
}
