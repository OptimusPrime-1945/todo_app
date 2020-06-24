import 'package:flutter/material.dart';

TextFormField textForm({@required String label,@required TextEditingController controller}) {
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
