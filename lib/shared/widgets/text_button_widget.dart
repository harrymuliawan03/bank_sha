import 'package:bank_sha/shared/theme.dart';
import 'package:flutter/material.dart';

class TextButtonWidget extends StatelessWidget {
  const TextButtonWidget(
      {super.key, required this.title, required this.onPress});

  final void Function() onPress;
  final String title;

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onPress,
      style: TextButton.styleFrom(
        padding: EdgeInsets.zero,
      ),
      child: Text(
        title,
        style: greyTextStyle.copyWith(fontSize: 16),
      ),
    );
  }
}
