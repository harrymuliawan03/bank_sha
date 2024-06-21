import 'package:bank_sha/blocs/auth/auth_bloc.dart';
import 'package:bank_sha/modules/profile/presentasions/profile_edit_content.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProfileEditPage extends StatefulWidget {
  // final UserModel user;

  const ProfileEditPage({super.key});
  // const ProfileEditPage({super.key, required this.user});

  @override
  State<ProfileEditPage> createState() => _ProfileEditPageState();
}

class _ProfileEditPageState extends State<ProfileEditPage> {
  @override
  Widget build(BuildContext context) {
    return const ProfileEditContent();
  }
}
