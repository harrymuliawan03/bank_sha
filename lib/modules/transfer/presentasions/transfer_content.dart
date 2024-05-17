import 'package:bank_sha/blocs/user/user_bloc.dart';
import 'package:bank_sha/configs/router/route_names.dart';
import 'package:bank_sha/models/user_model.dart';
import 'package:bank_sha/modules/transfer/presentasions/widgets/transfer_recent_user_item.dart';
import 'package:bank_sha/modules/transfer/presentasions/widgets/transfer_result_user_item.dart';
import 'package:bank_sha/shared/theme.dart';
import 'package:bank_sha/shared/widgets/button_widget.dart';
import 'package:bank_sha/shared/widgets/forms_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
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
              if (value.isNotEmpty) {
                userBloc.add(UserGetUserByUsername(usernameController.text));
              } else {
                userBloc.add(UserGetRecentUsers());
              }
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
              if (state is UserSuccess) {
                if (state.users.isNotEmpty) {
                  return Column(
                    children: state.users
                        .map(
                          (user) => GestureDetector(
                            onTap: () {
                              context.goNamed(RouteNames.transferAmount);
                            },
                            child: TransferRecentUserItem(
                              user: user,
                            ),
                          ),
                        )
                        .toList(),
                  );
                }
                return Center(
                  child: Container(
                    margin: const EdgeInsets.only(top: 50),
                    child: Text(
                      'Tidak ada transaksi terakhir',
                      style: blackTextStyle.copyWith(fontWeight: light),
                    ),
                  ),
                );
              }
              return const Center(
                child: CircularProgressIndicator(),
              );
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
          SizedBox(
            width: double.infinity,
            child: BlocBuilder<UserBloc, UserState>(
              builder: (context, state) {
                if (state is UserSuccess) {
                  return Wrap(
                    spacing: 17,
                    alignment: WrapAlignment.spaceAround,
                    runSpacing: 17,
                    children: state.users
                        .map(
                          (user) => GestureDetector(
                            onTap: () {
                              // setState(() {
                              //   selectedUser = user;
                              // });
                            },
                            child: TransferResultUserItem(
                              user: user,
                              // isSelected: user.id == selectedUser?.id,
                              isSelected: true,
                            ),
                          ),
                        )
                        .toList(),
                  );
                }
                return Center(
                  child: CircularProgressIndicator(),
                );
              },
            ),
          )
        ],
      ),
    );
  }
}
