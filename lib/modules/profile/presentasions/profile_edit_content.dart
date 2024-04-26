import 'package:bank_sha/blocs/auth/auth_bloc.dart';
import 'package:bank_sha/configs/router/route_names.dart';
import 'package:bank_sha/models/user_model.dart';
import 'package:bank_sha/modules/profile/models/profile_edit_form_model.dart';
import 'package:bank_sha/shared/helpers.dart';
import 'package:bank_sha/shared/theme.dart';
import 'package:bank_sha/shared/widgets/button_widget.dart';
import 'package:bank_sha/shared/widgets/forms_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class ProfileEditContent extends StatefulWidget {
  // final UserModel user;

  const ProfileEditContent({super.key});
  // const ProfileEditContent({super.key, required this.user});

  @override
  State<ProfileEditContent> createState() => _ProfileEditContentState();
}

class _ProfileEditContentState extends State<ProfileEditContent> {
  final usernameController = TextEditingController(text: '');
  final nameController = TextEditingController(text: '');
  final emailController = TextEditingController(text: '');
  final passwordController = TextEditingController(text: '');
  UserModel user = UserModel();

  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    final authState = context.read<AuthBloc>().state;

    if (authState is AuthSuccess) {
      user = authState.user;

      usernameController.text = authState.user.username!;
      nameController.text = authState.user.name!;
      emailController.text = authState.user.email!;
      passwordController.text = authState.user.password!;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Edit Profile',
        ),
      ),
      body: BlocConsumer<AuthBloc, AuthState>(
        listener: (context, state) {
          if (state is AuthSuccess) {
            context.goNamed(RouteNames.profileEditSuccess);
          }

          if (state is AuthFailed) {
            showCustomSnackbar(context, state.e);
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
                child: Form(
                  key: _formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CustomFormField(
                        title: 'Username',
                        controller: usernameController,
                        validator: (username) {
                          if (username == '' || username.isEmpty) {
                            return 'Username tidak boleh kosong';
                          }
                          return null;
                        },
                      ),
                      const SizedBox(
                        height: 16,
                      ),
                      CustomFormField(
                        title: 'Full Name',
                        controller: nameController,
                      ),
                      const SizedBox(
                        height: 16,
                      ),
                      CustomFormField(
                        title: 'Email Address',
                        controller: emailController,
                      ),
                      const SizedBox(
                        height: 16,
                      ),
                      CustomFormField(
                        title: 'Password',
                        obscureText: true,
                        controller: passwordController,
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                      CustomFilledButton(
                        title: 'Update Now',
                        isLoading: state is AuthLoading ? true : false,
                        onPressed: () {
                          bool validate = _formKey.currentState!.validate();

                          if (validate) {
                            String username = usernameController.text;
                            String name = nameController.text;
                            String email = emailController.text;
                            String password = passwordController.text;
                            context.read<AuthBloc>().add(
                                  AuthUpdateUser(
                                    user,
                                    ProfileEditFormModel(
                                      username: username,
                                      name: name,
                                      email: email,
                                      password: password,
                                    ),
                                  ),
                                );
                          }
                        },
                      ),
                    ],
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
