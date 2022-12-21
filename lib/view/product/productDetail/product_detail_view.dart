import 'package:flutter/material.dart';
import 'package:kartal/kartal.dart';
import 'package:sizer/sizer.dart';

import '../../../core/base/functions/base_functions.dart';
import '../../../core/base/model/product_model.dart';
import '../../../core/components/appbar/appbar.dart';
import '../../../core/components/button/button.dart';
import '../../../core/components/text/custom_text.dart';
import '../../../core/constants/app/color_constants.dart';
import '../../../core/extensions/num_extensions.dart';
import 'widget/image_slider.dart';

class ProductDetailView extends StatelessWidget {
  const ProductDetailView({super.key, required this.productModel});
  final ProductModel productModel;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: const CustomAppbar(title: "Product Detail"),
        body: SizedBox(
          width: context.dynamicWidth(1),
          height: context.dynamicHeight(1),
          child: Column(
            children: [
              5.h.ph,
              ImageSlideWidget(
                images: productModel.images ?? [],
              ),
              4.h.ph,
              Padding(
                padding: context.paddingNormal,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        CustomText(
                          productModel.title,
                          textStyle: context.textTheme.headline4?.copyWith(color: ColorConstants.instance?.mainColor),
                        ),
                      ],
                    ),
                    2.h.ph,
                    Row(
                      children: [
                        SizedBox(
                          width: context.dynamicWidth(0.9),
                          child: CustomText(
                            productModel.description,
                            maxLines: 3,
                            textStyle: context.textTheme.headline6?.copyWith(color: ColorConstants.instance?.cadetBlue),
                          ),
                        ),
                      ],
                    ),
                    5.h.ph,
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        CustomText(
                          '\$${productModel.price.toString()}',
                          textStyle: context.textTheme.headline5?.copyWith(color: ColorConstants.instance?.mainColor, fontWeight: FontWeight.w700),
                        ),
                      ],
                    ),
                    4.h.ph,
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        ButtonWidget(
                          onTap: () async {
                            BaseFunctions.instance?.addOrRemoveProductListLocaleStorage(context,
                              key: "basket",
                              productId: productModel.id.toString(),
                            );
                          },
                          text: "Add To Basket",
                          buttonColor: ColorConstants.instance?.mainColor,
                          width: 0.5,
                        ),
                      ],
                    )
                  ],
                ),
              )
            ],
          ),
        ));
  }
}
