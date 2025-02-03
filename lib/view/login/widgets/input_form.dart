import 'package:codeedex/services/providers/obscureicon.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class InputField extends StatelessWidget {
  final String label;
  final String hintText;
  final bool isPassword;
    final TextEditingController controller;
  final String? Function(String?)? validator;

  const InputField({
   required this.label,
    required this.hintText,
    this.isPassword = false,
    required this.controller,
    required this.validator,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return  Consumer<TextFieldProvider>(
        builder: (context, provider, child){
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            label,
            style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.white),
          ),
          TextField(
          obscureText: isPassword && provider.obscureText,
           controller: controller,
            decoration: InputDecoration(
              hintText: hintText,
              hintStyle: const TextStyle(color: Colors.white70),
              enabledBorder: const UnderlineInputBorder(
                borderSide: BorderSide(color: Colors.white),
              ),
              suffixIcon: isPassword ? IconButton(
                          icon: Icon(
                              provider.obscureText ? Icons.visibility : Icons.visibility_off),
                          onPressed: provider.toggleObscureText,
                        ) : null,
            ),
          ),
        ],
      );
        }
    );
  }
}