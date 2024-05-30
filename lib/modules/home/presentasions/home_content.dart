import 'package:bank_sha/blocs/auth/auth_bloc.dart';
import 'package:bank_sha/blocs/tips/tips_bloc.dart';
import 'package:bank_sha/blocs/transaction/transaction_bloc.dart';
import 'package:bank_sha/blocs/user/user_bloc.dart';
import 'package:bank_sha/configs/router/route_names.dart';
import 'package:bank_sha/models/user_model.dart';
import 'package:bank_sha/modules/home/presentasions/widgets/home_popup_more.dart';
import 'package:bank_sha/shared/helpers.dart';
import 'package:bank_sha/shared/theme.dart';
import 'package:bank_sha/modules/home/presentasions/widgets/home_latest_transaction_item.dart';
import 'package:bank_sha/modules/home/presentasions/widgets/home_service_item.dart';
import 'package:bank_sha/modules/home/presentasions/widgets/home_tips_item.dart';
import 'package:bank_sha/modules/home/presentasions/widgets/home_user_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class HomeContent extends StatefulWidget {
  const HomeContent({super.key});

  @override
  State<HomeContent> createState() => _HomeContentState();
}

class _HomeContentState extends State<HomeContent> {
  UserModel user = UserModel();

  @override
  void initState() {
    super.initState();
    final authState = context.read<AuthBloc>().state;

    if (authState is AuthSuccess) {
      user = authState.user;
    }
  }

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverAppBar(
          surfaceTintColor: Colors.white,
          centerTitle: false,
          title: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Howdy,',
                style: greyTextStyle.copyWith(
                  fontSize: 16,
                ),
              ),
              const SizedBox(
                height: 2,
              ),
              Text(
                user.name!,
                style: blackTextStyle.copyWith(
                  fontSize: 20,
                  fontWeight: semiBold,
                ),
              ),
            ],
          ),
          floating: true,
          // pinned: true,
          expandedHeight: 70,
          actions: [
            GestureDetector(
              onTap: () {
                context.goNamed(RouteNames.profile);
              },
              child: Container(
                width: 60,
                height: 60,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  image: DecorationImage(
                    image: (user.profilePicture == null ||
                            user.profilePicture == '')
                        ? const AssetImage(
                            'assets/img_profile.png',
                          )
                        : NetworkImage(user.profilePicture!) as ImageProvider,
                  ),
                ),
              ),
            ),
          ],
        ),
        SliverToBoxAdapter(
          child: Container(
            margin: EdgeInsets.all(defaultMargin),
            child: Column(
              children: [
                // buildProfile(context),
                buildWalletCard(),
                buildLevel(),
                buildServices(context),
                buildLatestTransactions(),
                buildSendAgain(),
                buildFriendlyTips(),
              ],
            ),
          ),
        )
      ],
    );
    // ListView(
    //   padding: const EdgeInsets.symmetric(
    //     horizontal: 24,
    //   ),

    //   children: [
    //     buildProfile(context),
    //     buildWalletCard(),
    //     buildLevel(),
    //     buildServices(context),
    //     buildLatestTransactions(),
    //     buildSendAgain(),
    //     buildFriendlyTips(),
    //   ],
    // );
  }

  Widget buildProfile(BuildContext context) {
    return BlocBuilder<AuthBloc, AuthState>(
      builder: (context, state) {
        if (state is AuthSuccess) {
          return Container(
            margin: const EdgeInsets.only(
              top: 40,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Howdy,',
                      style: greyTextStyle.copyWith(
                        fontSize: 16,
                      ),
                    ),
                    const SizedBox(
                      height: 2,
                    ),
                    Text(
                      state.user.name ?? '',
                      style: blackTextStyle.copyWith(
                        fontSize: 20,
                        fontWeight: semiBold,
                      ),
                    ),
                  ],
                ),
                GestureDetector(
                  onTap: () {
                    context.goNamed(RouteNames.profile);
                  },
                  child: Container(
                    width: 60,
                    height: 60,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      image: DecorationImage(
                        image: (state.user.profilePicture == null ||
                                state.user.profilePicture == '')
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
                              width: 16,
                              height: 16,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: kWhiteColor,
                              ),
                              child: Center(
                                child: Icon(
                                  Icons.check_circle,
                                  color: kGreenColor,
                                  size: 14,
                                ),
                              ),
                            ),
                          )
                        : null,
                  ),
                ),
              ],
            ),
          );
        }
        return Container();
      },
    );
  }

  Widget buildWalletCard() {
    return BlocBuilder<AuthBloc, AuthState>(builder: (context, state) {
      if (state is AuthSuccess) {
        return Container(
          width: double.infinity,
          height: 220,
          margin: const EdgeInsets.only(
              // top: 30,
              ),
          padding: const EdgeInsets.all(30),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(28),
            image: const DecorationImage(
              fit: BoxFit.cover,
              image: AssetImage(
                'assets/img_bg_card.png',
              ),
            ),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                state.user.name ?? '',
                style: whiteTextStyle.copyWith(
                  fontSize: 18,
                  fontWeight: medium,
                ),
              ),
              const SizedBox(
                height: 28,
              ),
              Text(
                '**** **** **** ${state.user.cardNumber?.substring(12, 16)}',
                style: whiteTextStyle.copyWith(
                  fontSize: 18,
                  fontWeight: medium,
                  letterSpacing: 6,
                ),
              ),
              const SizedBox(
                height: 21,
              ),
              Text(
                'Balance',
                style: whiteTextStyle,
              ),
              Text(
                formatCurrency(state.user.balance ?? 0),
                style: whiteTextStyle.copyWith(
                  fontSize: 24,
                  fontWeight: semiBold,
                ),
              ),
            ],
          ),
        );
      }
      return Container();
    });
  }

  Widget buildLevel() {
    return Container(
      margin: const EdgeInsets.only(
        top: 20,
      ),
      padding: const EdgeInsets.all(22),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: kWhiteColor,
      ),
      child: Column(
        children: [
          Row(
            children: [
              Text(
                'Level 1',
                style: blackTextStyle.copyWith(
                  fontWeight: medium,
                ),
              ),
              const Spacer(),
              Text(
                '55% ',
                style: greenTextStyle.copyWith(
                  fontWeight: semiBold,
                ),
              ),
              Text(
                'of Rp 20.000',
                style: blackTextStyle.copyWith(
                  fontWeight: semiBold,
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 10,
          ),
          ClipRRect(
            borderRadius: BorderRadius.circular(55),
            child: TweenAnimationBuilder<double>(
              duration: const Duration(milliseconds: 1000),
              curve: Curves.easeInOut,
              tween: Tween<double>(
                begin: 0,
                end: 0.8,
              ),
              builder: (context, value, _) => LinearProgressIndicator(
                value: value,
                backgroundColor: kLightBackgroundColor,
                valueColor: AlwaysStoppedAnimation(kGreenColor),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget buildServices(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(
        top: 30,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Do Something',
            style: blackTextStyle.copyWith(
              fontSize: 16,
              fontWeight: semiBold,
            ),
          ),
          const SizedBox(
            height: 14,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              HomeServiceItem(
                iconUrl: 'assets/ic_topup.png',
                title: 'Top Up',
                onTap: () {
                  context.goNamed(RouteNames.topup);
                },
              ),
              HomeServiceItem(
                iconUrl: 'assets/ic_send.png',
                title: 'Send',
                onTap: () {
                  context.goNamed(RouteNames.transfer);
                },
              ),
              HomeServiceItem(
                iconUrl: 'assets/ic_withdraw.png',
                title: 'Withdraw',
                onTap: () {},
              ),
              HomeServiceItem(
                iconUrl: 'assets/ic_more.png',
                title: 'More',
                onTap: () {
                  showDialog(
                    context: context,
                    builder: (context) => const HomePopupMore(),
                  );
                },
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget buildLatestTransactions() {
    return Container(
      margin: const EdgeInsets.only(
        top: 30,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Latest Transactions',
            style: blackTextStyle.copyWith(
              fontSize: 16,
              fontWeight: semiBold,
            ),
          ),
          Container(
            padding: const EdgeInsets.all(22),
            margin: const EdgeInsets.only(
              top: 14,
            ),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: kWhiteColor,
            ),
            child: BlocProvider(
              create: (context) => TransactionBloc()..add(TransactionsGet()),
              child: BlocBuilder<TransactionBloc, TransactionState>(
                builder: (context, state) {
                  if (state is TransactionSuccess) {
                    if (state.transactions.isNotEmpty) {
                      return Column(
                          children: state.transactions
                              .map((item) => HomeLatestTransactionItem(
                                    transaction: item,
                                  ))
                              .toList());
                    }
                    return Center(
                      child: Text(
                        'There is no transaction',
                        style: blackTextStyle.copyWith(
                          fontWeight: medium,
                        ),
                      ),
                    );
                  }
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget buildSendAgain() {
    return Container(
      margin: const EdgeInsets.only(
        top: 30,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Send Again',
            style: blackTextStyle.copyWith(
              fontSize: 16,
              fontWeight: semiBold,
            ),
          ),
          const SizedBox(
            height: 14,
          ),
          BlocProvider(
            create: (context) => UserBloc()..add(UserGetRecentUsers()),
            child: BlocBuilder<UserBloc, UserState>(
              builder: (context, state) {
                if (state is UserSuccess) {
                  if (state.users.isNotEmpty) {
                    return SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        children: state.users
                            .map(
                              (item) => GestureDetector(
                                onTap: () {},
                                child: HomeUserItem(
                                  user: item,
                                ),
                              ),
                            )
                            .toList(),
                      ),
                    );
                  }
                  return Container(
                    padding: const EdgeInsets.all(22),
                    margin: const EdgeInsets.only(
                      top: 14,
                    ),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: kWhiteColor,
                    ),
                    child: Center(
                      child: Text(
                        'There is no transaction',
                        style: blackTextStyle.copyWith(
                          fontWeight: medium,
                        ),
                      ),
                    ),
                  );
                }
                return const Center(
                  child: CircularProgressIndicator(),
                );
              },
            ),
          )
        ],
      ),
    );
  }

  Widget buildFriendlyTips() {
    return Container(
      margin: const EdgeInsets.only(
        top: 30,
        bottom: 50,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Friendly Tips',
            style: blackTextStyle.copyWith(
              fontSize: 16,
              fontWeight: semiBold,
            ),
          ),
          const SizedBox(
            height: 14,
          ),
          BlocProvider(
            create: (context) => TipsBloc()..add(TipsGet()),
            child: BlocBuilder<TipsBloc, TipsState>(
              builder: (context, state) {
                if (state is TipsSuccess) {
                  return SizedBox(
                    width: double.infinity,
                    child: Wrap(
                      alignment: WrapAlignment.spaceAround,
                      spacing: 17,
                      runSpacing: 18,
                      children: state.tips
                          .map(
                            (item) => HomeTipsItem(
                              tips: item,
                              url: Uri.parse(item.url!),
                            ),
                          )
                          .toList(),
                    ),
                  );
                }
                return const Center(
                  child: CircularProgressIndicator(),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
