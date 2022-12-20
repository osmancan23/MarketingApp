import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/base/bloc/product_bloc.dart';
import '../../../core/base/service/product_service.dart';
import '../../../core/components/productCard/product_card.dart';
import '../../../core/components/scaffold/scaffold.dart';
import '../../../core/components/text/custom_text.dart';
import '../../../core/init/network/network_manager.dart';

class SearchProductView extends StatefulWidget {
  final String word;
  final bool isCategoryName;
  const SearchProductView({super.key, required this.word, this.isCategoryName = false});

  @override
  State<SearchProductView> createState() => _SearchProductViewState();
}

class _SearchProductViewState extends State<SearchProductView> {
  late ProductBloc _productBloc;

  @override
  void initState() {
    _productBloc = ProductBloc(ProductService(VexanaManager()));
    widget.isCategoryName ? _productBloc.add(FetchProductByCategory(widget.word)) : _productBloc.add(SearchProducts(widget.word));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      appbarTitle: "Search Product",
      body: BlocBuilder<ProductBloc, ProductState>(
        bloc: _productBloc,
        builder: (context, state) {
          if (state is ProductsLoaded) {
            return GridView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              gridDelegate:
                  const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2, mainAxisExtent: 230, crossAxisSpacing: 10, mainAxisSpacing: 20),
              itemCount: state.productList.length,
              itemBuilder: (BuildContext context, int index) {
                var item = state.productList[index];
                // ignore: prefer_const_constructors
                return ProductCardWidget(
                  productModel: item,
                );
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
