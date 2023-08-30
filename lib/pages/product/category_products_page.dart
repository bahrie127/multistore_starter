import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:multistore_app/pages/home/widgets/product_item.dart';

import '../../utils/color_resources.dart';
import '../../utils/dimensions.dart';
import '../base_widgets/custom_app_bar.dart';

class CategoryProductsPage extends StatelessWidget {
  const CategoryProductsPage({
    Key? key,
    required this.isBrand,
    required this.id,
    this.name,
    this.image,
  }) : super(key: key);

  final bool isBrand;
  final String id;
  final String? name;
  final String? image;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorResources.getIconBg(context),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          CustomAppBar(title: name),

          const SizedBox(height: Dimensions.paddingSizeSmall),

          // Products
          Expanded(
            child: MasonryGridView.count(
              padding: const EdgeInsets.symmetric(
                  horizontal: Dimensions.paddingSizeSmall),
              physics: const BouncingScrollPhysics(),
              crossAxisCount: 2,
              itemCount: 4,
              shrinkWrap: true,
              itemBuilder: (BuildContext context, int index) {
                return const ProductItemWidget();
              },
            ),
          )
        ],
      ),
    );
  }
}
