import 'package:bank_sha/blocs/user/user_bloc.dart';
import 'package:bank_sha/configs/router/route_names.dart';
import 'package:bank_sha/models/user_model.dart';
import 'package:bank_sha/modules/transfer/presentasions/widgets/transfer_recent_user_item.dart';
import 'package:bank_sha/modules/transfer/presentasions/widgets/transfer_result_user_item.dart';
import 'package:bank_sha/shared/theme.dart';
import 'package:bank_sha/shared/widgets/button_widget.dart';
import 'package:bank_sha/shared/widgets/forms_widget.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TransferContent extends StatefulWidget {
  const TransferContent({super.key});

  @override
  State<TransferContent> createState() => _TransferContentState();
}

class _TransferContentState extends State<TransferContent> {
  final usernameController = TextEditingController(text: '');
  UserModel? selectedUser;

  late UserBloc userBloc;

  @override
  void initState() {
    super.initState();
    userBloc = context.read<UserBloc>()..add(UserGetRecentUsers());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Transfer',
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
          Text(
            'Search',
            style: blackTextStyle.copyWith(
              fontSize: 16,
              fontWeight: semiBold,
            ),
          ),
          const SizedBox(
            height: 14,
          ),
          CustomFormField(
            title: 'by username',
            isShowTitle: false,
            controller: usernameController,
            onFieldSubmitted: (value) {
              // if (value.isNotEmpty) {
              //   userBloc.add(UserGetByUsername(usernameController.text));
              // } else {
              //   userBloc.add(UserGetRecent());
              // }
              setState(() {});
            },
          ),
          // buildRecentUsers(),
          usernameController.text.isEmpty
              ? buildRecentUsers()
              : buildResult(), // if (selectedUser != null)
          const SizedBox(
            height: 50,
          ),
        ],
      ),
      floatingActionButton: Container(
        margin: const EdgeInsets.all(24),
        child: CustomFilledButton(
          title: 'Continue',
          onPressed: () {
            // Navigator.push(
            //   context,
            //   MaterialPageRoute(
            //     builder: (context) => TransferAmountPage(
            //       data: TransferFormModel(
            //         sendTo: selectedUser?.username,
            //       ),
            //     ),
            //   ),
            // );
          },
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }

  Widget buildRecentUsers() {
    return Container(
      margin: const EdgeInsets.only(
        top: 40,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Recent Users',
            style: blackTextStyle.copyWith(
              fontSize: 16,
              fontWeight: semiBold,
            ),
          ),
          const SizedBox(
            height: 14,
          ),
          BlocBuilder<UserBloc, UserState>(
            builder: (context, state) {
              return Column(children: [
                GestureDetector(
                  onTap: () {
                    context.goNamed(RouteNames.transferAmount);
                    // Navigator.push(
                    //   context,
                    //   MaterialPageRoute(
                    //     builder: (context) => TransferAmountPage(
                    //       data: TransferFormModel(
                    //         sendTo: user.username,
                    //       ),
                    //     ),
                    //   ),
                    // );
                  },
                  child: const TransferRecentUserItem(),
                ),
                GestureDetector(
                  onTap: () {
                    context.goNamed(RouteNames.transferAmount);
                    // Navigator.push(
                    //   context,
                    //   MaterialPageRoute(
                    //     builder: (context) => TransferAmountPage(
                    //       data: TransferFormModel(
                    //         sendTo: user.username,
                    //       ),
                    //     ),
                    //   ),
                    // );
                  },
                  child: const TransferRecentUserItem(),
                )
              ]);
            },
          ),
        ],
      ),
    );
  }

  Widget buildResult() {
    return Container(
      margin: const EdgeInsets.only(
        top: 40,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Result',
            style: blackTextStyle.copyWith(
              fontSize: 16,
              fontWeight: semiBold,
            ),
          ),
          const SizedBox(
            height: 14,
          ),
          Wrap(
            spacing: 17,
            runSpacing: 17,
            children: [
              GestureDetector(
                onTap: () {
                  // setState(() {
                  //   selectedUser = user;
                  // });
                },
                child: const TransferResultUserItem(
                  // user: user,
                  // isSelected: user.id == selectedUser?.id,
                  isSelected: true,
                ),
              ),
              GestureDetector(
                onTap: () {
                  // setState(() {
                  //   selectedUser = user;
                  // });
                },
                child: const TransferResultUserItem(
                  // user: user,
                  // isSelected: user.id == selectedUser?.id,
                  isSelected: true,
                ),
              ),
              GestureDetector(
                onTap: () {
                  // setState(() {
                  //   selectedUser = user;
                  // });
                },
                child: const TransferResultUserItem(
                  // user: user,
                  // isSelected: user.id == selectedUser?.id,
                  isSelected: true,
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
