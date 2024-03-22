import 'package:bank_sha/configs/router/route_names.dart';
import 'package:bank_sha/models/user_edit_form_model.dart';
import 'package:bank_sha/models/user_model.dart';
import 'package:bank_sha/shared/theme.dart';
import 'package:bank_sha/ui/widgets/button_widget.dart';
import 'package:bank_sha/ui/widgets/forms_widget.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

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
  final oldPinController = TextEditingController(text: '');
  final newPinController = TextEditingController(text: '');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text(
            'Edit PIN',
          ),
        ),
        body: ListView(
          padding: const EdgeInsets.symmetric(
            horizontal: 24,
          ),
          children: [
            const SizedBox(
              height: 30,
            ),
            Container(
              padding: const EdgeInsets.all(22),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: kWhiteColor,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CustomFormField(
                    title: 'Old PIN',
                    controller: oldPinController,
                    obscureText: true,
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  CustomFormField(
                    title: 'New PIN',
                    controller: newPinController,
                    obscureText: true,
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  CustomFilledButton(
                    title: 'Update Now',
                    onPressed: () {
                      // context.read<AuthBloc>().add(
                      //       AuthUpdatePin(
                      //         widget.user,
                      //         oldPinController.text,
                      //         newPinController.text,
                      //       ),
                      //     );
                      context.goNamed(RouteNames.profileEditSuccess);
                    },
                  ),
                ],
              ),
            ),
          ],
        ));
  }
}
