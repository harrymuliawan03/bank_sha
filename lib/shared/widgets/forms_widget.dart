import 'package:bank_sha/shared/theme.dart';
import 'package:flutter/material.dart';

class CustomFormField extends StatelessWidget {
  final String title;
  final bool obscureText;
  final TextEditingController? controller;
  final bool isShowTitle;
  final Function(String)? onFieldSubmitted;
  final String? Function(String)? validator;
  final int? maxLength;
  final TextInputType? textInputType;

  const CustomFormField(
      {super.key,
      required this.title,
      this.obscureText = false,
      this.controller,
      this.validator,
      this.isShowTitle = true,
      this.onFieldSubmitted,
      this.maxLength,
      this.textInputType});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (isShowTitle)
          Text(
            title,
            style: blackTextStyle.copyWith(
              fontWeight: medium,
            ),
          ),
        if (isShowTitle)
          const SizedBox(
            height: 8,
          ),
        TextFormField(
          obscureText: obscureText,
          maxLength: maxLength,
          controller: controller,
          keyboardType: textInputType,
          autovalidateMode: AutovalidateMode.onUserInteraction,
          validator: (value) {
            if (validator != null) {
              return validator!(value ??
                  ''); // Adding ! after validator to assert that it's not null
            }
            return null;
          },
          decoration: InputDecoration(
            hintText: !isShowTitle ? title : null,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(14),
            ),
            contentPadding: const EdgeInsets.all(12),
          ),
          onFieldSubmitted: onFieldSubmitted,
        ),
      ],
    );
  }
}
