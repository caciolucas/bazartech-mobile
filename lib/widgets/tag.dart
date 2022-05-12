import 'package:bazartech/extensions/theme.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class Tag extends StatelessWidget {
  final String _name;
  const Tag(name, {Key? key})
      : _name = name,
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(25),
        color: context.secondaryColor,
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 2, horizontal: 8),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Icon(FontAwesomeIcons.tag, size: 8),
            const SizedBox(width: 2),
            Text(_name),
          ],
        ),
      ),
    );
  }
}
