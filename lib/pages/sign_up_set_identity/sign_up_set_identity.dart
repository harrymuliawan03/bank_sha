import 'dart:convert';
import 'dart:io';

import 'package:bank_sha/blocs/auth/auth_bloc.dart';
import 'package:bank_sha/configs/router/route_names.dart';
import 'package:bank_sha/modules/auth/models/sign_up_form_model.dart';
import 'package:bank_sha/shared/helpers.dart';
import 'package:bank_sha/shared/theme.dart';
import 'package:bank_sha/shared/widgets/button_widget.dart';
import 'package:bank_sha/shared/widgets/text_button_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
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
      body: BlocConsumer<AuthBloc, AuthState>(
        listener: (context, state) {
          if (state is AuthFailed) {
            showCustomSnackbar(context, state.e);
          }

          if (state is AuthSuccess) {
            context.goNamed(RouteNames.signUpSuccess);
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
                        ButtonWidget(
                            onPress: () {
                              print(widget.data.profilePicture);
                              if (selectedImage != null) {
                                print(widget.data);
                                context.read<AuthBloc>().add(
                                      AuthRegister(
                                        widget.data.copyWith(
                                          ktp: selectedImage == null
                                              ? null
                                              : 'data:image/png;base64,' +
                                                  base64Encode(
                                                      File(selectedImage!.path)
                                                          .readAsBytesSync()),
                                        ),
                                      ),
                                    );
                              } else {
                                showCustomSnackbar(context,
                                    'Passport / ID Card tidak boleh kosong');
                              }
                            },
                            title: 'Continue')
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 50,
                  ),
                  Center(
                    child: TextButtonWidget(
                      title: 'Skip for now',
                      onPress: () {
                        context.read<AuthBloc>().add(
                              AuthRegister(
                                widget.data,
                              ),
                            );
                      },
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
