import 'package:flutter/material.dart';

class CustomInputField extends StatelessWidget {
  final String labelText;
  final String hintText;
  final TextInputType keyboardType;
  final String formProperty;
  final Map<String, dynamic> formValues;
  final Color backgroundColor;

  const CustomInputField({
    Key? key,
    required this.labelText,
    required this.hintText,
    this.keyboardType = TextInputType.text,
    required this.formProperty,
    required this.formValues,
    this.backgroundColor = Colors.white,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10),
      padding: const EdgeInsets.symmetric(horizontal: 10),
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: Colors.grey),
      ),
      child: TextFormField(
        decoration: InputDecoration(
          labelText: labelText,
          hintText: hintText,
          border: InputBorder.none,
          filled: true,
          fillColor: Colors.transparent,
        ),
        keyboardType: keyboardType,
        onSaved: (newValue) {
          formValues[formProperty] = newValue ?? '';
        },
        validator: (value) {
          if (value == null || value.isEmpty) {
            return 'Este campo es requerido';
          }
          return null;
        },
      ),
    );
  }
}
