import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class TextFormFieldCustome extends StatelessWidget {
  final String hintText;
  final String? prefiText;
  final bool enable;
  final Function(String)? onChanged;
  final Function(String)? onFieldSubmitted;
  final TextEditingController? controller;
  final String? errorText;
  final bool isValidInputForPhone;
  final String? Function(String?)? validator;
  const TextFormFieldCustome({
    super.key,
    required this.hintText,
    this.prefiText,
    this.enable = true,
    this.onChanged,
    this.onFieldSubmitted,
    this.controller,
    this.errorText,
    this.isValidInputForPhone = false,
    this.validator,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      keyboardType: TextInputType.phone,
      controller: controller,
      style: const TextStyle(
        fontWeight: FontWeight.bold,
        fontSize: 12,
      ),
      onChanged: onChanged,
      onFieldSubmitted: onFieldSubmitted,
      validator: validator,
      inputFormatters: [
        if (isValidInputForPhone) ...[
          FilteringTextInputFormatter.digitsOnly,
        ]
      ],
      decoration: InputDecoration(
        errorText: errorText,
        hintText: hintText,
        prefixText: prefiText,
        filled: true,
        enabled: enable,
        fillColor: const Color(0xFFECFCF9),
        hintStyle: const TextStyle(fontStyle: FontStyle.italic),
        disabledBorder: const OutlineInputBorder(
            borderSide: BorderSide(color: Colors.grey)),
        focusedBorder: const OutlineInputBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(
              15,
            ),
          ),
          borderSide: BorderSide(
            color: Colors.green,
          ),
        ),
        border: const OutlineInputBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(
              15,
            ),
          ),
        ),
        prefixStyle: const TextStyle(
          color: Colors.black,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
