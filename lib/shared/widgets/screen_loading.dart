import 'package:bank_sha/shared/theme.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class ScreenLoading extends StatelessWidget {
  const ScreenLoading({super.key});

  @override
  Widget build(BuildContext context) {
    return Positioned.fill(
      child: Container(
        color: Colors.black.withOpacity(0.5),
        child: Center(
          child: CircularProgressIndicator(
            color: kPurpleColor,
          ),
        ),
      ),
    );
  }
}
