import 'package:flutter/material.dart';
import 'package:multistore_app/pages/home/widgets/product_item.dart';

import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

class ProductsWidget extends StatelessWidget {
  const ProductsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return MasonryGridView.count(
      crossAxisCount: 2,
      itemBuilder: (context, index) {
        return const ProductItemWidget();
      },
      itemCount: 20,
    );
  }
}
