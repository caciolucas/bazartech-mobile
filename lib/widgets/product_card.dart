import 'package:bazartech/extensions/theme.dart';
import 'package:bazartech/widgets/tag.dart';
import 'package:flutter/material.dart';

class ProductCard extends StatelessWidget {
  final String _name;
  final String _description;
  final double _price;
  final String _imageURL;
  final List<String> _tags;

  const ProductCard({
    Key? key,
    required String name,
    required String description,
    required double price,
    required String imageURL,
    required List<String> tags,
  })  : _name = name,
        _tags = tags,
        _price = price,
        _description = description,
        _imageURL = imageURL,
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      color: context.primaryColor.withOpacity(0.5),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(5),
      ),
      child: Column(
        children: [
          ClipRRect(
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(5),
              topRight: Radius.circular(5),
            ),
            child: Image.network(
              'https://ipfs.io/ipfs/$_imageURL',
              fit: BoxFit.fitWidth,
            ),
          ),
          Container(
            padding: const EdgeInsets.all(10),
            width: double.infinity,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  _name.toUpperCase(),
                  overflow: TextOverflow.clip,
                  style: TextStyle(
                    fontFamily: "Inter",
                    fontSize: 14,
                    color: context.onBackgroundColor,
                  ),
                ),
                Text(
                  "R\$ ${_price.toStringAsFixed(2)}",
                  style: TextStyle(
                    fontFamily: "Inter",
                    fontSize: 10,
                    color: context.onBackgroundColor,
                  ),
                ),
                const SizedBox(height: 10),
                Text(
                  _description,
                  style: const TextStyle(
                    fontSize: 10,
                    fontFamily: "Inter",
                  ),
                  textAlign: TextAlign.justify,
                  overflow: TextOverflow.ellipsis,
                  maxLines: 5,
                ),
                const SizedBox(height: 10),
                Wrap(
                  runSpacing: 2,
                  spacing: 2,
                  children: _tags.length > 5
                      ? [
                          ..._tags.getRange(0, 5).map((e) => Tag(e)).toList(),
                          const Tag("...")
                        ]
                      : _tags.map((e) => Tag(e)).toList(),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
