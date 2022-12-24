import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:kartal/kartal.dart';
import 'package:sizer/sizer.dart';

import '../../core/base/bloc/product_bloc.dart';
import '../../core/base/service/product_service.dart';
import '../../core/components/productCard/product_card.dart';
import '../../core/components/text/custom_text.dart';
import '../../core/components/textFormField/text_form_field_widget.dart';
import '../../core/constants/app/color_constants.dart';
import '../../core/extensions/num_extensions.dart';
import '../../core/init/navigation/routes.gr.dart';
import '../../core/init/network/network_manager.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  TextEditingController _searchKeyController = TextEditingController();
  late ProductBloc productBloc;
  @override
  void initState() {
    productBloc = ProductBloc(ProductService(VexanaManager()));
    productBloc.add(FetchAllProducts());
    _searchKeyController.addListener(() {
      setState(() {});
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        8.h.ph,
        _searchField(context),
        2.h.ph,
        Row(
          children: [
            CustomText(
              "Top Products",
              textStyle: context.textTheme.headline5?.copyWith(color: ColorConstants.instance?.mainColor, fontWeight: FontWeight.w800),
            ),
          ],
        ),
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
                onPressed: () => context.router.push(SearchProductRoute(word: _searchKeyController.text)),
                icon: const FaIcon(FontAwesomeIcons.magnifyingGlass)),
      ],
    );
  }

/*
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
*/
  Widget _productGridView(BuildContext context) {
    return Container(
      color: Colors.transparent,
      width: context.dynamicWidth(1),
      child: BlocBuilder<ProductBloc, ProductState>(
        bloc: productBloc,
        builder: (context, state) {
          if (state is ProductsLoaded) {
            return GridView.builder(
              padding: context.paddingLow,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisExtent: 230,
                mainAxisSpacing: 10,
                crossAxisSpacing: 20,
              ),
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: state.productList.length,
              itemBuilder: (BuildContext context, int index) {
                var item = state.productList[index];
                return ProductCardWidget(productModel: item);
              },
            );
          } else if (state is ProductsLoading) {
            return const Center(child: CircularProgressIndicator());
          } else {
            return CustomText(state.toString());
          }
        },
      ),
    );
  }
}
