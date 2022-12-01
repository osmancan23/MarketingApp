import 'package:auto_route/auto_route.dart';
import 'package:marketing_app/view/basket/basket_view.dart';
import 'package:marketing_app/view/discover/discover_view.dart';
import 'package:marketing_app/view/favorites/favorites_view.dart';
import 'package:marketing_app/view/home/home_view.dart';
import 'package:marketing_app/view/main_view.dart';

// @CupertinoAutoRouter
// @AdaptiveAutoRouter
// @CustomAutoRouter
@MaterialAutoRouter(
  replaceInRouteName: 'Page|View|Screen,Route',
  routes: <AutoRoute>[
    AutoRoute(path: "/", page: MainView, initial: true, children: [
      AutoRoute(path: "home", page: HomeView),
      AutoRoute(path: "basket", page: BasketView),
      AutoRoute(path: "discover", page: DiscoverView),
      AutoRoute(path: "favorites", page: FavoritesView),
    ])
  ],
)
class $AppRouter {}
