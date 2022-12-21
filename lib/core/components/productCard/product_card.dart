import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:kartal/kartal.dart';
import 'package:sizer/sizer.dart';

import '../../base/functions/base_functions.dart';
import '../../base/model/product_model.dart';
import '../../constants/app/color_constants.dart';
import '../../extensions/num_extensions.dart';
import '../../init/locale_storage/locale_storage_manager.dart';
import '../../init/navigation/routes.gr.dart';
import '../text/custom_text.dart';

class ProductCardWidget extends StatefulWidget {
  final ProductModel? productModel;

  const ProductCardWidget({Key? key, this.productModel}) : super(key: key);

  @override
  State<ProductCardWidget> createState() => _ProductCardWidgetState();
}

class _ProductCardWidgetState extends State<ProductCardWidget> {
  bool isLike = false;

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
      var favorites = await LocalStorageManager.getStringList("favorites");

      isLike = favorites!.contains(widget.productModel!.id.toString());
      setState(() {});
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => context.router.push(ProductDetailRoute(productModel: widget.productModel!)),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: context.lowBorderRadius,
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.2),
              spreadRadius: 5,
              blurRadius: 7,
              offset: const Offset(0, 3), // changes position of shadow
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Stack(
              children: [
                SizedBox(
                  width: context.dynamicWidth(0.7),
                  height: 15.h + 20,
                  child: ClipRRect(
                    borderRadius: context.lowBorderRadius,
                    child: Image.network(
                      widget.productModel!.images!.first,
                      fit: BoxFit.fill,
                    ),
                  ),
                ),
                Positioned(
                  top: 0,
                  right: 0,
                  child: Container(
                    width: 37,
                    margin: EdgeInsets.all(1.w),
                    decoration: const BoxDecoration(
                        shape: BoxShape.circle, color: Colors.white, boxShadow: [BoxShadow(offset: Offset(0, 1), color: Colors.grey, blurRadius: 1)]),
                    child: IconButton(
                      splashColor: Colors.white,
                      icon: isLike
                          ? const Icon(
                              Icons.favorite,
                              color: Colors.red,
                            )
                          : const Icon(
                              Icons.favorite_border_outlined,
                              color: Colors.grey,
                            ),
                      onPressed: () async {
                        setState(() {
                          isLike = !isLike;
                        });
                        BaseFunctions.instance?.addOrRemoveProductListLocaleStorage(
                          context,
                          key: "favorites",
                          productId: widget.productModel!.id.toString(),
                        );
                      },
                    ),
                  ),
                ),
              ],
            ),
            1.h.ph,
            CustomText(
              BaseFunctions.instance?.toShortString(widget.productModel?.title!, countCharacter: 16),
              textStyle: context.textTheme.headline6!.copyWith(
                color: ColorConstants.instance?.mainColor,
                fontWeight: FontWeight.w500,
              ),
              textAlign: TextAlign.center,
            ),
            0.1.h.ph,
            CustomText(
              '\$${widget.productModel?.price}',
              textStyle: context.textTheme.headline6?.copyWith(color: ColorConstants.instance?.mainColor),
            ),
            0.1.h.ph,
          ],
        ),
      ),
    );
  }
}
