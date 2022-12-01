import 'package:flutter/cupertino.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:marketing_app/core/components/scaffold/scaffold.dart';
import 'package:marketing_app/view/basket/basket_view.dart';
import 'package:marketing_app/view/discover/discover_view.dart';
import 'package:marketing_app/view/favorites/favorites_view.dart';
import 'package:marketing_app/view/home/home_view.dart';

import '../core/components/bottomBar/bottom_navbar.dart';

class MainView extends StatefulWidget {
  const MainView({super.key});

  @override
  State<MainView> createState() => _MainViewState();
}

class _MainViewState extends State<MainView> {
  int _currentIndex = 0;
  final List<Widget> _pagesList = const [HomeView(), DiscoverView(), FavoritesView(), BasketView()];
  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      isThereAppbar: false,
      body: _pagesList.elementAt(_currentIndex),
      bottomNavigationBar: BottomNavbarWidget(onChange: (index) {
        _currentIndex = index;
        setState(() {});
      }),
    );
  }
}
