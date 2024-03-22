import 'package:bank_sha/configs/router/route_names.dart';
import 'package:bank_sha/shared/theme.dart';
import 'package:bank_sha/ui/pages/data_package/widgets/package_item.dart';
import 'package:bank_sha/ui/widgets/button_widget.dart';
import 'package:bank_sha/ui/widgets/forms_widget.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class DataPackagePage extends StatefulWidget {
  // final OperatorCardModel operator;
  final String id;

  const DataPackagePage({
    super.key,
    required this.id,
    // required this.operator,
  });

  @override
  State<DataPackagePage> createState() => _DataPackagePageState();
}

class _DataPackagePageState extends State<DataPackagePage> {
  final phoneController = TextEditingController(text: '');
  // DataPlanModel? selectedDataPlan;

  @override
  Widget build(BuildContext context) {
    print(widget.id);
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Paket Data',
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
            children: [
              GestureDetector(
                onTap: () {
                  // setState(() {
                  //   selectedDataPlan = dataPlan;
                  // });
                },
                child: PackageItem(
                  // dataPlan: dataPlan,
                  // isSelected: dataPlan.id == selectedDataPlan?.id,
                  isSelected: true,
                ),
              ),
              GestureDetector(
                onTap: () {
                  // setState(() {
                  //   selectedDataPlan = dataPlan;
                  // });
                },
                child: PackageItem(
                  // dataPlan: dataPlan,
                  // isSelected: dataPlan.id == selectedDataPlan?.id,
                  isSelected: false,
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 85,
          ),
          // if (selectedDataPlan != null && phoneController.text.isNotEmpty)
          CustomFilledButton(
            title: 'Continue',
            onPressed: () async {
              if (await context.pushNamed(RouteNames.checkPin) == true) {
                if (context.mounted) {
                  context.goNamed(RouteNames.dataSuccess);
                }
              }
              // if (await Navigator.pushNamed(context, '/pin') == true) {
              //   final authState = context.read<AuthBloc>().state;
              //   String pin = '';
              //   if (authState is AuthSuccess) {
              //     pin = authState.data.pin!;
              //   }

              //   context.read<DataPlanFormBloc>().add(
              //         DataPlanFormPost(
              //           DataPlanFormModel(
              //             dataPlanId: selectedDataPlan!.id.toString(),
              //             phoneNumber: phoneController.text,
              //             pin: pin,
              //           ),
              //         ),
              //       );
              // }
            },
          ),
          const SizedBox(
            height: 57,
          ),
        ],
      ),
    );
  }
}
