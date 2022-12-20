import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';

import '../../core/base/model/product_model.dart';
import '../../core/components/appbar/appbar.dart';
import '../../core/components/productCard/product_card.dart';

class FavoritesView extends StatelessWidget {
  const FavoritesView({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const CustomAppbar(title: "Favorites"),
        GridView.builder(
          shrinkWrap: true,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2, mainAxisExtent: 200, crossAxisSpacing: 10),
          itemCount: 2,
          itemBuilder: (BuildContext context, int index) {
            // ignore: prefer_const_constructors
            return ProductCardWidget(
              productModel: ProductModel(title: "dENEME", images: ["https://i.dummyjson.com/data/products/61/1.jpg"]),
            );
          },
        ),
      ],
    );
  }
}
