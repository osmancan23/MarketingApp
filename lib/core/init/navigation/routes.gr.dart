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
import 'package:auto_route/auto_route.dart' as _i11;
import 'package:flutter/material.dart' as _i12;

import '../../../view/basket/basket_view.dart' as _i8;
import '../../../view/discover/discover_view.dart' as _i9;
import '../../../view/favorites/favorites_view.dart' as _i10;
import '../../../view/home/home_view.dart' as _i7;
import '../../../view/main_view.dart' as _i2;
import '../../../view/payment/payment_result_view.dart' as _i6;
import '../../../view/payment/payment_view.dart' as _i5;
import '../../../view/product/productDetail/product_detail_view.dart' as _i4;
import '../../../view/product/searchProduct/search_product_view.dart' as _i3;
import '../../../view/splash/splash_view.dart' as _i1;
import '../../base/model/product_model.dart' as _i13;

class AppRouter extends _i11.RootStackRouter {
  AppRouter([_i12.GlobalKey<_i12.NavigatorState>? navigatorKey])
      : super(navigatorKey);

  @override
  final Map<String, _i11.PageFactory> pagesMap = {
    SplashRoute.name: (routeData) {
      return _i11.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i1.SplashView(),
      );
    },
    MainRoute.name: (routeData) {
      return _i11.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i2.MainView(),
      );
    },
    SearchProductRoute.name: (routeData) {
      final args = routeData.argsAs<SearchProductRouteArgs>();
      return _i11.MaterialPageX<dynamic>(
        routeData: routeData,
        child: _i3.SearchProductView(
          key: args.key,
          word: args.word,
          isCategoryName: args.isCategoryName,
        ),
      );
    },
    ProductDetailRoute.name: (routeData) {
      final args = routeData.argsAs<ProductDetailRouteArgs>();
      return _i11.MaterialPageX<dynamic>(
        routeData: routeData,
        child: _i4.ProductDetailView(
          key: args.key,
          productModel: args.productModel,
        ),
      );
    },
    PaymentRoute.name: (routeData) {
      return _i11.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i5.PaymentView(),
      );
    },
    PaymentResultRoute.name: (routeData) {
      return _i11.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i6.PaymentResultView(),
      );
    },
    HomeRoute.name: (routeData) {
      return _i11.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i7.HomeView(),
      );
    },
    BasketRoute.name: (routeData) {
      return _i11.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i8.BasketView(),
      );
    },
    DiscoverRoute.name: (routeData) {
      final args = routeData.argsAs<DiscoverRouteArgs>(
          orElse: () => const DiscoverRouteArgs());
      return _i11.MaterialPageX<dynamic>(
        routeData: routeData,
        child: _i9.DiscoverView(key: args.key),
      );
    },
    FavoritesRoute.name: (routeData) {
      return _i11.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i10.FavoritesView(),
      );
    },
  };

  @override
  List<_i11.RouteConfig> get routes => [
        _i11.RouteConfig(
          SplashRoute.name,
          path: '/',
        ),
        _i11.RouteConfig(
          MainRoute.name,
          path: '',
          children: [
            _i11.RouteConfig(
              HomeRoute.name,
              path: 'home',
              parent: MainRoute.name,
            ),
            _i11.RouteConfig(
              BasketRoute.name,
              path: 'basket',
              parent: MainRoute.name,
            ),
            _i11.RouteConfig(
              DiscoverRoute.name,
              path: 'discover',
              parent: MainRoute.name,
            ),
            _i11.RouteConfig(
              FavoritesRoute.name,
              path: 'favorites',
              parent: MainRoute.name,
            ),
          ],
        ),
        _i11.RouteConfig(
          SearchProductRoute.name,
          path: 'search',
        ),
        _i11.RouteConfig(
          ProductDetailRoute.name,
          path: 'product-detail',
        ),
        _i11.RouteConfig(
          PaymentRoute.name,
          path: 'payment',
        ),
        _i11.RouteConfig(
          PaymentResultRoute.name,
          path: 'payment-result',
        ),
      ];
}

/// generated route for
/// [_i1.SplashView]
class SplashRoute extends _i11.PageRouteInfo<void> {
  const SplashRoute()
      : super(
          SplashRoute.name,
          path: '/',
        );

  static const String name = 'SplashRoute';
}

/// generated route for
/// [_i2.MainView]
class MainRoute extends _i11.PageRouteInfo<void> {
  const MainRoute({List<_i11.PageRouteInfo>? children})
      : super(
          MainRoute.name,
          path: '',
          initialChildren: children,
        );

  static const String name = 'MainRoute';
}

/// generated route for
/// [_i3.SearchProductView]
class SearchProductRoute extends _i11.PageRouteInfo<SearchProductRouteArgs> {
  SearchProductRoute({
    _i12.Key? key,
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

  final _i12.Key? key;

  final String word;

  final bool isCategoryName;

  @override
  String toString() {
    return 'SearchProductRouteArgs{key: $key, word: $word, isCategoryName: $isCategoryName}';
  }
}

/// generated route for
/// [_i4.ProductDetailView]
class ProductDetailRoute extends _i11.PageRouteInfo<ProductDetailRouteArgs> {
  ProductDetailRoute({
    _i12.Key? key,
    required _i13.ProductModel productModel,
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

  final _i12.Key? key;

  final _i13.ProductModel productModel;

  @override
  String toString() {
    return 'ProductDetailRouteArgs{key: $key, productModel: $productModel}';
  }
}

/// generated route for
/// [_i5.PaymentView]
class PaymentRoute extends _i11.PageRouteInfo<void> {
  const PaymentRoute()
      : super(
          PaymentRoute.name,
          path: 'payment',
        );

  static const String name = 'PaymentRoute';
}

/// generated route for
/// [_i6.PaymentResultView]
class PaymentResultRoute extends _i11.PageRouteInfo<void> {
  const PaymentResultRoute()
      : super(
          PaymentResultRoute.name,
          path: 'payment-result',
        );

  static const String name = 'PaymentResultRoute';
}

/// generated route for
/// [_i7.HomeView]
class HomeRoute extends _i11.PageRouteInfo<void> {
  const HomeRoute()
      : super(
          HomeRoute.name,
          path: 'home',
        );

  static const String name = 'HomeRoute';
}

/// generated route for
/// [_i8.BasketView]
class BasketRoute extends _i11.PageRouteInfo<void> {
  const BasketRoute()
      : super(
          BasketRoute.name,
          path: 'basket',
        );

  static const String name = 'BasketRoute';
}

/// generated route for
/// [_i9.DiscoverView]
class DiscoverRoute extends _i11.PageRouteInfo<DiscoverRouteArgs> {
  DiscoverRoute({_i12.Key? key})
      : super(
          DiscoverRoute.name,
          path: 'discover',
          args: DiscoverRouteArgs(key: key),
        );

  static const String name = 'DiscoverRoute';
}

class DiscoverRouteArgs {
  const DiscoverRouteArgs({this.key});

  final _i12.Key? key;

  @override
  String toString() {
    return 'DiscoverRouteArgs{key: $key}';
  }
}

/// generated route for
/// [_i10.FavoritesView]
class FavoritesRoute extends _i11.PageRouteInfo<void> {
  const FavoritesRoute()
      : super(
          FavoritesRoute.name,
          path: 'favorites',
        );

  static const String name = 'FavoritesRoute';
}
