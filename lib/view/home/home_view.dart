import 'package:flutter/material.dart';
import 'package:kartal/kartal.dart';
import 'package:marketing_app/core/components/bottomBar/bottom_navbar.dart';
import 'package:marketing_app/core/components/scaffold/scaffold.dart';
import 'package:marketing_app/core/extensions/num_extensions.dart';
import 'package:sizer/sizer.dart';

import '../../core/components/textFormField/text_form_field_widget.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        2.h.ph,
        Row(
          children: [
            const TextFormFieldWidget(
              width: 0.75,
              borderRadius: 30,
              borderWidth: 0,
              hintText: "Ürün Ara ...",
              prefixIconPath: "search",
              hintTextFontWeight: FontWeight.w700,
              fontSize: 12,
              prefixWidget: Icon(Icons.search_sharp, size: 25),
              // isThereShadow: true,
            ),
            IconButton(onPressed: () {}, icon: const Icon(Icons.shopping_cart))
          ],
        ),
      ],
    );
  }
}
