import 'package:flutter/material.dart';
import 'package:kartal/kartal.dart';
import 'package:sizer/sizer.dart';

import '../../core/components/appbar/appbar.dart';
import '../../core/components/button/button.dart';
import '../../core/extensions/num_extensions.dart';
import 'widget/basket_list_tile.dart';

class BasketView extends StatelessWidget {
  const BasketView({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const CustomAppbar(title: "Basket"),
        2.h.ph,
        SizedBox(
          height: context.dynamicHeight(0.65),
          child: ListView.builder(
            padding: EdgeInsets.zero,
            itemCount: 5,
            itemBuilder: (BuildContext context, int index) {
              return Padding(
                padding: context.paddingLow,
                child: const BasketListTileWidget(),
              );
            },
          ),
        ),
        ButtonWidget(
          onTap: () {},
          buttonColor: Colors.teal,
          text: "Devam Et",
        )
      ],
    );
  }
}
