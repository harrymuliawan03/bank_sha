import 'package:bank_sha/configs/router/route_names.dart';
import 'package:bank_sha/shared/theme.dart';
import 'package:bank_sha/shared/widgets/button_widget.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class VoucherSuccessPage extends StatelessWidget {
  const VoucherSuccessPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Pembelian Berhasil',
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
              'Berikut kode voucher ML anda, silahkan masukan voucher ini kedalam akun anda',
              style: greyTextStyle.copyWith(
                fontSize: 16,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(
              height: 26,
            ),
            Container(
              width: 220,
              height: 90,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(18),
                gradient: const LinearGradient(
                  colors: [Color(0xFF00C6FF), Color(0xFF0072FF)],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
                border: Border.all(
                  color: Colors.white.withOpacity(0.5),
                  width: 2,
                ),
                boxShadow: [
                  BoxShadow(
                    color: Colors.blueAccent.withOpacity(0.5),
                    blurRadius: 10,
                    offset: const Offset(0, 4),
                  ),
                ],
              ),
              child: Center(
                child: Text(
                  '111-222-3333',
                  style: whiteTextStyle.copyWith(
                    color: Colors.white,
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    letterSpacing: 2.0,
                    shadows: [
                      Shadow(
                        blurRadius: 8.0,
                        color: Colors.black.withOpacity(0.5),
                        offset: const Offset(0, 4),
                      ),
                    ],
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
            const SizedBox(
              height: 50,
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
