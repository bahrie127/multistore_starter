import 'package:flutter/material.dart';

import '../../../utils/color_resources.dart';
import '../../../utils/custom_themes.dart';
import '../../../utils/dimensions.dart';

class ProductTitleView extends StatelessWidget {
  // final pd.ProductDetailsModel? productModel;
  final String? averageRatting;
  const ProductTitleView({Key? key, this.averageRatting}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double? startingPrice = 0;
    double? endingPrice;

    return Container(
        padding: const EdgeInsets.all(Dimensions.paddingSizeSmall),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(children: [
              Expanded(
                  child: Text('Product Name',
                      style: titleRegular.copyWith(
                          fontSize: Dimensions.fontSizeLarge),
                      maxLines: 2)),
              const SizedBox(width: Dimensions.paddingSizeExtraSmall),
              Column(
                children: [
                  Text(
                    'Rp 4.000.000',
                    style: titilliumBold.copyWith(
                        color: ColorResources.getPrimary(context),
                        fontSize: Dimensions.fontSizeLarge),
                  ),
                ],
              ),
            ]),
            const SizedBox(height: Dimensions.paddingSizeSmall),
          ],
        ));
  }
}
