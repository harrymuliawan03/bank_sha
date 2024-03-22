import 'package:bank_sha/configs/router/route_names.dart';
import 'package:bank_sha/models/sign_up_form_model.dart';
import 'package:bank_sha/shared/theme.dart';
import 'package:bank_sha/ui/widgets/button_widget.dart';
import 'package:bank_sha/ui/widgets/input_widget.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class SignUpSetProfilePage extends StatelessWidget {
  const SignUpSetProfilePage({super.key, required this.data});

  final SignUpFormModel data;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
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
                    // Container(
                    //   height: 120,
                    //   width: 120,
                    //   decoration: BoxDecoration(
                    //     shape: BoxShape.circle,
                    //     color: kLightGreyColor,
                    //   ),
                    //   child: Center(
                    //     child: Image.asset(
                    //       'assets/ic_upload.png',
                    //       width: 32,
                    //       height: 32,
                    //     ),
                    //   ),
                    // ),
                    Container(
                      height: 120,
                      width: 120,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: kLightGreyColor,
                        image: const DecorationImage(
                          image: AssetImage('assets/img_profile.png'),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    Text(
                      'Wesley Sananta',
                      style: blackTextStyle.copyWith(
                        fontSize: 18,
                        fontWeight: medium,
                      ),
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    const InputWidget(
                      label: 'Set PIN (6 digit number)',
                      type: TextInputType.number,
                      maxLength: 6,
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    ButtonWidget(
                      onPress: () => context.goNamed(RouteNames.signUpIdentity),
                      title: 'Continue',
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
