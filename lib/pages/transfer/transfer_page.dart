import 'package:bank_sha/configs/router/route_names.dart';
import 'package:bank_sha/models/user_model.dart';
import 'package:bank_sha/shared/theme.dart';
import 'package:bank_sha/shared/widgets/button_widget.dart';
import 'package:bank_sha/shared/widgets/forms_widget.dart';
import 'package:bank_sha/pages/transfer/widgets/transfer_recent_user_item.dart';
import 'package:bank_sha/pages/transfer/widgets/transfer_result_user_item.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class TransferPage extends StatefulWidget {
  const TransferPage({super.key});

  @override
  State<TransferPage> createState() => _TransferPageState();
}

class _TransferPageState extends State<TransferPage> {
  final usernameController = TextEditingController(text: '');
  UserModel? selectedUser;

  // late UserBloc userBloc;

  // @override
  // void initState() {
  //   // TODO: implement initState
  //   super.initState();
  //   userBloc = context.read<UserBloc>()..add(UserGetRecent());
  // }

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
          usernameController.text.isEmpty ? buildRecentUsers() : buildResult(),
          const SizedBox(
            height: 80,
          ),
          if (selectedUser != null)
            CustomFilledButton(
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
          const SizedBox(
            height: 50,
          ),
        ],
      ),
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
          Column(children: [
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
          ]),
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