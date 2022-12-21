import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kartal/kartal.dart';
import 'package:lottie/lottie.dart';
import 'package:sizer/sizer.dart';

import '../../core/base/bloc/product_bloc.dart';
import '../../core/components/text/custom_text.dart';
import '../../core/constants/app/color_constants.dart';
import '../../core/extensions/num_extensions.dart';
import '../../core/init/navigation/routes.gr.dart';

class SplashView extends StatefulWidget {
  const SplashView({super.key});

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  late ProductBloc _productBloc;

  @override
  void initState() {
    _productBloc = context.read<ProductBloc>();
    _productBloc.add(FetchAllProducts());

    WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
      await Future.delayed(const Duration(seconds: 2));
      context.router.replace(const MainRoute(children: [HomeRoute()]));
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: ColorConstants.instance?.alabaster,
      width: context.width,
      height: context.height,
      child: Column(
        children: [
          20.h.ph,
          Lottie.asset("assets/lottie/splash_lottie.json"),
          10.h.ph,
          CustomText(
            "Easy Shopping",
            textStyle: context.textTheme.headline3?.copyWith(color: ColorConstants.instance?.mainColor, fontWeight: FontWeight.w700),
          ),
          28.h.ph,
          CustomText(
            "Yükleniyor ...",
            textStyle: context.textTheme.headline6?.copyWith(color: ColorConstants.instance?.cadetBlue),
          )
        ],
      ),
    );
  }
}
