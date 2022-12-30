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
import '../../../core/init/locale_storage/locale_storage_manager.dart';
import 'widget/image_slider.dart';

class ProductDetailView extends StatefulWidget {
  const ProductDetailView({super.key, required this.productModel});
  final ProductModel productModel;

  @override
  State<ProductDetailView> createState() => _ProductDetailViewState();
}

class _ProductDetailViewState extends State<ProductDetailView> {
  bool isSaveBasket = false;

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
      var productList = await LocalStorageManager.getStringList("basket");
      if (productList != null) {
        isSaveBasket = productList.contains(widget.productModel.id.toString());
      } else {
        isSaveBasket = false;
      }
      setState(() {});
    });

    super.initState();
  }

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
                images: widget.productModel.images ?? [],
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
                          widget.productModel.title,
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
                            widget.productModel.description,
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
                          '\$${widget.productModel.price.toString()}',
                          textStyle: context.textTheme.headline5
                              ?.copyWith(color: ColorConstants.instance?.mainColor, fontWeight: FontWeight.w700),
                        ),
                      ],
                    ),
                    4.h.ph,
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        ButtonWidget(
                          onTap: () async {
                            isSaveBasket = !isSaveBasket;
                            setState(() {});
                            BaseFunctions.instance?.addOrRemoveProductListLocaleStorage(
                              context,
                              key: "basket",
                              productId: widget.productModel.id.toString(),
                            );
                          },
                          text: isSaveBasket ? "Remove From Basket" : "Add To Basket",
                          buttonColor: isSaveBasket ? Colors.red : ColorConstants.instance?.mainColor,
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
