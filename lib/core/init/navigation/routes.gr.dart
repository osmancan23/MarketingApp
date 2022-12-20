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
import 'package:auto_route/auto_route.dart' as _i8;
import 'package:flutter/material.dart' as _i9;

import '../../../view/basket/basket_view.dart' as _i5;
import '../../../view/discover/discover_view.dart' as _i6;
import '../../../view/favorites/favorites_view.dart' as _i7;
import '../../../view/home/home_view.dart' as _i4;
import '../../../view/main_view.dart' as _i1;
import '../../../view/product/productDetail/product_detail_view.dart' as _i3;
import '../../../view/product/searchProduct/search_product_view.dart' as _i2;
import '../../base/model/product_model.dart' as _i10;

class AppRouter extends _i8.RootStackRouter {
  AppRouter([_i9.GlobalKey<_i9.NavigatorState>? navigatorKey])
      : super(navigatorKey);

  @override
  final Map<String, _i8.PageFactory> pagesMap = {
    MainRoute.name: (routeData) {
      return _i8.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i1.MainView(),
      );
    },
    SearchProductRoute.name: (routeData) {
      final args = routeData.argsAs<SearchProductRouteArgs>();
      return _i8.MaterialPageX<dynamic>(
        routeData: routeData,
        child: _i2.SearchProductView(
          key: args.key,
          word: args.word,
          isCategoryName: args.isCategoryName,
        ),
      );
    },
    ProductDetailRoute.name: (routeData) {
      final args = routeData.argsAs<ProductDetailRouteArgs>();
      return _i8.MaterialPageX<dynamic>(
        routeData: routeData,
        child: _i3.ProductDetailView(
          key: args.key,
          productModel: args.productModel,
        ),
      );
    },
    HomeRoute.name: (routeData) {
      return _i8.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i4.HomeView(),
      );
    },
    BasketRoute.name: (routeData) {
      return _i8.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i5.BasketView(),
      );
    },
    DiscoverRoute.name: (routeData) {
      final args = routeData.argsAs<DiscoverRouteArgs>(
          orElse: () => const DiscoverRouteArgs());
      return _i8.MaterialPageX<dynamic>(
        routeData: routeData,
        child: _i6.DiscoverView(key: args.key),
      );
    },
    FavoritesRoute.name: (routeData) {
      return _i8.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i7.FavoritesView(),
      );
    },
  };

  @override
  List<_i8.RouteConfig> get routes => [
        _i8.RouteConfig(
          MainRoute.name,
          path: '/',
          children: [
            _i8.RouteConfig(
              HomeRoute.name,
              path: 'home',
              parent: MainRoute.name,
            ),
            _i8.RouteConfig(
              BasketRoute.name,
              path: 'basket',
              parent: MainRoute.name,
            ),
            _i8.RouteConfig(
              DiscoverRoute.name,
              path: 'discover',
              parent: MainRoute.name,
            ),
            _i8.RouteConfig(
              FavoritesRoute.name,
              path: 'favorites',
              parent: MainRoute.name,
            ),
          ],
        ),
        _i8.RouteConfig(
          SearchProductRoute.name,
          path: 'search',
        ),
        _i8.RouteConfig(
          ProductDetailRoute.name,
          path: 'product-detail',
        ),
      ];
}

/// generated route for
/// [_i1.MainView]
class MainRoute extends _i8.PageRouteInfo<void> {
  const MainRoute({List<_i8.PageRouteInfo>? children})
      : super(
          MainRoute.name,
          path: '/',
          initialChildren: children,
        );

  static const String name = 'MainRoute';
}

/// generated route for
/// [_i2.SearchProductView]
class SearchProductRoute extends _i8.PageRouteInfo<SearchProductRouteArgs> {
  SearchProductRoute({
    _i9.Key? key,
    required String word,
    bool isCategoryName = false,
  }) : super(
          SearchProductRoute.name,
          path: 'search',
          args: SearchProductRouteArgs(
            key: key,
            word: word,
            isCategoryName: isCategoryName,
          ),
        );

  static const String name = 'SearchProductRoute';
}

class SearchProductRouteArgs {
  const SearchProductRouteArgs({
    this.key,
    required this.word,
    this.isCategoryName = false,
  });

  final _i9.Key? key;

  final String word;

  final bool isCategoryName;

  @override
  String toString() {
    return 'SearchProductRouteArgs{key: $key, word: $word, isCategoryName: $isCategoryName}';
  }
}

/// generated route for
/// [_i3.ProductDetailView]
class ProductDetailRoute extends _i8.PageRouteInfo<ProductDetailRouteArgs> {
  ProductDetailRoute({
    _i9.Key? key,
    required _i10.ProductModel productModel,
  }) : super(
          ProductDetailRoute.name,
          path: 'product-detail',
          args: ProductDetailRouteArgs(
            key: key,
            productModel: productModel,
          ),
        );

  static const String name = 'ProductDetailRoute';
}

class ProductDetailRouteArgs {
  const ProductDetailRouteArgs({
    this.key,
    required this.productModel,
  });

  final _i9.Key? key;

  final _i10.ProductModel productModel;

  @override
  String toString() {
    return 'ProductDetailRouteArgs{key: $key, productModel: $productModel}';
  }
}

/// generated route for
/// [_i4.HomeView]
class HomeRoute extends _i8.PageRouteInfo<void> {
  const HomeRoute()
      : super(
          HomeRoute.name,
          path: 'home',
        );

  static const String name = 'HomeRoute';
}

/// generated route for
/// [_i5.BasketView]
class BasketRoute extends _i8.PageRouteInfo<void> {
  const BasketRoute()
      : super(
          BasketRoute.name,
          path: 'basket',
        );

  static const String name = 'BasketRoute';
}

/// generated route for
/// [_i6.DiscoverView]
class DiscoverRoute extends _i8.PageRouteInfo<DiscoverRouteArgs> {
  DiscoverRoute({_i9.Key? key})
      : super(
          DiscoverRoute.name,
          path: 'discover',
          args: DiscoverRouteArgs(key: key),
        );

  static const String name = 'DiscoverRoute';
}

class DiscoverRouteArgs {
  const DiscoverRouteArgs({this.key});

  final _i9.Key? key;

  @override
  String toString() {
    return 'DiscoverRouteArgs{key: $key}';
  }
}

/// generated route for
/// [_i7.FavoritesView]
class FavoritesRoute extends _i8.PageRouteInfo<void> {
  const FavoritesRoute()
      : super(
          FavoritesRoute.name,
          path: 'favorites',
        );

  static const String name = 'FavoritesRoute';
}
