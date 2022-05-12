import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class DefaultInput extends StatelessWidget {
  final String label;
  final TextEditingController? controller;
  final FormFieldValidator<String>? validator;
  final bool obscureText;
  final bool dense;
  final Icon? preffixIcon;
  final IconButton? suffixIcon;
  final bool disabled;
  final List<TextInputFormatter>? inputFormatters;
  final ValueNotifier<bool> _obscureTextVN;
  final TextInputType type;
  DefaultInput({
    Key? key,
    required this.label,
    this.controller,
    this.validator,
    this.obscureText = false,
    this.dense = false,
    this.suffixIcon,
    this.preffixIcon,
    this.inputFormatters,
    this.type = TextInputType.text,
    this.disabled = false,
  })  : _obscureTextVN = ValueNotifier<bool>(obscureText),
        assert(
          obscureText == true ? suffixIcon == null : true,
          'obscureText não pode ser adicionado junto com o suffixicon',
        ),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<bool>(
      valueListenable: _obscureTextVN,
      builder: (_, obscureTextValue, child) {
        return TextFormField(
          keyboardType: type,
          inputFormatters: inputFormatters,
          readOnly: disabled,
          controller: controller,
          validator: validator,
          obscureText: obscureTextValue,
          style: TextStyle(
            fontSize: 16,
            color: disabled ? Colors.white38 : Colors.white,
          ),
          decoration: InputDecoration(
            filled: true,
            isDense: dense,
            labelText: label,
            labelStyle: const TextStyle(
              fontSize: 15,
              color: Colors.white,
              fontFamily: "Inter",
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              gapPadding: 2,
              borderSide: const BorderSide(color: Colors.white54, width: 1),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              gapPadding: 5,
              borderSide: const BorderSide(color: Colors.white, width: 1.1),
            ),
            errorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              gapPadding: 5,
              borderSide: const BorderSide(color: Colors.red, width: 1),
            ),
            focusedErrorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              gapPadding: 5,
              borderSide: const BorderSide(color: Colors.red, width: 1),
            ),
            prefixIcon: preffixIcon,
            suffixIcon: obscureText
                ? IconButton(
                    onPressed: () {
                      _obscureTextVN.value = !obscureTextValue;
                    },
                    icon: Icon(
                      obscureTextValue
                          ? FontAwesomeIcons.lock
                          : FontAwesomeIcons.lockOpen,
                      size: 16,
                    ),
                    color: Colors.white,
                  )
                : suffixIcon,
          ),
        );
      },
    );
  }
}
