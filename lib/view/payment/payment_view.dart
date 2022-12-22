import 'package:auto_route/auto_route.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_credit_card/credit_card_widget.dart';

import '../../core/components/button/button.dart';
import '../../core/components/scaffold/scaffold.dart';
import '../../core/components/textFormField/text_form_field_widget.dart';
import '../../core/constants/app/color_constants.dart';
import '../../core/init/navigation/routes.gr.dart';

class PaymentView extends StatefulWidget {
  const PaymentView({Key? key}) : super(key: key);

  @override
  State<PaymentView> createState() => _PaymentViewState();
}

class _PaymentViewState extends State<PaymentView> {
  String _cardNumber = "";
  String _holderName = "";
  String _expiryDate = "";
  String _cvv = "";

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
        appbarTitle: "Payment",
        body: Column(
          children: [
            CreditCardWidget(
              cardNumber: _cardNumber,
              expiryDate: _expiryDate,
              cardHolderName: _holderName,
              cvvCode: _cvv,

              showBackView: false,
              onCreditCardWidgetChange: (va) {}, //true when you want to show cvv(back) view
            ),
            TextFormFieldWidget(
              onChanged: (value) {
                setState(() {
                  _cardNumber = value;
                });
              },
              title: "Card Number",
            ),
            TextFormFieldWidget(
              onChanged: (value) {
                setState(() {
                  _holderName = value;
                });
              },
              title: "Holder Name",
            ),
            TextFormFieldWidget(
              onChanged: (value) {
                setState(() {
                  _expiryDate = value;
                });
              },
              title: "Expiry Date",
            ),
            TextFormFieldWidget(
              onChanged: (value) {
                setState(() {
                  _cvv = value;
                });
              },
              title: "CVV",
            ),
            ButtonWidget(
              onTap: () => context.router.push(const PaymentResultRoute()),
              text: "Devam",
              buttonColor: ColorConstants.instance?.mainColor,
            )
          ],
        ));
  }
}
