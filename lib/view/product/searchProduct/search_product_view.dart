import 'package:flutter/material.dart';
import 'package:marketing_app/core/components/scaffold/scaffold.dart';
import 'package:marketing_app/core/components/text/custom_text.dart';

class SearchProductView extends StatelessWidget {
  final String searchKey;
  const SearchProductView({super.key, required this.searchKey});

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      appbarTitle: "Search Product",
      body: Center(child: CustomText(searchKey)),
    );
  }
}
