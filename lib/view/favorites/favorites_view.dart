import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sizer/sizer.dart';

import '../../core/base/bloc/product_bloc.dart';
import '../../core/base/service/product_service.dart';
import '../../core/components/appbar/appbar.dart';
import '../../core/components/notFound/notFound.dart';
import '../../core/components/productCard/product_card.dart';
import '../../core/components/text/custom_text.dart';
import '../../core/extensions/num_extensions.dart';
import '../../core/init/network/network_manager.dart';

class FavoritesView extends StatefulWidget {
  const FavoritesView({super.key});

  @override
  State<FavoritesView> createState() => _FavoritesViewState();
}

class _FavoritesViewState extends State<FavoritesView> {
  late ProductBloc _productBloc;
  @override
  void initState() {
    _productBloc = ProductBloc(ProductService(VexanaManager()));
    _productBloc.add(FetchAllFavoritesProducts());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const CustomAppbar(title: "Favorites"),
        4.h.ph,
        BlocBuilder<ProductBloc, ProductState>(
          bloc: _productBloc,
          builder: (context, state) {
            if (state is ProductsLoaded) {
              return state.productList.isNotEmpty
                  ? GridView.builder(
                      shrinkWrap: true,
                      padding: EdgeInsets.zero,
                      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        mainAxisExtent: 230,
                        mainAxisSpacing: 10,
                        crossAxisSpacing: 20,
                      ),
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: state.productList.length,
                      itemBuilder: (BuildContext context, int index) {
                        var item = state.productList[index];
                        return ProductCardWidget(productModel: item);
                      },
                    )
                  : const NotFoundProductWidget();
            } else if (state is ProductsLoading) {
              return const Center(child: CircularProgressIndicator());
            } else {
              return Center(child: CustomText(state.toString()));
            }
          },
        )
      ],
    );
  }
}
