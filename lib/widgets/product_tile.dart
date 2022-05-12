import 'package:bazartech/extensions/theme.dart';
import 'package:bazartech/models/product.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class ProductTile extends StatelessWidget {
  final Product product;
  const ProductTile({Key? key, required this.product}) : super(key: key);

  Icon getStatusIcon(int status) {
    switch (status) {
      case 0:
        return const Icon(FontAwesomeIcons.eyeSlash);
      case 1:
        return const Icon(FontAwesomeIcons.eye);
      default:
        return const Icon(FontAwesomeIcons.exclamationTriangle);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      color: context.primaryColor.withOpacity(0.5),
      child: ListTile(
        leading: Image.network(
          'https://ipfs.io/ipfs/${product.imagesDisplay[0].image}',
          width: 100,
          fit: BoxFit.cover,
        ),
        title: Text(product.name),
        subtitle: Text(product.description, overflow: TextOverflow.ellipsis),
        trailing: getStatusIcon(product.status),
      ),
    );
  }
}
