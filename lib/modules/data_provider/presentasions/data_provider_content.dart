import 'package:bank_sha/blocs/auth/auth_bloc.dart';
import 'package:bank_sha/blocs/data_provider/data_provider_bloc.dart';
import 'package:bank_sha/configs/router/route_names.dart';
import 'package:bank_sha/modules/data_provider/models/data_provider_model.dart';
import 'package:bank_sha/modules/data_provider/presentasions/widgets/data_provider_item.dart';
import 'package:bank_sha/shared/helpers.dart';
import 'package:bank_sha/shared/theme.dart';
import 'package:bank_sha/shared/widgets/button_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class DataProviderContent extends StatefulWidget {
  const DataProviderContent({super.key});

  @override
  State<DataProviderContent> createState() => _DataProviderContentState();
}

class _DataProviderContentState extends State<DataProviderContent> {
  DataProviderModel? selectedOperator;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Beli Data',
        ),
      ),
      floatingActionButton: selectedOperator != null
          ? Container(
              margin: EdgeInsets.all(defaultMargin),
              child: CustomFilledButton(
                title: 'Continue',
                onPressed: () {
                  context.goNamed(
                    RouteNames.dataPackage,
                    extra: selectedOperator,
                  );
                },
              ),
            )
          : null,
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
            'From Wallet',
            style: blackTextStyle.copyWith(
              fontSize: 16,
              fontWeight: semiBold,
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Row(
            children: [
              Image.asset(
                'assets/img_wallet.png',
                width: 80,
              ),
              const SizedBox(
                width: 16,
              ),
              BlocBuilder<AuthBloc, AuthState>(
                builder: (context, state) {
                  if (state is AuthSuccess) {
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          state.user.cardNumber!.replaceAllMapped(
                              RegExp(r".{4}"), (match) => "${match.group(0)} "),
                          style: blackTextStyle.copyWith(
                            fontSize: 16,
                            fontWeight: medium,
                          ),
                        ),
                        const SizedBox(
                          height: 2,
                        ),
                        Text(
                          formatCurrency(state.user.balance ?? 0),
                          style: greyTextStyle.copyWith(
                            fontSize: 12,
                          ),
                        ),
                      ],
                    );
                  }
                  return Container();
                },
              ),
            ],
          ),
          const SizedBox(
            height: 40,
          ),
          Text(
            'Select Provider',
            style: blackTextStyle.copyWith(
              fontSize: 16,
              fontWeight: semiBold,
            ),
          ),
          const SizedBox(
            height: 14,
          ),
          BlocProvider(
            create: (context) => DataProviderBloc()
              ..add(const DataProviderEvent.getDataProvider()),
            child: BlocBuilder<DataProviderBloc, DataProviderState>(
              builder: (context, state) {
                return state.maybeWhen(
                  loading: () {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  },
                  success: (data) {
                    return Column(
                      children: data
                          .map(
                            (operator) => GestureDetector(
                              onTap: () {
                                setState(() {
                                  selectedOperator = operator;
                                });
                              },
                              child: DataProviderItem(
                                operator: operator,
                                isSelected: operator.id == selectedOperator?.id,
                              ),
                            ),
                          )
                          .toList(),
                    );
                  },
                  orElse: () => Container(),
                );
              },
            ),
          ),
          const SizedBox(
            height: 120,
          ),
        ],
      ),
    );
  }
}
