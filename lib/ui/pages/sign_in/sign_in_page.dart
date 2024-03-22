import 'package:bank_sha/configs/router/route_names.dart';
import 'package:bank_sha/shared/theme.dart';
import 'package:bank_sha/ui/widgets/button_widget.dart';
import 'package:bank_sha/ui/widgets/input_widget.dart';
import 'package:bank_sha/ui/widgets/text_button_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:go_router/go_router.dart';

class SignInPage extends StatelessWidget {
  const SignInPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
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
                  const InputWidget(
                    label: 'Email Address',
                    type: TextInputType.emailAddress,
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  const InputWidget(
                    label: 'Password',
                    isPassword: true,
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
                  ButtonWidget(onPress: () {}, title: 'Sign In')
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
    );
  }
}
