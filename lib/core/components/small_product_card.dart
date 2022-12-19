import 'package:flutter/material.dart';
import 'package:kartal/kartal.dart';
import 'package:sizer/sizer.dart';

import '../constants/app/color_constants.dart';
import '../extensions/num_extensions.dart';
import 'text/custom_text.dart';

class SmallProductCard extends StatefulWidget {
  final String? image;
  final String? title;
  final String? sellerName;
  final double? price;
  final void Function()? onClick;
  final bool? isFavoriteView;
  // final ProductModel? productModel;

  final double? padding;

  const SmallProductCard({Key? key, this.image, this.title, this.sellerName, this.price, this.onClick, this.padding = 4, this.isFavoriteView = false})
      : super(key: key);

  @override
  State<SmallProductCard> createState() => _SmallProductCardState();
}

class _SmallProductCardState extends State<SmallProductCard> {
  bool isLike = false;

  @override
  Widget build(BuildContext context) {
    return Container(
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
                    "".randomImage,
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
                    },
                  ),
                ),
              ),
            ],
          ),
          1.h.ph,
          CustomText(
            widget.title!,
            textStyle: context.textTheme.headline6!.copyWith(color: ColorConstants.instance?.mainColor, fontWeight: FontWeight.w500),
          ),
          0.1.h.ph,
          CustomText(
            '₺${widget.price}',
            textStyle: context.textTheme.headline6?.copyWith(color: ColorConstants.instance?.mainColor),
          ),
          0.1.h.ph,
        ],
      ),
    );
  }
}
