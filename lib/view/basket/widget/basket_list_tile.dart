import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:kartal/kartal.dart';
import 'package:sizer/sizer.dart';

import '../../../core/components/text/custom_text.dart';
import '../../../core/constants/app/color_constants.dart';
import '../../../core/extensions/num_extensions.dart';

class BasketListTileWidget extends StatelessWidget {
  const BasketListTileWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Slidable(
      key: UniqueKey(),
      endActionPane: ActionPane(
        motion: const BehindMotion(),
        children: [
          Container(
            width: context.dynamicWidth(0.3),
            height: MediaQuery.of(context).size.height / 2.5,
            decoration: const BoxDecoration(
              color: Colors.red,
              borderRadius: BorderRadius.only(topRight: Radius.circular(10), bottomRight: Radius.circular(10)),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                InkWell(
                  onTap: () {},
                  child: const Icon(
                    Icons.delete,
                    color: Colors.white,
                  ),
                ),
                CustomText(
                  "Sil",
                  textStyle: context.textTheme.headline6?.copyWith(color: Colors.white),
                )
              ],
            ),
          ),
        ],
      ),
      child: Container(
        width: context.dynamicWidth(0.85),
        height: context.dynamicHeight(0.13),
        decoration: BoxDecoration(
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.2),
                spreadRadius: 5,
                blurRadius: 7,
                offset: const Offset(0, 3), // changes position of shadow
              ),
            ],
            borderRadius: context.lowBorderRadius),
        child: Row(children: [
          ClipRRect(
            borderRadius: context.lowBorderRadius,
            child: Image.network(
              "".randomImage,
              width: 100,
              height: 90,
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CustomText(
                "Chair Team",
                textStyle: context.textTheme.headline6?.copyWith(
                  color: ColorConstants.instance?.mainColor,
                ),
              ),
              2.h.ph,
              CustomText(
                "240 TL",
                textStyle: context.textTheme.headline6?.copyWith(
                  color: ColorConstants.instance?.mainColor,
                ),
              ),
            ],
          )
        ]),
      ),
    );
  }
}
