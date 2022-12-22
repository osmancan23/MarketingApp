import 'package:auto_route/auto_route.dart';

import '../../../view/basket/basket_view.dart';
import '../../../view/discover/discover_view.dart';
import '../../../view/favorites/favorites_view.dart';
import '../../../view/home/home_view.dart';
import '../../../view/main_view.dart';
import '../../../view/payment/payment_result_view.dart';
import '../../../view/payment/payment_view.dart';
import '../../../view/product/productDetail/product_detail_view.dart';
import '../../../view/product/searchProduct/search_product_view.dart';
import '../../../view/splash/splash_view.dart';

// @CupertinoAutoRouter
// @AdaptiveAutoRouter
// @CustomAutoRouter
@MaterialAutoRouter(
  replaceInRouteName: 'Page|View|Screen,Route',
  routes: <AutoRoute>[
    AutoRoute(path: "/", page: SplashView, initial: true),
    AutoRoute(path: "", page: MainView, children: [
      AutoRoute(path: "home", page: HomeView),
      AutoRoute(path: "basket", page: BasketView),
      AutoRoute(path: "discover", page: DiscoverView),
      AutoRoute(path: "favorites", page: FavoritesView),
    ]),
    AutoRoute(path: "search", page: SearchProductView),
    AutoRoute(path: "product-detail", page: ProductDetailView),
    AutoRoute(path: "payment", page: PaymentView),
    AutoRoute(path: "payment-result", page: PaymentResultView),
  ],
)
class $AppRouter {}
