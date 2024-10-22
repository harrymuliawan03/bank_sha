import 'package:bank_sha/blocs/auth/auth_bloc.dart';
import 'package:bank_sha/blocs/data_plan/data_plan_bloc.dart';
import 'package:bank_sha/configs/router/route_names.dart';
import 'package:bank_sha/modules/data_provider/models/data_plan_model.dart';
import 'package:bank_sha/modules/data_provider/models/data_plan_request_model.dart';
import 'package:bank_sha/modules/data_provider/models/data_provider_model.dart';
import 'package:bank_sha/modules/data_provider/presentasions/widgets/data_package_item.dart';
import 'package:bank_sha/pages/voucher/widgets/voucher_item.dart';
import 'package:bank_sha/shared/helpers.dart';
import 'package:bank_sha/shared/theme.dart';
import 'package:bank_sha/shared/widgets/button_widget.dart';
import 'package:bank_sha/shared/widgets/forms_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class VoucherPage extends StatefulWidget {
  const VoucherPage({
    super.key,
  });

  @override
  State<VoucherPage> createState() => VoucherPageState();
}

class VoucherPageState extends State<VoucherPage> {
  final phoneController = TextEditingController(text: '');
  String? selectedDataPlan;

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    phoneController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Voucher Games',
        ),
      ),
      body: BlocProvider(
        create: (context) => DataPlanBloc(),
        child: BlocConsumer<DataPlanBloc, DataPlanState>(
          listener: (context, state) {
            // state.whenOrNull(
            //   success: () {
            //     context.goNamed(RouteNames.dataSuccess);
            //   },
            //   failed: (e) {
            //     showCustomSnackbar(context, e);
            //   },
            // );
          },
          builder: (context, state) {
            state.whenOrNull(
              loading: () => const Center(
                child: CircularProgressIndicator(),
              ),
            );
            return ListView(
              padding: const EdgeInsets.symmetric(
                horizontal: 24,
              ),
              children: [
                const SizedBox(
                  height: 30,
                ),
                Text(
                  'Cari',
                  style: blackTextStyle.copyWith(
                    fontSize: 16,
                    fontWeight: semiBold,
                  ),
                ),
                const SizedBox(
                  height: 14,
                ),
                CustomFormField(
                  title: '',
                  isShowTitle: false,
                  controller: phoneController,
                  onChanged: (val) => setState(() {}),
                ),
                const SizedBox(
                  height: 40,
                ),
                Text(
                  'Pilih Voucher',
                  style: blackTextStyle.copyWith(
                    fontSize: 16,
                    fontWeight: semiBold,
                  ),
                ),
                const SizedBox(
                  height: 14,
                ),
                // Wrap(
                //   spacing: 17,
                //   runSpacing: 17,
                //   alignment: WrapAlignment.center,
                //   children: widget.dataProvider.dataPlans!
                //       .map(
                //         (dataPlan) => GestureDetector(
                //           onTap: () {
                //             setState(() {
                //               selectedDataPlan = dataPlan;
                //             });
                //           },
                //           child: DataPackageItem(
                //             dataPlan: dataPlan,
                //             isSelected: dataPlan.id == selectedDataPlan?.id,
                //           ),
                //         ),
                //       )
                //       .toList(),
                // ),
                GestureDetector(
                  onTap: () {
                    setState(() {
                      selectedDataPlan = 'voucher1';
                    });
                  },
                  child: VoucherItem(
                    title: 'Voucher 1',
                    description: 'Voucher diamond 2000 ML',
                    price: 50000,
                    isSelected: selectedDataPlan == 'voucher1',
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                GestureDetector(
                  onTap: () {
                    setState(() {
                      selectedDataPlan = 'voucher2';
                    });
                  },
                  child: VoucherItem(
                    title: 'Voucher 2',
                    description: 'Voucher diamond 3000 ML',
                    price: 65000,
                    isSelected: selectedDataPlan == 'voucher2',
                  ),
                ),
                const SizedBox(
                  height: 85,
                ),
                if (selectedDataPlan != null)
                  CustomFilledButton(
                    title: 'Continue',
                    onPressed: () async {
                      context.goNamed(RouteNames.voucherDetail);
                      // if (await context.pushNamed(RouteNames.checkPin) ==
                      //     true) {
                      //   if (context.mounted) {
                      //     final authState = context.read<AuthBloc>().state;
                      //     String pin = '';

                      //     if (authState is AuthSuccess) {
                      //     }
                      //   }
                      // }
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
