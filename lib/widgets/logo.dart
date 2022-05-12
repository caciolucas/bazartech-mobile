import 'package:flutter/material.dart';

class Logo extends StatelessWidget {
  final double? size;
  final VoidCallback? onPressed;

  const Logo({
    Key? key,
    this.size,
    this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Text(
        'bazartech',
        style: TextStyle(fontFamily: "Righteous", fontSize: size),
      ),
    );
  }
}
