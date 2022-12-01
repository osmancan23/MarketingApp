// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************
//
// ignore_for_file: type=lint

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i6;
import 'package:flutter/material.dart' as _i7;

import '../../../view/basket/basket_view.dart' as _i3;
import '../../../view/discover/discover_view.dart' as _i4;
import '../../../view/favorites/favorites_view.dart' as _i5;
import '../../../view/home/home_view.dart' as _i2;
import '../../../view/main_view.dart' as _i1;

class AppRouter extends _i6.RootStackRouter {
  AppRouter([_i7.GlobalKey<_i7.NavigatorState>? navigatorKey])
      : super(navigatorKey);

  @override
  final Map<String, _i6.PageFactory> pagesMap = {
    MainRoute.name: (routeData) {
      return _i6.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i1.MainView(),
      );
    },
    HomeRoute.name: (routeData) {
      return _i6.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i2.HomeView(),
      );
    },
    BasketRoute.name: (routeData) {
      return _i6.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i3.BasketView(),
      );
    },
    DiscoverRoute.name: (routeData) {
      return _i6.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i4.DiscoverView(),
      );
    },
    FavoritesRoute.name: (routeData) {
      return _i6.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i5.FavoritesView(),
      );
    },
  };

  @override
  List<_i6.RouteConfig> get routes => [
        _i6.RouteConfig(
          MainRoute.name,
          path: '/',
          children: [
            _i6.RouteConfig(
              HomeRoute.name,
              path: 'home',
              parent: MainRoute.name,
            ),
            _i6.RouteConfig(
              BasketRoute.name,
              path: 'basket',
              parent: MainRoute.name,
            ),
            _i6.RouteConfig(
              DiscoverRoute.name,
              path: 'discover',
              parent: MainRoute.name,
            ),
            _i6.RouteConfig(
              FavoritesRoute.name,
              path: 'favorites',
              parent: MainRoute.name,
            ),
          ],
        )
      ];
}

/// generated route for
/// [_i1.MainView]
class MainRoute extends _i6.PageRouteInfo<void> {
  const MainRoute({List<_i6.PageRouteInfo>? children})
      : super(
          MainRoute.name,
          path: '/',
          initialChildren: children,
        );

  static const String name = 'MainRoute';
}

/// generated route for
/// [_i2.HomeView]
class HomeRoute extends _i6.PageRouteInfo<void> {
  const HomeRoute()
      : super(
          HomeRoute.name,
          path: 'home',
        );

  static const String name = 'HomeRoute';
}

/// generated route for
/// [_i3.BasketView]
class BasketRoute extends _i6.PageRouteInfo<void> {
  const BasketRoute()
      : super(
          BasketRoute.name,
          path: 'basket',
        );

  static const String name = 'BasketRoute';
}

/// generated route for
/// [_i4.DiscoverView]
class DiscoverRoute extends _i6.PageRouteInfo<void> {
  const DiscoverRoute()
      : super(
          DiscoverRoute.name,
          path: 'discover',
        );

  static const String name = 'DiscoverRoute';
}

/// generated route for
/// [_i5.FavoritesView]
class FavoritesRoute extends _i6.PageRouteInfo<void> {
  const FavoritesRoute()
      : super(
          FavoritesRoute.name,
          path: 'favorites',
        );

  static const String name = 'FavoritesRoute';
}
