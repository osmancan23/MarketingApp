import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:kartal/kartal.dart';
import 'package:marketing_app/core/components/bottomBar/bottom_navbar.dart';
import 'package:marketing_app/core/components/productCard/product_card.dart';
import 'package:marketing_app/core/components/scaffold/scaffold.dart';
import 'package:marketing_app/core/components/tabbar/tabbar.dart';
import 'package:marketing_app/core/components/text/custom_text.dart';
import 'package:marketing_app/core/constants/app/color_constants.dart';
import 'package:marketing_app/core/extensions/num_extensions.dart';
import 'package:marketing_app/core/init/navigation/routes.gr.dart';
import 'package:sizer/sizer.dart';

import '../../core/components/textFormField/text_form_field_widget.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  TextEditingController _searchKeyController = TextEditingController();

  @override
  void initState() {
    _searchKeyController.addListener(() {
      setState(() {});
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        2.h.ph,
        _searchField(context),
        2.h.ph,
        Row(
          children: [
            CustomText(
              "Explore",
              textStyle: context.textTheme.headline5?.copyWith(color: ColorConstants.instance?.mainColor, fontWeight: FontWeight.w800),
            ),
          ],
        ),
        1.h.ph,
        _productListView(context),
        TabbarWidget(onChange: (inde) {}),
        1.h.ph,
        _productGridView(context),
      ],
    );
  }

  Row _searchField(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        TextFormFieldWidget(
          textEditingController: _searchKeyController,
          width: 0.75,
          borderRadius: 30,
          borderWidth: 0,
          hintText: "Search Product ...",
          hintTextFontWeight: FontWeight.w700,
          fontSize: 12,

          // isThereShadow: true,
        ),
        _searchKeyController.text.isEmpty
            ? IconButton(onPressed: () => context.router.push(const BasketRoute()), icon: const FaIcon(FontAwesomeIcons.cartShopping))
            : IconButton(
                onPressed: () => context.router.push(SearchProductRoute(searchKey: _searchKeyController.text)),
                icon: const FaIcon(FontAwesomeIcons.magnifyingGlass)),
      ],
    );
  }

  SizedBox _productListView(BuildContext context) {
    return SizedBox(
      height: context.dynamicHeight(0.15),
      child: ListView.builder(
        itemCount: 5,
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        itemBuilder: (BuildContext context, int index) {
          return _discoverContainer(context);
        },
      ),
    );
  }

  Container _productGridView(BuildContext context) {
    return Container(
      color: Colors.transparent,
      width: context.dynamicWidth(1),
      height: context.dynamicHeight(0.4),
      child: GridView.builder(
        padding: context.paddingLow,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          mainAxisExtent: 170,
          mainAxisSpacing: 10,
          crossAxisSpacing: 20,
        ),
        shrinkWrap: true,
        itemCount: 10,
        itemBuilder: (BuildContext context, int index) {
          return const ProductCardWidget();
        },
      ),
    );
  }

  Widget _discoverContainer(BuildContext context) {
    return Padding(
      padding: context.horizontalPaddingLow,
      child: Container(
        width: context.dynamicWidth(0.27),
        decoration: BoxDecoration(color: ColorConstants.instance?.cadetBlue, borderRadius: context.lowBorderRadius),
      ),
    );
  }
}
