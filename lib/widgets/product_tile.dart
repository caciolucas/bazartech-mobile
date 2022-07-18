import 'package:bazartech/extensions/theme.dart';
import 'package:bazartech/services/products_service.dart';
import 'package:bazartech/state/product_list.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';

class ProductTile extends StatelessWidget {
  final int id;
  const ProductTile({Key? key, required this.id}) : super(key: key);

  Icon getStatusIcon(int status) {
    switch (status) {
      case 0:
        return const Icon(FontAwesomeIcons.eyeSlash);
      case 1:
        return const Icon(FontAwesomeIcons.eye);
      case 2:
        return const Icon(FontAwesomeIcons.dollarSign);
      default:
        return const Icon(FontAwesomeIcons.exclamationTriangle);
    }
  }

  int getNextStatus(int status) {
    switch (status) {
      case 0:
        return 1;
      case 1:
        return 2;
      case 2:
        return 0;
      default:
        return 0;
    }
  }

  @override
  Widget build(BuildContext context) {
    final product = Provider.of<ProductList>(context).getById(id);
    return Card(
      color: context.primaryColor.withOpacity(0.5),
      child: ListTile(
        leading: Image.network(
          product.imagesDisplay.isNotEmpty
              ? product.imagesDisplay.first.image
              : "https://thumbs.dreamstime.com/b/no-image-available-icon-flat-vector-no-image-available-icon-flat-vector-illustration-132482953.jpg",
          width: 100,
          fit: BoxFit.cover,
        ),
        title: Text(product.name),
        subtitle: Text(product.description, overflow: TextOverflow.ellipsis),
        trailing: GestureDetector(
            onTap: () {
              product.status = getNextStatus(product.status);
              ProductService().partialUpdateProduct(product.id, {
                'status': product.status,
              });
              Provider.of<ProductList>(context, listen: false)
                  .updateProduct(product);
            },
            child: getStatusIcon(product.status)),
      ),
    );
  }
}
