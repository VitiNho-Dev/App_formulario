import 'package:flutter/material.dart';

class CustomTextFormField extends StatelessWidget {
  final String label;
  final String hint;
  final String? Function(String?) validator;
  final TextEditingController controller;
  final void Function()? onTap;

  const CustomTextFormField({
    Key? key,
    required this.label,
    required this.hint,
    required this.validator,
    required this.controller,
    this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: validator,
      controller: controller,
      onTap: onTap,
      decoration: InputDecoration(
        labelText: label,
        border: const OutlineInputBorder(),
        hintText: hint,
      ),
    );
  }
}
