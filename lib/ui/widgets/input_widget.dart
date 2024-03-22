import 'package:bank_sha/shared/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class InputWidget extends StatelessWidget {
  const InputWidget(
      {super.key,
      required this.label,
      this.controller,
      this.isPassword = false,
      this.type,
      this.maxLength});

  final String label;
  final TextEditingController? controller;
  final bool isPassword;
  final TextInputType? type;
  final int? maxLength;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: blackTextStyle.copyWith(
            fontWeight: medium,
          ),
        ),
        const SizedBox(
          height: 8,
        ),
        SizedBox(
          height: 45,
          child: TextField(
            controller: controller,
            inputFormatters: [
              LengthLimitingTextInputFormatter(maxLength), // Set maximum length
            ],
            keyboardType: type,
            obscureText: isPassword,
            decoration: InputDecoration(
              contentPadding: const EdgeInsets.all(12),
              border: OutlineInputBorder(
                borderSide: const BorderSide(
                  color: Color(0xffEFEEF1),
                ),
                borderRadius: BorderRadius.circular(14),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
