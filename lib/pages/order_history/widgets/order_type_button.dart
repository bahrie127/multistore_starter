import 'package:flutter/material.dart';

import '../../../utils/color_resources.dart';
import '../../../utils/custom_themes.dart';

class OrderTypeButton extends StatelessWidget {
  final String? text;
  final int index;
  // final List<OrderModel>? orderList;

  const OrderTypeButton({
    Key? key,
    required this.text,
    required this.index,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: TextButton(
        onPressed: () {},
        style: TextButton.styleFrom(padding: const EdgeInsets.all(0)),
        child: Container(
          height: 40,
          alignment: Alignment.center,
          decoration: BoxDecoration(
            color: 1 == index
                ? ColorResources.getPrimary(context)
                : Theme.of(context).highlightColor,
            borderRadius: BorderRadius.circular(6),
          ),
          child: Text(text!,
              style: titilliumBold.copyWith(
                  color: 1 == index
                      ? Theme.of(context).highlightColor
                      : ColorResources.getPrimary(context))),
        ),
      ),
    );
  }
}
