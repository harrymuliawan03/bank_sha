import 'package:bank_sha/blocs/auth/auth_bloc.dart';
import 'package:bank_sha/configs/router/route_names.dart';
import 'package:bank_sha/models/user_model.dart';
import 'package:bank_sha/modules/profile/models/profile_edit_pin_form_model.dart';
import 'package:bank_sha/shared/helpers.dart';
import 'package:bank_sha/shared/theme.dart';
import 'package:bank_sha/shared/widgets/button_widget.dart';
import 'package:bank_sha/shared/widgets/forms_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class ProfileEditPinContent extends StatefulWidget {
  const ProfileEditPinContent({
    super.key,
    // required this.user,
  });

  @override
  State<ProfileEditPinContent> createState() => _ProfileEditPinContentState();
}

class _ProfileEditPinContentState extends State<ProfileEditPinContent> {
  final oldPinController = TextEditingController(text: '');
  final newPinController = TextEditingController(text: '');
  UserModel user = UserModel();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    final authState = context.read<AuthBloc>().state;

    if (authState is AuthSuccess) {
      user = authState.user;
    }
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    oldPinController.dispose();
    newPinController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text(
            'Edit PIN',
          ),
        ),
        body: BlocConsumer<AuthBloc, AuthState>(
          listener: (context, state) {
            if (state is AuthFailed) {
              showCustomSnackbar(context, state.e);
            }
            if (state is AuthSuccess) {
              context.goNamed(RouteNames.profileEditSuccess);
            }
          },
          builder: (context, state) {
            return ListView(
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
                        textInputType: TextInputType.number,
                        maxLength: 6,
                        obscureText: true,
                      ),
                      const SizedBox(
                        height: 16,
                      ),
                      CustomFormField(
                        title: 'New PIN',
                        maxLength: 6,
                        textInputType: TextInputType.number,
                        controller: newPinController,
                        obscureText: true,
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                      CustomFilledButton(
                        title: 'Update Now',
                        isLoading: state is AuthLoading ? true : false,
                        onPressed: () {
                          context.read<AuthBloc>().add(
                                AuthUpdatePin(
                                  user,
                                  ProfileEditPinFormModel(
                                    prevPin: oldPinController.text,
                                    newPin: newPinController.text,
                                  ),
                                ),
                              );
                        },
                      ),
                    ],
                  ),
                ),
              ],
            );
          },
        ));
  }
}
