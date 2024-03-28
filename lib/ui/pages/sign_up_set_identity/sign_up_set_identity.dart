import 'dart:io';

import 'package:bank_sha/configs/router/route_names.dart';
import 'package:bank_sha/models/sign_up_form_model.dart';
import 'package:bank_sha/shared/helpers.dart';
import 'package:bank_sha/shared/theme.dart';
import 'package:bank_sha/ui/widgets/button_widget.dart';
import 'package:bank_sha/ui/widgets/text_button_widget.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:image_picker/image_picker.dart';

class SignUpSetIdentityPage extends StatefulWidget {
  const SignUpSetIdentityPage({
    super.key,
    required this.data,
  });

  final SignUpFormModel data;

  @override
  State<SignUpSetIdentityPage> createState() => _SignUpSetIdentityPageState();
}

class _SignUpSetIdentityPageState extends State<SignUpSetIdentityPage> {
  XFile? selectedImage;

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
                'Verify Your\nAccount',
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
                    GestureDetector(
                      onTap: () async {
                        final image = await selectImage();

                        setState(() {
                          selectedImage = image;
                        });
                      },
                      child: Container(
                        height: 120,
                        width: 120,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: kLightGreyColor,
                          image: selectedImage == null
                              ? null
                              : DecorationImage(
                                  fit: BoxFit.cover,
                                  image: FileImage(
                                    File(
                                      selectedImage!.path,
                                    ),
                                  ),
                                ),
                        ),
                        child: selectedImage != null
                            ? null
                            : Center(
                                child: Image.asset(
                                  'assets/ic_upload.png',
                                  width: 32,
                                  height: 32,
                                ),
                              ),
                      ),
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    Text(
                      'Passport/ID Card',
                      style: blackTextStyle.copyWith(
                        fontSize: 18,
                        fontWeight: medium,
                      ),
                    ),
                    const SizedBox(
                      height: 50,
                    ),
                    ButtonWidget(onPress: () {}, title: 'Continue')
                  ],
                ),
              ),
              const SizedBox(
                height: 50,
              ),
              Center(
                child: TextButtonWidget(
                  title: 'Skip for now',
                  onPress: () => context.goNamed(RouteNames.signUpSuccess),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
