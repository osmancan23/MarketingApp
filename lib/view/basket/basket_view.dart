import 'package:flutter/cupertino.dart';

import 'package:marketing_app/core/components/text/custom_text.dart';

class BasketView extends StatelessWidget {
  const BasketView({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(child: CustomText(toString()));
  }
}
