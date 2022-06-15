import 'package:bazartech/extensions/screen_size.dart';
import 'package:bazartech/extensions/theme.dart';
import 'package:bazartech/models/product.dart';
import 'package:bazartech/state/logged_user.dart';
import 'package:bazartech/widgets/button.dart';
import 'package:bazartech/widgets/tag.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher_string.dart';

class ProductDetailScreen extends StatefulWidget {
  const ProductDetailScreen({Key? key}) : super(key: key);

  @override
  _ProductDetailScreenState createState() => _ProductDetailScreenState();
}

class _ProductDetailScreenState extends State<ProductDetailScreen> {
  @override
  Widget build(BuildContext context) {
    Product product = ModalRoute.of(context)?.settings.arguments as Product;
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: context.backgroundColor,
        title: Text(product.name),
      ),
      body: Container(
        color: context.backgroundColor,
        height: 1.sha,
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CarouselSlider(
              options: CarouselOptions(
                enableInfiniteScroll: false,
                height: 300,
              ),
              items: product.imagesDisplay.map((i) {
                return Builder(
                  builder: (BuildContext context) {
                    return Column(
                      children: [
                        Container(
                          width: MediaQuery.of(context).size.width,
                          margin: const EdgeInsets.symmetric(horizontal: 5.0),
                          child: Image.network(
                            i.image,
                            height: 200,
                          ),
                        ),
                        const SizedBox(height: 5),
                        Text(
                          i.description,
                          maxLines: 5,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ],
                    );
                  },
                );
              }).toList(),
            ),
            const SizedBox(height: 5),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  product.name.toUpperCase(),
                  style: TextStyle(
                    fontFamily: "Inter",
                    fontSize: 20,
                    color: context.onBackgroundColor,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  'R\$ ${product.price.toStringAsFixed(2)}',
                  style: TextStyle(
                    fontFamily: "Inter",
                    fontSize: 20,
                    color: context.onBackgroundColor,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 5),
            Text(
              product.description,
              style: const TextStyle(
                fontSize: 10,
                fontFamily: "Inter",
              ),
              textAlign: TextAlign.justify,
              overflow: TextOverflow.ellipsis,
              maxLines: 5,
            ),
            const SizedBox(height: 20),
            Wrap(
              runSpacing: 2,
              spacing: 2,
              children: product.tags.map((e) => Tag(e)).toList(),
            ),
            const SizedBox(height: 50),
            product.owner == Provider.of<LoggedUser>(context).user!.id
                ? DefaultButton(
                    label: "Editar",
                    width: double.infinity,
                    onPressed: () => {})
                : const SizedBox.shrink(),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          String cleanedPhone =
              product.ownerDisplay.phoneNumber.replaceAll(RegExp(r"\D"), "");
          launchUrlString('https://wa.me/55$cleanedPhone');
        },
        child: const Icon(Icons.whatsapp),
      ),
    );
  }
}
