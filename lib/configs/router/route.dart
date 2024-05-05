import 'package:bank_sha/configs/router/route_names.dart';
import 'package:bank_sha/modules/auth/models/sign_up_form_model.dart';
import 'package:bank_sha/modules/topup/models/topup_request_model.dart';
import 'package:bank_sha/pages/data_package/data_package_page.dart';
import 'package:bank_sha/pages/data_provider/data_provider_page.dart';
import 'package:bank_sha/pages/data_success/data_success_page.dart';
import 'package:bank_sha/pages/home/home_page.dart';
import 'package:bank_sha/pages/onboarding/onboarding_page.dart';
import 'package:bank_sha/pages/pin/pin_page.dart';
import 'package:bank_sha/pages/profile/profile_page.dart';
import 'package:bank_sha/pages/profile_edit/profile_edit_page.dart';
import 'package:bank_sha/pages/profile_edit_pin/profile_edit_pin_page.dart';
import 'package:bank_sha/pages/profile_edit_success/profile_edit_success_page.dart';
import 'package:bank_sha/pages/sign_in/sign_in_page.dart';
import 'package:bank_sha/pages/sign_up/sign_up_page.dart';
import 'package:bank_sha/pages/sign_up_set_identity/sign_up_set_identity.dart';
import 'package:bank_sha/pages/sign_up_set_profile/sign_up_set_profile.dart';
import 'package:bank_sha/pages/sign_up_success/sign_up_success.dart';
import 'package:bank_sha/pages/splash_screen/splash_screen_page.dart';
import 'package:bank_sha/pages/topup/topup_page.dart';
import 'package:bank_sha/pages/topup_amount/topup_amount_page.dart';
import 'package:bank_sha/pages/topup_success/topup_success.dart';
import 'package:bank_sha/pages/transfer/transfer_page.dart';
import 'package:bank_sha/pages/transfer_amount/transfer_amount_page.dart';
import 'package:bank_sha/pages/transfer_success/transfer_success_page.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

final GoRouter router = GoRouter(
  routes: <RouteBase>[
    GoRoute(
      path: '/',
      builder: (BuildContext context, GoRouterState state) {
        return const SplashScreenPage();
      },
    ),
    GoRoute(
      name: RouteNames.onboarding,
      path: '/onboarding',
      builder: (BuildContext context, GoRouterState state) {
        return const OnboardingPage();
      },
    ),

    // Auth
    GoRoute(
      name: RouteNames.signIn,
      path: '/signIn',
      builder: (BuildContext context, GoRouterState state) {
        return const SignInPage();
      },
    ),
    GoRoute(
      name: RouteNames.signUp,
      path: '/sign-up',
      builder: (BuildContext context, GoRouterState state) {
        return const SignUpPage();
      },
      routes: [
        GoRoute(
          name: RouteNames.signUpProfile,
          path: 'sign-up-profile',
          builder: (BuildContext context, GoRouterState state) {
            final data = state.extra! as SignUpFormModel;
            return SignUpSetProfilePage(
              data: data,
            );
          },
          routes: [
            GoRoute(
              name: RouteNames.signUpIdentity,
              path: 'sign-up-identity',
              builder: (BuildContext context, GoRouterState state) {
                final data = state.extra! as SignUpFormModel;
                return SignUpSetIdentityPage(
                  data: data,
                );
              },
            ),
          ],
        ),
        GoRoute(
          name: RouteNames.signUpSuccess,
          path: 'sign-up-success',
          builder: (BuildContext context, GoRouterState state) {
            return const SignUpSuccessPage();
          },
        ),
      ],
    ),

    // Home
    GoRoute(
      name: RouteNames.home,
      path: '/home',
      builder: (BuildContext context, GoRouterState state) {
        return const HomePage();
      },
      routes: [
        GoRoute(
          name: RouteNames.checkPin,
          path: 'check-pin',
          builder: (BuildContext context, GoRouterState state) {
            return const PinPage();
          },
        ),

        // Profile Route
        GoRoute(
          name: RouteNames.profile,
          path: 'profile',
          builder: (BuildContext context, GoRouterState state) {
            return const ProfilePage();
          },
          routes: [
            GoRoute(
              name: RouteNames.profileEdit,
              path: 'profile-edit',
              builder: (BuildContext context, GoRouterState state) {
                return const ProfileEditPage();
              },
            ),
            GoRoute(
              name: RouteNames.profileEditPin,
              path: 'profile-edit-pin',
              builder: (BuildContext context, GoRouterState state) {
                return const ProfileEditPinPage();
              },
            ),
            GoRoute(
              name: RouteNames.profileEditSuccess,
              path: 'profile-edit-success',
              builder: (BuildContext context, GoRouterState state) {
                return const ProfileEditSuccessPage();
              },
            ),
          ],
        ),

        // Topup
        GoRoute(
          name: RouteNames.topup,
          path: 'topup',
          builder: (BuildContext context, GoRouterState state) {
            return const TopupPage();
          },
          routes: [
            GoRoute(
              name: RouteNames.topupAmount,
              path: 'topup-amount',
              builder: (BuildContext context, GoRouterState state) {
                final data = state.extra! as TopupRequestModel;
                print(data);
                return TopupAmountPage(
                  data: data,
                );
              },
            ),
            GoRoute(
              name: RouteNames.topupSuccess,
              path: 'topup-success',
              builder: (BuildContext context, GoRouterState state) {
                return const TopupSuccessPage();
              },
            ),
          ],
        ),

        // Transfer
        GoRoute(
          name: RouteNames.transfer,
          path: 'transfer',
          builder: (BuildContext context, GoRouterState state) {
            return const TransferPage();
          },
          routes: [
            GoRoute(
              name: RouteNames.transferAmount,
              path: 'transfer-amount',
              builder: (BuildContext context, GoRouterState state) {
                return const TransferAmountPage();
              },
            ),
            GoRoute(
              name: RouteNames.transferSuccess,
              path: 'transfer-success',
              builder: (BuildContext context, GoRouterState state) {
                return const TransferSuccessPage();
              },
            ),
          ],
        ),

        GoRoute(
          name: RouteNames.dataProvider,
          path: 'data-provider',
          builder: (context, state) {
            return const DataProviderPage();
          },
          routes: [
            GoRoute(
              name: RouteNames.dataPackage,
              path: 'data-package/:id',
              builder: (context, state) {
                return DataPackagePage(
                  id: state.pathParameters['id'] ?? '',
                );
              },
            ),
            GoRoute(
              name: RouteNames.dataSuccess,
              path: 'data-success',
              builder: (context, state) {
                return const DataSuccessPage();
              },
            ),
          ],
        ),
      ],
    ),
  ],
);
