import 'package:flutter/material.dart';
import 'package:kartal/kartal.dart';
import 'package:sizer/sizer.dart';

import '../../core/extensions/num_extensions.dart';
import 'widget/category_box.dart';

class DiscoverView extends StatelessWidget {
  const DiscoverView({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        12.h.ph,
        ListView.builder(
          padding: EdgeInsets.zero,
          itemCount: 4,
          shrinkWrap: true,
          itemBuilder: (BuildContext context, int index) {
            return Padding(
              padding: context.paddingLow,
              child: const CategoryBoxWidget(),
            );
          },
        ),
      ],
    );
  }
}
