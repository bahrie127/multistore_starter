import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import 'package:fluttertoast/fluttertoast.dart';

import '../../../utils/color_resources.dart';
import '../../../utils/custom_themes.dart';
import '../../../utils/dimensions.dart';
import '../../../utils/images.dart';
import '../../base_widgets/button/custom_button.dart';
import '../../cart/cart_page.dart';

class CartBottomSheet extends StatefulWidget {
  final Function? callback;
  const CartBottomSheet({Key? key, this.callback}) : super(key: key);

  @override
  CartBottomSheetState createState() => CartBottomSheetState();
}

class CartBottomSheetState extends State<CartBottomSheet> {
  route(bool isRoute, String message) async {}
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          padding: const EdgeInsets.all(Dimensions.paddingSizeSmall),
          decoration: BoxDecoration(
            color: Theme.of(context).highlightColor,
            borderRadius: const BorderRadius.only(
                topRight: Radius.circular(20), topLeft: Radius.circular(20)),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Align(
                  alignment: Alignment.centerRight,
                  child: InkWell(
                    onTap: () => Navigator.pop(context),
                    child: Container(
                      width: 25,
                      height: 25,
                      decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: Theme.of(context).highlightColor,
                          boxShadow: [
                            BoxShadow(
                              color: Theme.of(context).hintColor,
                              spreadRadius: 1,
                              blurRadius: 5,
                            )
                          ]),
                      child: const Icon(Icons.clear,
                          size: Dimensions.iconSizeSmall),
                    ),
                  )),
              Column(
                children: [
                  Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          width: 100,
                          height: 100,
                          decoration: BoxDecoration(
                              color: ColorResources.getImageBg(context),
                              borderRadius: BorderRadius.circular(5),
                              border: Border.all(
                                  width: .5,
                                  color: Theme.of(context)
                                      .primaryColor
                                      .withOpacity(.20))),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(5),
                            child: FadeInImage.assetNetwork(
                              placeholder: Images.placeholder,
                              image: 'https://picsum.photos/250',
                              imageErrorBuilder: (c, o, s) =>
                                  Image.asset(Images.placeholder),
                            ),
                          ),
                        ),
                        const SizedBox(width: 20),
                        Expanded(
                          child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text('Product Name',
                                    style: titilliumRegular.copyWith(
                                        fontSize: Dimensions.fontSizeLarge),
                                    maxLines: 2,
                                    overflow: TextOverflow.ellipsis),
                                const SizedBox(
                                    height: Dimensions.paddingSizeSmall),
                                Row(
                                  children: [
                                    const Icon(Icons.star,
                                        color: Colors.orange),
                                    Text(double.parse('5').toStringAsFixed(1),
                                        style: titilliumSemiBold.copyWith(
                                            fontSize: Dimensions.fontSizeLarge),
                                        maxLines: 2,
                                        overflow: TextOverflow.ellipsis),
                                  ],
                                ),
                              ]),
                        ),
                      ]),
                  Row(
                    children: [
                      const SizedBox(width: Dimensions.paddingSizeDefault),
                      const SizedBox(width: Dimensions.paddingSizeDefault),
                      Text(
                        'Rp 2000.000',
                        style: titilliumRegular.copyWith(
                            color: ColorResources.getPrimary(context),
                            fontSize: Dimensions.fontSizeExtraLarge),
                      ),
                    ],
                  ),
                ],
              ),
              const SizedBox(height: Dimensions.paddingSizeSmall),
              const SizedBox(
                height: Dimensions.paddingSizeSmall,
              ),
              const Row(children: [
                Text('Quantity', style: robotoBold),
                QuantityButton(
                    isIncrement: false,
                    quantity: 10,
                    stock: 10,
                    minimumOrderQuantity: 1,
                    digitalProduct: true),
                Text('10', style: titilliumSemiBold),
                QuantityButton(
                    isIncrement: true,
                    quantity: 10,
                    stock: 10,
                    minimumOrderQuantity: 1,
                    digitalProduct: true),
              ]),
              const SizedBox(height: Dimensions.paddingSizeSmall),
              Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                const Text('Total Price', style: robotoBold),
                const SizedBox(width: Dimensions.paddingSizeSmall),
                Text(
                  'Rp 4.000.000',
                  style: titilliumBold.copyWith(
                      color: ColorResources.getPrimary(context),
                      fontSize: Dimensions.fontSizeLarge),
                ),
              ]),
              const SizedBox(height: Dimensions.paddingSizeSmall),
              Row(
                children: [
                  Expanded(
                    child: CustomButton(
                        buttonText: 'Add to Cart',
                        onTap: () {
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => const CartPage()));
                        }),
                  ),
                  const SizedBox(width: Dimensions.paddingSizeDefault),
                  Expanded(
                    child: CustomButton(
                        isBuy: true, buttonText: 'Buy Now', onTap: () {}),
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }

  void _navigateToNextScreen(BuildContext context) {}
}

class QuantityButton extends StatelessWidget {
  final bool isIncrement;
  final int? quantity;
  final bool isCartWidget;
  final int? stock;
  final int? minimumOrderQuantity;
  final bool digitalProduct;

  const QuantityButton({
    Key? key,
    required this.isIncrement,
    required this.quantity,
    required this.stock,
    this.isCartWidget = false,
    required this.minimumOrderQuantity,
    required this.digitalProduct,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () {
        if (!isIncrement && quantity! > 1) {
          if (quantity! > minimumOrderQuantity!) {
          } else {
            Fluttertoast.showToast(
                msg: 'minimum qty 1',
                toastLength: Toast.LENGTH_SHORT,
                gravity: ToastGravity.BOTTOM,
                timeInSecForIosWeb: 1,
                backgroundColor: Colors.red,
                textColor: Colors.white,
                fontSize: 16.0);
          }
        } else if (isIncrement && quantity! < stock! || digitalProduct) {}
      },
      icon: Container(
        width: 40,
        height: 40,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            border:
                Border.all(width: 1, color: Theme.of(context).primaryColor)),
        child: Icon(
          isIncrement ? Icons.add : Icons.remove,
          color: isIncrement
              ? quantity! >= stock! && !digitalProduct
                  ? ColorResources.getLowGreen(context)
                  : ColorResources.getPrimary(context)
              : quantity! > 1
                  ? ColorResources.getPrimary(context)
                  : ColorResources.getTextTitle(context),
          size: isCartWidget ? 26 : 20,
        ),
      ),
    );
  }
}
