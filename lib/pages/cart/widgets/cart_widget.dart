import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import '../../../utils/color_resources.dart';
import '../../../utils/custom_themes.dart';
import '../../../utils/dimensions.dart';
import '../../../utils/images.dart';
import '../../product/product_detail.dart';

class CartWidget extends StatelessWidget {
  final int index;
  final bool fromCheckout;
  const CartWidget({Key? key, required this.index, required this.fromCheckout})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(
            context,
            PageRouteBuilder(
              transitionDuration: const Duration(milliseconds: 1000),
              pageBuilder: (context, anim1, anim2) => const ProductDetail(),
            ));
      },
      child: Container(
        margin: const EdgeInsets.only(top: Dimensions.paddingSizeSmall),
        padding: const EdgeInsets.all(Dimensions.paddingSizeSmall),
        decoration: BoxDecoration(
          color: Theme.of(context).highlightColor,
        ),
        child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                decoration: BoxDecoration(
                    borderRadius:
                        BorderRadius.circular(Dimensions.paddingSizeExtraSmall),
                    border: Border.all(
                        color: Theme.of(context).primaryColor.withOpacity(.20),
                        width: 1)),
                child: ClipRRect(
                  borderRadius:
                      BorderRadius.circular(Dimensions.paddingSizeExtraSmall),
                  child: FadeInImage.assetNetwork(
                    placeholder: Images.placeholder,
                    height: 60,
                    width: 60,
                    image: 'https://picsum.photos/250',
                    imageErrorBuilder: (c, o, s) => Image.asset(
                      Images.placeholder,
                      fit: BoxFit.cover,
                      height: 60,
                      width: 60,
                    ),
                  ),
                ),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: Dimensions.paddingSizeExtraSmall),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Row(
                        children: [
                          Expanded(
                            child: Text('Product Name $index',
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                                style: titilliumBold.copyWith(
                                  fontSize: Dimensions.fontSizeDefault,
                                  color: ColorResources.getReviewRattingColor(
                                      context),
                                )),
                          ),
                          const SizedBox(
                            width: Dimensions.paddingSizeSmall,
                          ),
                          !fromCheckout
                              ? InkWell(
                                  onTap: () {},
                                  child: SizedBox(
                                      width: 20,
                                      height: 20,
                                      child: Image.asset(
                                        Images.delete,
                                        scale: .5,
                                      )),
                                )
                              : const SizedBox.shrink(),
                        ],
                      ),
                      const SizedBox(
                        height: Dimensions.paddingSizeSmall,
                      ),
                      Row(
                        children: [
                          Text(
                            'Rp 1.400.000',
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: titilliumRegular.copyWith(
                                color: ColorResources.getPrimary(context),
                                fontSize: Dimensions.fontSizeExtraLarge),
                          ),
                        ],
                      ),
                      const SizedBox(width: Dimensions.paddingSizeSmall),
                    ],
                  ),
                ),
              ),
            ]),
      ),
    );
  }
}
