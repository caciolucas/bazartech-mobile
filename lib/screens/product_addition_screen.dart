import 'dart:io';

import 'package:bazartech/extensions/theme.dart';
import 'package:bazartech/widgets/button.dart';
import 'package:bazartech/widgets/input.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';

class ProductAdditionScreen extends StatefulWidget {
  const ProductAdditionScreen({Key? key}) : super(key: key);

  @override
  State<ProductAdditionScreen> createState() => _ProductAdditionScreenState();
}

class _ProductAdditionScreenState extends State<ProductAdditionScreen> {
  final nameEC = TextEditingController();
  final precoEC = TextEditingController();
  final descricaoEC = TextEditingController();
  final List<String> _tagsOptions = <String>[
    'xbox',
    'playstation',
    'hardware',
  ];

  File? image;

  Future pickImage() async {
    try {
      final image = await ImagePicker().pickImage(source: ImageSource.gallery);

      if (image == null) return;

      final imageTemp = File(image.path);

      setState(() => this.image = imageTemp);
    } on PlatformException catch (e) {
      print('Failed to pick image: $e');
    }
  }

  Future pickImageC() async {
    try {
      final image = await ImagePicker().pickImage(source: ImageSource.camera);

      if (image == null) return;

      final imageTemp = File(image.path);

      setState(() => this.image = imageTemp);
    } on PlatformException catch (e) {
      print('Failed to pick image: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Adicionar Produto'),
        ),
        body: Container(
          padding: const EdgeInsets.all(30),
          child: Column(
            children: <Widget>[
              DefaultButton(
                label: 'Tirar foto',
                width: double.infinity,
                onPressed: () => {pickImageC()},
                // onPressed: () => {authenticate()},
              ),
              const SizedBox(height: 20),
              DefaultInput(
                label: "Nome",
                controller: nameEC,
              ),
              const SizedBox(height: 20),
              DefaultInput(
                label: "Descrição",
                controller: descricaoEC,
              ),
              const SizedBox(height: 20),
              Autocomplete<String>(
                optionsBuilder: (TextEditingValue textEditingValue) {
                  if (textEditingValue.text == '') {
                    return const Iterable<String>.empty();
                  }
                  return _tagsOptions.where((String option) {
                    return option.contains(textEditingValue.text.toLowerCase());
                  });
                },
                fieldViewBuilder: (BuildContext context,
                    TextEditingController textEditingController,
                    FocusNode focusNode,
                    VoidCallback onFieldSubmitted) {
                  return TextFormField(
                    controller: textEditingController,
                    decoration: InputDecoration(
                      filled: true,
                      labelText: 'Tags',
                      border: const OutlineInputBorder(),
                      labelStyle: const TextStyle(
                        fontSize: 15,
                        color: Colors.white,
                        fontFamily: "Inter",
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                        gapPadding: 2,
                        borderSide:
                            const BorderSide(color: Colors.white54, width: 1),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                        gapPadding: 5,
                        borderSide:
                            const BorderSide(color: Colors.white, width: 1.1),
                      ),
                      errorBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                        gapPadding: 5,
                        borderSide:
                            const BorderSide(color: Colors.red, width: 1),
                      ),
                      focusedErrorBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                        gapPadding: 5,
                        borderSide:
                            const BorderSide(color: Colors.red, width: 1),
                      ),
                    ),
                    focusNode: focusNode,
                    onFieldSubmitted: (String value) {
                      onFieldSubmitted();
                      print('You just typed a new entry  $value');
                    },
                  );
                },
                onSelected: (String selection) {
                  debugPrint('You just selected $selection');
                },
              ),
              const SizedBox(height: 20),
              DefaultInput(
                label: "Preço",
                controller: precoEC,
              ),
              const Spacer(),
              DefaultButton(
                color: context.secondaryColor,
                labelColor: context.onErrorColor,
                label: 'Salvar',
                width: double.infinity,
                onPressed: () => {},
              ),
            ],
          ),
        ));
  }
}
