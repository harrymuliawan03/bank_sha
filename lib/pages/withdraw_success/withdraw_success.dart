import 'package:bank_sha/configs/router/route_names.dart';
import 'package:bank_sha/shared/theme.dart';
import 'package:bank_sha/shared/widgets/button_widget.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class WithdrawSuccessPage extends StatelessWidget {
  const WithdrawSuccessPage({super.key});

  @override
  Widget build(BuildContext context) {
    String getTimePlus30Minutes() {
      // Add 30 minutes to the current time
      DateTime timePlus30Minutes = DateTime.now().add(Duration(minutes: 30));

      // Format the time (HH:mm)
      String formattedTime =
          "${timePlus30Minutes.hour.toString().padLeft(2, '0')}:${timePlus30Minutes.minute.toString().padLeft(2, '0')} WIB";

      return formattedTime;
    }

    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Penarikan Berhasil',
              style: blackTextStyle.copyWith(
                fontSize: 20,
                fontWeight: semiBold,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(
              height: 26,
            ),
            Text(
              'Gunakan kode ini untuk menarik uang anda pada outlet Indomaret terdekat.',
              style: greyTextStyle.copyWith(
                fontSize: 16,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(
              height: 26,
            ),
            Container(
              width: 200,
              height: 80,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(18),
                  // color: kPurpleColor,
                  border: Border.all(
                    color: kPurpleColor,
                  )),
              child: Center(
                child: Text(
                  '111-222-3333',
                  style: whiteTextStyle.copyWith(
                    color: kPurpleColor,
                    fontSize: 20,
                    fontWeight: bold,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Text(
              'Kode berlaku sampai ${getTimePlus30Minutes()}',
              style: blackTextStyle.copyWith(
                fontSize: 14,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(
              height: 90,
            ),
            CustomFilledButton(
              width: 183,
              title: 'Back to Home',
              onPressed: () {
                context.goNamed(RouteNames.home);
              },
            ),
          ],
        ),
      ),
    );
  }
}
