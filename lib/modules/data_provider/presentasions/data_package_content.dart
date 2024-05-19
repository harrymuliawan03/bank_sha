import 'package:bank_sha/blocs/auth/auth_bloc.dart';
import 'package:bank_sha/blocs/data_plan/data_plan_bloc.dart';
import 'package:bank_sha/configs/router/route_names.dart';
import 'package:bank_sha/modules/data_provider/models/data_plan_model.dart';
import 'package:bank_sha/modules/data_provider/models/data_plan_request_model.dart';
import 'package:bank_sha/modules/data_provider/models/data_provider_model.dart';
import 'package:bank_sha/modules/data_provider/presentasions/widgets/data_package_item.dart';
import 'package:bank_sha/shared/helpers.dart';
import 'package:bank_sha/shared/theme.dart';
import 'package:bank_sha/shared/widgets/button_widget.dart';
import 'package:bank_sha/shared/widgets/forms_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class DataPackageContent extends StatefulWidget {
  final DataProviderModel dataProvider;

  const DataPackageContent({
    super.key,
    required this.dataProvider,
  });

  @override
  State<DataPackageContent> createState() => _DataPackageContentState();
}

class _DataPackageContentState extends State<DataPackageContent> {
  final phoneController = TextEditingController(text: '');
  DataPlanModel? selectedDataPlan;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Paket Data',
        ),
      ),
      body: BlocProvider(
        create: (context) => DataPlanBloc(),
        child: BlocConsumer<DataPlanBloc, DataPlanState>(
          listener: (context, state) {
            if (state is DataPlanSuccess) {
              if (context.mounted) {
                context.read<AuthBloc>().add(
                      AuthUpdateBalance(
                        selectedDataPlan!.price! * -1,
                      ),
                    );

                context.goNamed(RouteNames.dataSuccess);
              }
            }

            if (state is DataPlanFailed) {
              showCustomSnackbar(context, state.e);
            }
          },
          builder: (context, state) {
            return ListView(
              padding: const EdgeInsets.symmetric(
                horizontal: 24,
              ),
              children: [
                const SizedBox(
                  height: 30,
                ),
                Text(
                  'Phone Number',
                  style: blackTextStyle.copyWith(
                    fontSize: 16,
                    fontWeight: semiBold,
                  ),
                ),
                const SizedBox(
                  height: 14,
                ),
                CustomFormField(
                  title: '+62',
                  isShowTitle: false,
                  controller: phoneController,
                  onChanged: (val) => setState(() {}),
                ),
                const SizedBox(
                  height: 40,
                ),
                Text(
                  'Select Package',
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
                  alignment: WrapAlignment.center,
                  children: widget.dataProvider.dataPlans!
                      .map(
                        (dataPlan) => GestureDetector(
                          onTap: () {
                            setState(() {
                              selectedDataPlan = dataPlan;
                            });
                          },
                          child: DataPackageItem(
                            dataPlan: dataPlan,
                            isSelected: dataPlan.id == selectedDataPlan?.id,
                          ),
                        ),
                      )
                      .toList(),
                ),
                const SizedBox(
                  height: 85,
                ),
                if (selectedDataPlan != null &&
                    phoneController.text.length > 10)
                  CustomFilledButton(
                    title: 'Continue',
                    onPressed: () async {
                      if (await context.pushNamed(RouteNames.checkPin) ==
                          true) {
                        if (context.mounted) {
                          final authState = context.read<AuthBloc>().state;
                          String pin = '';

                          if (authState is AuthSuccess) {
                            pin = authState.user.pin!;
                          }

                          context.read<DataPlanBloc>().add(
                                DataPlanPost(
                                  DataPlanRequestModel(
                                    dataPlanId: selectedDataPlan!.id.toString(),
                                    phoneNumber: phoneController.text,
                                    pin: pin,
                                  ),
                                ),
                              );
                        }
                      }
                    },
                  ),
                const SizedBox(
                  height: 57,
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
