import 'package:bazartech/extensions/theme.dart';
import 'package:flutter/material.dart';

class DefaultButton extends StatelessWidget {
  final String label;
  final double heigth;
  final double? width;
  final double padding;
  final Color? color;
  final Color? labelColor;
  final VoidCallback? onPressed;
  final bool outlined;

  const DefaultButton({
    Key? key,
    required this.label,
    this.heigth = 66,
    this.width,
    this.padding = 10,
    this.color,
    this.labelColor,
    this.onPressed,
    this.outlined = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(padding),
      width: width,
      height: heigth,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(25),
            side: outlined
                ? BorderSide(color: color ?? context.primaryColor)
                : BorderSide.none,
          ),
          primary:
              outlined ? Colors.transparent : color ?? context.primaryColor,
          elevation: outlined ? 0 : 2,
        ),
        child: Text(
          label.toUpperCase(),
          style: TextStyle(
            fontSize: 18,
            fontFamily: "Inter",
            fontWeight: FontWeight.bold,
            color: labelColor ??
                (outlined ? context.primaryColor : context.onPrimaryColor),
          ),
        ),
      ),
    );
  }
}
