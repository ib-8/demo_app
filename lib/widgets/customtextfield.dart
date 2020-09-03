import 'package:flutter/material.dart';
import 'package:flutter_web/constants.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({
    this.textController,
    this.hint,
    this.obscure = false,
    this.onChanged,
    this.focus = false,
    this.keyType,
    this.maxlines = 1,
    this.length,
    this.prefix,
  });

  final String hint;
  final bool obscure;
  final Function onChanged;
  final TextEditingController textController;
  final bool focus;
  final int maxlines;
  final TextInputType keyType;
  final String prefix;
  final int length;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 8),
      child: TextField(
        autofocus: focus,
        maxLength: length,
        maxLengthEnforced: false,
        maxLines: maxlines,
        controller: textController,
        keyboardType: keyType,
        style: textStyle(size: 20),
        decoration: InputDecoration(
            hintText: hint,
            prefixText: prefix,
            border:
                OutlineInputBorder(borderRadius: BorderRadius.circular(10))),
        obscureText: obscure,
        onChanged: onChanged,
      ),
    );
  }
}
