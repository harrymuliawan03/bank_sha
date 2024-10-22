import 'package:bank_sha/blocs/auth/auth_bloc.dart';
import 'package:bank_sha/blocs/data_plan/data_plan_bloc.dart';
import 'package:bank_sha/configs/router/route_names.dart';
import 'package:bank_sha/models/user_model.dart';
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

class VoucherDetailPage extends StatefulWidget {
  const VoucherDetailPage({
    super.key,
  });

  @override
  State<VoucherDetailPage> createState() => VoucherDetailPageState();
}

class VoucherDetailPageState extends State<VoucherDetailPage> {
  final phoneController = TextEditingController(text: '');
  String? selectedDataPlan;
  UserModel user = UserModel();

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    phoneController.dispose();
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    final authState = context.read<AuthBloc>().state;
    if (authState is AuthSuccess) {
      user = authState.user;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Konfirmasi Pembayaran',
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
                  'Detail Pembelian Voucher',
                  style: blackTextStyle.copyWith(
                    fontSize: 16,
                    fontWeight: semiBold,
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(
                  height: 14,
                ),
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
                  height: 85,
                ),
                Text(
                  'Saldo anda: ${formatCurrency(user.balance!)}',
                  style: blackTextStyle.copyWith(
                    fontSize: 14,
                    fontWeight: semiBold,
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                CustomFilledButton(
                  title: 'Bayar',
                  onPressed: () async {
                    if (await context.pushNamed(RouteNames.checkPin) == true) {
                      if (context.mounted) {
                        context.goNamed(RouteNames.voucherSuccess);
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
