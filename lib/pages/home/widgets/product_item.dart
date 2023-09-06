import 'package:flutter/material.dart';
import 'package:multistore_app/pages/product/product_detail.dart';

import '../../../utils/color_resources.dart';
import '../../../utils/custom_themes.dart';
import '../../../utils/dimensions.dart';
import '../../../utils/images.dart';
import '../../base_widgets/rating_bar.dart';

class ProductItemWidget extends StatelessWidget {
  const ProductItemWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(context, MaterialPageRoute(builder: (context) {
          return const ProductDetail();
        }));
      },
      child: Container(
        height: Dimensions.cardHeight,
        margin: const EdgeInsets.all(5),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Theme.of(context).highlightColor,
          boxShadow: [
            BoxShadow(
                color: Colors.grey.withOpacity(0.2),
                spreadRadius: 1,
                blurRadius: 5)
          ],
        ),
        child: Stack(children: [
          Column(crossAxisAlignment: CrossAxisAlignment.stretch, children: [
            // Product Image
            Container(
              height: 150,
              decoration: BoxDecoration(
                color: ColorResources.getIconBg(context),
                borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(10),
                    topRight: Radius.circular(10)),
              ),
              child: ClipRRect(
                borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(10),
                    topRight: Radius.circular(10)),
                child: FadeInImage.assetNetwork(
                  placeholder: Images.placeholder,
                  fit: BoxFit.cover,
                  height: MediaQuery.of(context).size.width / 2.45,
                  image: 'https://picsum.photos/250',
                  imageErrorBuilder: (c, o, s) => Image.asset(
                      Images.placeholder,
                      fit: BoxFit.cover,
                      height: MediaQuery.of(context).size.width / 2.45),
                ),
              ),
            ),

            // Product Details
            Padding(
              padding: const EdgeInsets.only(
                  top: Dimensions.paddingSizeSmall,
                  bottom: 5,
                  left: 5,
                  right: 5),
              child: Center(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('Jam Tangan Mewah',
                        textAlign: TextAlign.center,
                        style: robotoRegular.copyWith(
                            fontSize: Dimensions.fontSizeSmall,
                            fontWeight: FontWeight.w400),
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis),
                    const SizedBox(height: Dimensions.paddingSizeExtraSmall),
                    Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                      RatingBar(
                        rating: double.parse('10.0'),
                        size: 18,
                      ),
                      Text('(20)',
                          style: robotoRegular.copyWith(
                            fontSize: Dimensions.fontSizeSmall,
                          )),
                    ]),
                    const SizedBox(height: Dimensions.paddingSizeExtraSmall),
                    const SizedBox.shrink(),
                    const SizedBox(
                      height: 2,
                    ),
                    Text(
                      'Rp 2.000.000',
                      style: titilliumSemiBold.copyWith(
                          color: ColorResources.getPrimary(context)),
                    ),
                  ],
                ),
              ),
            ),
          ]),

          // Off

          const SizedBox.shrink(),
        ]),
      ),
    );
  }
}
