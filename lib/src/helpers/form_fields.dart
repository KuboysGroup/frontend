import 'package:flutter/material.dart';

class QuantidadeTextFormField extends StatelessWidget {
  const QuantidadeTextFormField(
      {super.key,
      required this.quantController,
      required this.title,
      required this.icon,
      required this.validate});

  final TextEditingController quantController;

  final String title;

  final IconData icon;

  final bool validate;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: quantController,
      decoration: InputDecoration(
        prefixIcon: Icon(icon),
        hintText: title,
        border: const OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(20.0))),
      ),
      keyboardType: TextInputType.number,
      validator: (String? value) {
        if (validate && (value == null || value.isEmpty)) {
          return 'Digite uma quantidade.';
        }
        return null;
      },
    );
  }
}

class FieldTextFormField extends StatelessWidget {
  const FieldTextFormField({
    super.key,
    required this.textController,
    required this.title,
    required this.icon,
  });

  final TextEditingController textController;

  final String title;

  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: textController,
      decoration: InputDecoration(
        prefixIcon: Icon(icon),
        hintText: title,
        border: const OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(20.0))),
      ),
      keyboardType: TextInputType.text,
      validator: (String? value) {
        return null;
      },
    );
  }
}
