import 'package:flutter/material.dart';

import '../../utils/color_resources.dart';
import '../../utils/dimensions.dart';
import '../base_widgets/custom_app_bar.dart';
import 'widgets/order_type_button.dart';

class OrderHistoryPage extends StatefulWidget {
  final bool isBacButtonExist;
  const OrderHistoryPage({Key? key, this.isBacButtonExist = true})
      : super(key: key);

  @override
  State<OrderHistoryPage> createState() => _OrderHistoryPageState();
}

class _OrderHistoryPageState extends State<OrderHistoryPage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: ColorResources.getIconBg(context),
        body: Column(
          children: [
            CustomAppBar(
                title: 'Order History',
                isBackButtonExist: widget.isBacButtonExist),
            Padding(
              padding: const EdgeInsets.all(Dimensions.paddingSizeLarge),
              child: Row(
                children: [
                  OrderTypeButton(
                    text: 'Running',
                    index: 0,
                  ),
                  const SizedBox(width: Dimensions.paddingSizeSmall),
                  OrderTypeButton(
                    text: 'Delivery',
                    index: 1,
                  ),
                  const SizedBox(width: Dimensions.paddingSizeSmall),
                  OrderTypeButton(
                    text: 'Canceled',
                    index: 2,
                  ),
                ],
              ),
            ),
          ],
        ));
  }
}
