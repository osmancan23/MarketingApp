import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kartal/kartal.dart';
import 'package:sizer/sizer.dart';

import '../../core/base/bloc/product_bloc.dart';
import '../../core/components/appbar/appbar.dart';
import '../../core/components/button/button.dart';
import '../../core/components/notFound/notFound.dart';
import '../../core/components/text/custom_text.dart';
import '../../core/extensions/num_extensions.dart';
import '../../core/init/navigation/routes.gr.dart';
import 'widget/basket_list_tile.dart';

class BasketView extends StatefulWidget {
  const BasketView({super.key});

  @override
  State<BasketView> createState() => _BasketViewState();
}

class _BasketViewState extends State<BasketView> {
  late ProductBloc _basketBloc;

  @override
  void initState() {
    _basketBloc = context.read<ProductBloc>();
    _basketBloc.add(FetchAllBasketProducts());
    _basketBloc.stream.listen((event) {
      if (event is UpdatedBasket) {
        _basketBloc.add(FetchAllBasketProducts());
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const CustomAppbar(title: "Basket"),
        2.h.ph,
        SizedBox(
            height: context.dynamicHeight(0.65),
            child: BlocBuilder<ProductBloc, ProductState>(
              bloc: _basketBloc,
              builder: (context, state) {
                if (state is ProductsLoaded) {
                  return state.productList.isNotEmpty
                      ? ListView.builder(
                          padding: EdgeInsets.zero,
                          itemCount: state.productList.length,
                          shrinkWrap: true,
                          itemBuilder: (BuildContext context, int index) {
                            var item = state.productList[index];
                            return Padding(
                              padding: context.verticalPaddingLow,
                              child: BasketListTileWidget(productModel: item),
                            );
                          },
                        )
                      : const NotFoundProductWidget();
                } else if (state is ProductsLoading) {
                  return const Center(child: CircularProgressIndicator());
                } else {
                  return CustomText(state.toString());
                }
              },
            )),
        ButtonWidget(
          onTap: () => context.router.push(const PaymentRoute()),
          buttonColor: Colors.teal,
          text: "Devam Et",
        )
      ],
    );
  }
}
