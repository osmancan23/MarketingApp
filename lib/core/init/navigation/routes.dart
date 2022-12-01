import 'package:auto_route/auto_route.dart';
import 'package:marketing_app/view/home/home_view.dart';

// @CupertinoAutoRouter
// @AdaptiveAutoRouter
// @CustomAutoRouter
@MaterialAutoRouter(
  replaceInRouteName: 'Page|View|Screen,Route',
  routes: <AutoRoute>[
    AutoRoute(page: HomeView, initial: true),
  ],
)
class $AppRouter {}
