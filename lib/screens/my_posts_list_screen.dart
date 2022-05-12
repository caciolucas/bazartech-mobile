import 'package:bazartech/models/product.dart';
import 'package:bazartech/extensions/theme.dart';
import 'package:bazartech/state/state.dart';
import 'package:bazartech/widgets/product_tile.dart';
import 'package:flutter/material.dart';

class MyPostsListScreen extends StatefulWidget {
  const MyPostsListScreen({
    Key? key,
  }) : super(key: key);

  @override
  State<MyPostsListScreen> createState() => _MyPostsListScreenState();
}

class _MyPostsListScreenState extends State<MyPostsListScreen> {
  final List<Product> _products = MockState()
      .products
      .where((product) => product.owner == MockState().user.id)
      .toList();
  @override
  Widget build(BuildContext context) {
    return Container(
      color: context.backgroundColor,
      padding: const EdgeInsets.symmetric(horizontal: 25),
      child: ListView.builder(
        itemCount: _products.length,
        itemBuilder: (context, index) {
          Product product = _products[index];
          return ProductTile(product: product);
        },
      ),
    );
  }
}
