import 'package:bank_sha/configs/router/route_names.dart';
import 'package:bank_sha/modules/profile/presentasions/profile_edit_success_content.dart';
import 'package:bank_sha/shared/theme.dart';
import 'package:bank_sha/shared/widgets/button_widget.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class ProfileEditSuccessPage extends StatelessWidget {
  const ProfileEditSuccessPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const ProfileEditSuccessContent();
  }
}
