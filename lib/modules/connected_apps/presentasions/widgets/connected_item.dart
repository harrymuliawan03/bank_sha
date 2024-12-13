import 'package:bank_sha/shared/theme.dart';
import 'package:flutter/material.dart';

class ConnectedItem extends StatelessWidget {
  const ConnectedItem(
      {super.key, required this.onPressed, required this.title});
  final String title;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    String imageUrl = '';

    switch (title) {
      case 'Google':
        imageUrl = 'assets/ic_google.png';
        break;
      case 'Tokopedia':
        imageUrl = 'assets/ic_tokopedia.png';
        break;
      case 'Grab':
        imageUrl = 'assets/ic_grab.png';
        break;
      case 'Blibli':
        imageUrl = 'assets/ic_blibli.png';
        break;
      case 'Facebook':
        imageUrl = 'assets/ic_facebook.png';
        break;
      case 'Lazada':
        imageUrl = 'assets/ic_lazada.png';
        break;
      case 'Tiket Com':
        imageUrl = 'assets/ic_tiket_com.png';
        break;
      default:
        imageUrl = 'assets/ic_google.png';
    }

    return Container(
      width: double.infinity,
      height: 70,
      padding: const EdgeInsets.symmetric(
        horizontal: 16,
      ),
      margin: const EdgeInsets.only(bottom: 10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(18),
        color: Colors.white,
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            width: 42,
            height: 42,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage(
                  imageUrl,
                ),
              ),
            ),
          ),
          const SizedBox(
            width: 16,
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  title,
                  style: blackTextStyle.copyWith(
                    fontSize: 16,
                    fontWeight: bold,
                  ),
                ),
                Text(
                  '1 akun terhubung',
                  style: greyTextStyle.copyWith(
                    fontSize: 12,
                    fontWeight: bold,
                  ),
                ),
              ],
            ),
          ),
          ElevatedButton(
            onPressed: onPressed,
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color.fromARGB(255, 227, 217, 234),
              padding: EdgeInsets.zero,
              fixedSize: const Size(
                90,
                10,
              ),
            ),
            child: Text(
              'Putuskan',
              style: blackTextStyle.copyWith(
                fontSize: 12,
                color: kPurpleColor,
                fontWeight: bold,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
