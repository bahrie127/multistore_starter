import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:multistore_app/pages/checkout/checkout_page.dart';

import '../../utils/custom_themes.dart';
import '../../utils/dimensions.dart';
import '../base_widgets/custom_app_bar.dart';
import 'widgets/cart_widget.dart';

class CartPage extends StatefulWidget {
  final bool fromCheckout;
  final int sellerId;
  const CartPage({Key? key, this.fromCheckout = false, this.sellerId = 1})
      : super(key: key);

  @override
  CartPageState createState() => CartPageState();
}

class CartPageState extends State<CartPage> {
  List<bool> chooseShipping = [];

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Container(
          height: 80,
          padding: const EdgeInsets.symmetric(
            horizontal: Dimensions.paddingSizeLarge,
            vertical: Dimensions.paddingSizeDefault,
          ),
          decoration: BoxDecoration(
            color: Theme.of(context).cardColor,
            borderRadius: const BorderRadius.only(
                topRight: Radius.circular(10), topLeft: Radius.circular(10)),
          ),
          child:
              Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
            Expanded(
                child: Center(
                    child: Row(
              children: [
                Text(
                  'Total Price',
                  style: titilliumSemiBold.copyWith(
                      fontSize: Dimensions.fontSizeDefault),
                ),
                Text(
                  'Rp 2.000.000',
                  style: titilliumSemiBold.copyWith(
                      color: Theme.of(context).primaryColor,
                      fontSize: Dimensions.fontSizeLarge),
                ),
              ],
            ))),
            Builder(
              builder: (context) => InkWell(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context){
                    return const CheckoutPage();
                  }));
                },
                child: Container(
                  width: MediaQuery.of(context).size.width / 3.5,
                  decoration: BoxDecoration(
                    color: Theme.of(context).primaryColor,
                    borderRadius:
                        BorderRadius.circular(Dimensions.paddingSizeSmall),
                  ),
                  child: Center(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: Dimensions.paddingSizeSmall,
                          vertical: Dimensions.fontSizeSmall),
                      child: Text('Checkout',
                          style: titilliumSemiBold.copyWith(
                            fontSize: Dimensions.fontSizeDefault,
                            color: Theme.of(context).cardColor,
                          )),
                    ),
                  ),
                ),
              ),
            ),
          ])),
      body: Column(children: [
        const CustomAppBar(title: 'Cart'),
        Expanded(
          child: Column(
            children: [
              Expanded(
                child: RefreshIndicator(
                  onRefresh: () async {},
                  child: ListView.builder(
                    itemCount: 1,
                    padding: const EdgeInsets.all(0),
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.only(
                            bottom: Dimensions.paddingSizeSmall),
                        child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text('List',
                                      textAlign: TextAlign.end,
                                      style: titilliumSemiBold.copyWith(
                                          fontSize: Dimensions.fontSizeLarge))),
                              Card(
                                child: Container(
                                  padding: const EdgeInsets.only(
                                      bottom: Dimensions.paddingSizeLarge),
                                  decoration: BoxDecoration(
                                      color: Theme.of(context).highlightColor),
                                  child: Column(
                                    children: [
                                      ListView.builder(
                                        physics:
                                            const NeverScrollableScrollPhysics(),
                                        shrinkWrap: true,
                                        padding: const EdgeInsets.all(0),
                                        itemCount: 2,
                                        itemBuilder: (context, i) {
                                          return CartWidget(
                                            index: i,
                                            fromCheckout: widget.fromCheckout,
                                          );
                                        },
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ]),
                      );
                    },
                  ),
                ),
              ),
            ],
          ),
        )
      ]),
    );
  }
}
