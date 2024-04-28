import 'package:bank_sha/blocs/auth/auth_bloc.dart';
import 'package:bank_sha/configs/router/route_names.dart';
import 'package:bank_sha/modules/auth/models/sign_in_form_model.dart';
import 'package:bank_sha/shared/helpers.dart';
import 'package:bank_sha/shared/theme.dart';
import 'package:bank_sha/shared/widgets/button_widget.dart';
import 'package:bank_sha/shared/widgets/input_widget.dart';
import 'package:bank_sha/shared/widgets/text_button_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class SignInContent extends StatelessWidget {
  final TextEditingController emailController;
  final TextEditingController passwordController;
  final bool isLoading;
  const SignInContent(
      {super.key,
      required this.emailController,
      required this.passwordController,
      required this.isLoading});

  bool validate(String email, String password) {
    return email.isNotEmpty && password.isNotEmpty;
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Stack(
        children: [
          Container(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
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
                          fontWeight: bold,
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 70,
                ),
                Text(
                  'Sign In &\nGrow Your Finance',
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
                        height: 8,
                      ),
                      Align(
                        alignment: Alignment.centerRight,
                        child: Text(
                          'Forgot Password',
                          style: blueTextStyle,
                        ),
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                      ButtonWidget(
                          onPress: () {
                            final email = emailController.text;
                            final password = passwordController.text;
                            SignInFormModel data = SignInFormModel(
                                email: email, password: password);
                            if (validate(email, password)) {
                              context.read<AuthBloc>().add(
                                    AuthLogin(data),
                                  );
                            } else {
                              showCustomSnackbar(
                                context,
                                'Field tidak boleh ada yang kosong',
                              );
                            }
                          },
                          title: 'Sign In')
                    ],
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Center(
                  child: TextButtonWidget(
                    title: 'Create New Account',
                    onPress: () => context.goNamed(RouteNames.signUp),
                  ),
                ),
              ],
            ),
          ),
          if (isLoading)
            Positioned.fill(
              child: Container(
                color: Colors.black.withOpacity(0.5),
                child: Center(
                  child: CircularProgressIndicator(
                    color: kPurpleColor,
                  ),
                ),
              ),
            ),
        ],
      ),
    );
  }
}
