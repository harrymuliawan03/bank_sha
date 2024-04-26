import 'package:bank_sha/modules/auth/models/check_email_form_model.dart';
import 'package:bank_sha/shared/widgets/text_button_widget.dart';
import 'package:flutter/material.dart';
import 'package:bank_sha/shared/theme.dart';
import 'package:bank_sha/modules/auth/models/sign_up_form_model.dart';
import 'package:bank_sha/shared/widgets/input_widget.dart';
import 'package:bank_sha/shared/widgets/button_widget.dart';
import 'package:bank_sha/shared/helpers.dart';
import 'package:bank_sha/blocs/auth/auth_bloc.dart';
import 'package:bank_sha/configs/router/route_names.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class SignUpContent extends StatelessWidget {
  final TextEditingController nameController;
  final TextEditingController emailController;
  final TextEditingController passwordController;

  const SignUpContent({
    super.key,
    required this.nameController,
    required this.emailController,
    required this.passwordController,
  });

  bool validate(String name, String email, String password) {
    return name.isNotEmpty && email.isNotEmpty && password.isNotEmpty;
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        margin: EdgeInsets.all(defaultMargin),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              margin: const EdgeInsets.only(top: 100),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    height: 50,
                    width: 50,
                    decoration: const BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage('assets/img_logo_dark.png'),
                      ),
                    ),
                  ),
                  const SizedBox(width: 10),
                  Text(
                    'Sha',
                    style: logoTextStyle.copyWith(
                      color: kBlackColor,
                      fontSize: 45,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 70,
            ),
            Text(
              'Join Us to Unlock\nYour Growth',
              style: blackTextStyle.copyWith(
                fontSize: 20,
                fontWeight: semiBold,
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(22),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: kWhiteColor,
              ),
              child: Column(
                children: [
                  InputWidget(
                    label: 'Full Name',
                    controller: nameController,
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  InputWidget(
                    label: 'Email Address',
                    type: TextInputType.emailAddress,
                    controller: emailController,
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  InputWidget(
                    label: 'Password',
                    isPassword: true,
                    controller: passwordController,
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  ButtonWidget(
                    onPress: () {
                      final name = nameController.text;
                      final email = emailController.text;
                      final password = passwordController.text;

                      if (validate(name, email, password)) {
                        context.read<AuthBloc>().add(
                              AuthCheckEmailExist(
                                  CheckEmailFormModel(email: email)),
                            );
                      } else {
                        showCustomSnackbar(
                          context,
                          'Field tidak boleh ada yang kosong',
                        );
                      }
                    },
                    title: 'Continue',
                  )
                ],
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Center(
              child: TextButtonWidget(
                title: 'Sign In',
                onPress: () => context.goNamed(RouteNames.signIn),
              ),
            ),
            const SizedBox(
              height: 20,
            )
          ],
        ),
      ),
    );
  }
}
