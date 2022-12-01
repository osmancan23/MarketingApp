import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

import '../text/custom_text.dart';

class CustomAppbar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppbar({super.key, this.title, this.actions});
  final String? title;
  final List<Widget>? actions;
  @override
  Widget build(BuildContext context) {
    return AppBar(
      leading: IconButton(
        onPressed: () => context.router.pop(),
        icon: const Icon(
          Icons.arrow_back_ios_new_outlined,
          size: 20,
        ),
      ),
      actions: actions,
      title: CustomText(title),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(70);
}
