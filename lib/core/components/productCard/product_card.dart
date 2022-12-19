import 'package:flutter/material.dart';
import 'package:kartal/kartal.dart';
import 'package:sizer/sizer.dart';

import '../../constants/app/color_constants.dart';
import '../../extensions/num_extensions.dart';
import '../text/custom_text.dart';

class ProductCardWidget extends StatelessWidget {
  const ProductCardWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: context.normalBorderRadius,
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
        children: [
          1.h.ph,
          Expanded(flex: 2, child: ClipRRect(borderRadius: context.lowBorderRadius, child: Image.network("".randomSquareImage))),
          1.h.ph,
          Expanded(
            child: Column(
              children: [
                CustomText(
                  "Chair",
                  textStyle: context.textTheme.subtitle2?.copyWith(color: ColorConstants.instance?.mainColor),
                ),
                CustomText(
                  "250",
                  textStyle: context.textTheme.subtitle2?.copyWith(color: ColorConstants.instance?.mainColor),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
