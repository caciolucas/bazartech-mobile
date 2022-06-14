import 'package:bazartech/models/product.dart';
import 'package:bazartech/extensions/theme.dart';
import 'package:bazartech/models/user.dart';
import 'package:bazartech/state/logged_user.dart';
import 'package:bazartech/state/product_list.dart';
import 'package:bazartech/state/state.dart';
import 'package:bazartech/widgets/product_tile.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MyPostsListScreen extends StatefulWidget {
  const MyPostsListScreen({
    Key? key,
  }) : super(key: key);

  @override
  State<MyPostsListScreen> createState() => _MyPostsListScreenState();
}

class _MyPostsListScreenState extends State<MyPostsListScreen> {
  @override
  Widget build(BuildContext context) {
    final User user = Provider.of<LoggedUser>(context).user;
    final List<Product> _products =
        Provider.of<ProductList>(context).userProducts(user.id);
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
