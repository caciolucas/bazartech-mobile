import 'package:bazartech/extensions/screen_size.dart';
import 'package:bazartech/extensions/theme.dart';
import 'package:bazartech/models/product.dart';
import 'package:bazartech/state/product_list.dart';
import 'package:bazartech/state/state.dart';
import 'package:bazartech/widgets/product_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:provider/provider.dart';

class ProductsGridScreen extends StatefulWidget {
  const ProductsGridScreen({
    Key? key,
  }) : super(key: key);

  @override
  State<ProductsGridScreen> createState() => _ProductsGridScreenState();
}

class _ProductsGridScreenState extends State<ProductsGridScreen> {
  @override
  Widget build(BuildContext context) {
    final List<Product> _products =
        Provider.of<ProductList>(context).allProducts(status: 1);
    return Column(children: [
      GestureDetector(
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 8),
          color: context.backgroundColor,
          child: SizedBox(
            height: 1.sha - kToolbarHeight - kBottomNavigationBarHeight,
            child: MasonryGridView.builder(
              gridDelegate:
                  const SliverSimpleGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
              ),
              itemCount: _products.length,
              mainAxisSpacing: 8,
              crossAxisSpacing: 4,
              itemBuilder: (context, index) {
                Product product = _products.elementAt(index);

                return GestureDetector(
                  onTap: () {
                    Navigator.pushNamed(context, "/product-detail",
                        arguments: product);
                  },
                  child: ProductCard(
                    name: product.name,
                    description: product.description,
                    price: product.price,
                    imageURL: product.imagesDisplay[0].image,
                    tags: product.tagsDisplay,
                  ),
                );
              },
            ),
          ),
        ),
      ),
    ]);
  }
}
