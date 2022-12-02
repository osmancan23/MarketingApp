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
import 'package:auto_route/auto_route.dart' as _i7;
import 'package:flutter/cupertino.dart' as _i9;
import 'package:flutter/material.dart' as _i8;

import '../../../view/basket/basket_view.dart' as _i4;
import '../../../view/discover/discover_view.dart' as _i5;
import '../../../view/favorites/favorites_view.dart' as _i6;
import '../../../view/home/home_view.dart' as _i3;
import '../../../view/main_view.dart' as _i1;
import '../../../view/product/searchProduct/search_product_view.dart' as _i2;

class AppRouter extends _i7.RootStackRouter {
  AppRouter([_i8.GlobalKey<_i8.NavigatorState>? navigatorKey])
      : super(navigatorKey);

  @override
  final Map<String, _i7.PageFactory> pagesMap = {
    MainRoute.name: (routeData) {
      return _i7.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i1.MainView(),
      );
    },
    SearchProductRoute.name: (routeData) {
      final args = routeData.argsAs<SearchProductRouteArgs>();
      return _i7.MaterialPageX<dynamic>(
        routeData: routeData,
        child: _i2.SearchProductView(
          key: args.key,
          searchKey: args.searchKey,
        ),
      );
    },
    HomeRoute.name: (routeData) {
      return _i7.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i3.HomeView(),
      );
    },
    BasketRoute.name: (routeData) {
      return _i7.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i4.BasketView(),
      );
    },
    DiscoverRoute.name: (routeData) {
      return _i7.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i5.DiscoverView(),
      );
    },
    FavoritesRoute.name: (routeData) {
      return _i7.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i6.FavoritesView(),
      );
    },
  };

  @override
  List<_i7.RouteConfig> get routes => [
        _i7.RouteConfig(
          MainRoute.name,
          path: '/',
          children: [
            _i7.RouteConfig(
              HomeRoute.name,
              path: 'home',
              parent: MainRoute.name,
            ),
            _i7.RouteConfig(
              BasketRoute.name,
              path: 'basket',
              parent: MainRoute.name,
            ),
            _i7.RouteConfig(
              DiscoverRoute.name,
              path: 'discover',
              parent: MainRoute.name,
            ),
            _i7.RouteConfig(
              FavoritesRoute.name,
              path: 'favorites',
              parent: MainRoute.name,
            ),
          ],
        ),
        _i7.RouteConfig(
          SearchProductRoute.name,
          path: 'search',
        ),
      ];
}

/// generated route for
/// [_i1.MainView]
class MainRoute extends _i7.PageRouteInfo<void> {
  const MainRoute({List<_i7.PageRouteInfo>? children})
      : super(
          MainRoute.name,
          path: '/',
          initialChildren: children,
        );

  static const String name = 'MainRoute';
}

/// generated route for
/// [_i2.SearchProductView]
class SearchProductRoute extends _i7.PageRouteInfo<SearchProductRouteArgs> {
  SearchProductRoute({
    _i9.Key? key,
    required String searchKey,
  }) : super(
          SearchProductRoute.name,
          path: 'search',
          args: SearchProductRouteArgs(
            key: key,
            searchKey: searchKey,
          ),
        );

  static const String name = 'SearchProductRoute';
}

class SearchProductRouteArgs {
  const SearchProductRouteArgs({
    this.key,
    required this.searchKey,
  });

  final _i9.Key? key;

  final String searchKey;

  @override
  String toString() {
    return 'SearchProductRouteArgs{key: $key, searchKey: $searchKey}';
  }
}

/// generated route for
/// [_i3.HomeView]
class HomeRoute extends _i7.PageRouteInfo<void> {
  const HomeRoute()
      : super(
          HomeRoute.name,
          path: 'home',
        );

  static const String name = 'HomeRoute';
}

/// generated route for
/// [_i4.BasketView]
class BasketRoute extends _i7.PageRouteInfo<void> {
  const BasketRoute()
      : super(
          BasketRoute.name,
          path: 'basket',
        );

  static const String name = 'BasketRoute';
}

/// generated route for
/// [_i5.DiscoverView]
class DiscoverRoute extends _i7.PageRouteInfo<void> {
  const DiscoverRoute()
      : super(
          DiscoverRoute.name,
          path: 'discover',
        );

  static const String name = 'DiscoverRoute';
}

/// generated route for
/// [_i6.FavoritesView]
class FavoritesRoute extends _i7.PageRouteInfo<void> {
  const FavoritesRoute()
      : super(
          FavoritesRoute.name,
          path: 'favorites',
        );

  static const String name = 'FavoritesRoute';
}
