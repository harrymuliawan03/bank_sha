import 'package:bank_sha/blocs/auth/auth_bloc.dart';
import 'package:bank_sha/configs/router/route_names.dart';
import 'package:bank_sha/modules/profile/presentasions/widgets/profile_menu_item.dart';
import 'package:bank_sha/shared/helpers.dart';
import 'package:bank_sha/shared/theme.dart';
import 'package:bank_sha/shared/widgets/screen_loading.dart';
import 'package:bank_sha/shared/widgets/text_button_widget.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProfileContent extends StatelessWidget {
  const ProfileContent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthBloc, AuthState>(
      listener: (context, state) {
        if (state is AuthFailed) {
          showCustomSnackbar(context, state.e);
        }
        if (state is AuthInitial) {
          context.goNamed(RouteNames.signIn);
        }
      },
      builder: (context, state) {
        return Stack(
          children: [
            if (state is AuthSuccess)
              Scaffold(
                appBar: AppBar(
                  iconTheme: IconThemeData(
                    color: kBlackColor,
                  ),
                  title: const Text(
                    'My Profile',
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
                      padding: const EdgeInsets.symmetric(
                        horizontal: 30,
                        vertical: 22,
                      ),
                      decoration: BoxDecoration(
                        color: kWhiteColor,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Column(
                        children: [
                          Container(
                            width: 120,
                            height: 120,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              image: DecorationImage(
                                image: state.user.profilePicture == null
                                    ? const AssetImage(
                                        'assets/img_profile.png',
                                      )
                                    : NetworkImage(state.user.profilePicture!)
                                        as ImageProvider,
                              ),
                            ),
                            child: state.user.verified == 1
                                ? Align(
                                    alignment: Alignment.topRight,
                                    child: Container(
                                      width: 28,
                                      height: 28,
                                      decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        color: kWhiteColor,
                                      ),
                                      child: Center(
                                        child: Icon(
                                          Icons.check_circle,
                                          color: kGreenColor,
                                          size: 24,
                                        ),
                                      ),
                                    ),
                                  )
                                : null,
                          ),
                          const SizedBox(
                            height: 16,
                          ),
                          Text(
                            state.user.name ?? '',
                            style: blackTextStyle.copyWith(
                              fontSize: 18,
                              fontWeight: medium,
                            ),
                          ),
                          const SizedBox(
                            height: 40,
                          ),
                          ProfileMenuItem(
                            iconUrl: 'assets/ic_edit_profile.png',
                            title: 'Edit Profile',
                            onTap: () async {
                              if (await GoRouter.of(context)
                                      .pushNamed(RouteNames.checkPin) ==
                                  true) {
                                if (context.mounted) {
                                  context.goNamed(RouteNames.profileEdit);
                                }
                              }
                            },
                          ),
                          ProfileMenuItem(
                            iconUrl: 'assets/ic_pin.png',
                            title: 'My Pin',
                            onTap: () async {
                              if (await GoRouter.of(context)
                                      .pushNamed(RouteNames.checkPin) ==
                                  true) {
                                if (context.mounted) {
                                  context.goNamed(RouteNames.profileEditPin);
                                }
                              }
                            },
                          ),
                          ProfileMenuItem(
                            iconUrl: 'assets/ic_wallet.png',
                            title: 'Wallet Settings',
                            onTap: () {},
                          ),
                          ProfileMenuItem(
                            iconUrl: 'assets/ic_reward.png',
                            title: 'My Rewards',
                            onTap: () {},
                          ),
                          ProfileMenuItem(
                            iconUrl: 'assets/ic_help.png',
                            title: 'Help Center',
                            onTap: () {},
                          ),
                          ProfileMenuItem(
                            iconUrl: 'assets/ic_logout.png',
                            title: 'Log Out',
                            onTap: () {
                              context.read<AuthBloc>().add(AuthLogout());
                            },
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 50,
                    ),
                    TextButtonWidget(
                      title: 'Report a Problem',
                      onPress: () {},
                    ),
                    const SizedBox(
                      height: 50,
                    ),
                  ],
                ),
              ),
            if (state is AuthLoading) const ScreenLoading(),
          ],
        );
      },
    );
  }
}
