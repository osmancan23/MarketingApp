import 'package:flutter/material.dart';
import 'package:kartal/kartal.dart';

import '../../../core/components/text/custom_text.dart';

class CategoryBoxWidget extends StatelessWidget {
  const CategoryBoxWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
          width: context.dynamicWidth(0.9),
          height: context.dynamicHeight(0.15),
          decoration: BoxDecoration(color: Colors.red, borderRadius: context.lowBorderRadius),
          child: Stack(
            children: [
              SizedBox(
                width: context.dynamicWidth(0.9),
                child: ClipRRect(
                  borderRadius: context.lowBorderRadius,
                  child: Image.network("".randomImage, fit: BoxFit.fitWidth),
                ),
              ),
              CustomText("KATEGORI")
            ],
          )),
    );
  }
}
