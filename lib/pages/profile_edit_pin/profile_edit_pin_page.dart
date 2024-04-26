import 'package:bank_sha/modules/profile/presentasions/profile_edit_pin_content.dart';
import 'package:flutter/material.dart';

class ProfileEditPinPage extends StatefulWidget {
  // final UserModel user;

  const ProfileEditPinPage({
    super.key,
    // required this.user,
  });

  @override
  State<ProfileEditPinPage> createState() => _ProfileEditPinPageState();
}

class _ProfileEditPinPageState extends State<ProfileEditPinPage> {
  @override
  Widget build(BuildContext context) {
    return const ProfileEditPinContent();
  }
}
