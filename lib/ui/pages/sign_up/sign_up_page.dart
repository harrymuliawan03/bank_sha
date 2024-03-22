import 'package:bank_sha/blocs/auth/auth_bloc.dart';
import 'package:bank_sha/configs/router/route_names.dart';
import 'package:bank_sha/shared/helpers.dart';
import 'package:bank_sha/shared/theme.dart';
import 'package:bank_sha/ui/widgets/button_widget.dart';
import 'package:bank_sha/ui/widgets/input_widget.dart';
import 'package:bank_sha/ui/widgets/text_button_widget.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  bool validate() {
    if (nameController.text.isEmpty ||
        emailController.text.isEmpty ||
        passwordController.text.isEmpty) {
      return false;
    }
    return true;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocConsumer<AuthBloc, AuthState>(
        listener: (context, state) {
          if (state is AuthFailed) {
            showCustomSnackbar(context, state.e);
          }
          if (state is AuthCheckEmailExistSuccess) {
            context.pushNamed(
              RouteNames.signUpProfile,
              extra: {
                'name': nameController.text,
                'email': emailController.text,
                'password': passwordController.text
              },
            );
          }
        },
        builder: (context, state) {
          if (state is AuthLoading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
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
                              if (validate()) {
                                // context.goNamed(RouteNames.signUpProfile);
                                context.read<AuthBloc>().add(
                                    AuthCheckEmailExist(emailController.text));
                              } else {
                                showCustomSnackbar(context,
                                    'Field tidak boleh ada yang kosong');
                              }
                            },
                            title: 'Continue')
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
        },
      ),
    );
  }
}
