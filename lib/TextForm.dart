import 'package:flutter/material.dart';

TextFormField textForm(String label, TextEditingController controller) {
  return TextFormField(
    controller: controller,
    onChanged: (val) {},
    validator: (val) => val.isEmpty ? "Enter Valid Data " : null,
    decoration: InputDecoration(
      labelText: label,
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(5.0),
      ),
    ),
  );
}
