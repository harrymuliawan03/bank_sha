import 'package:bank_sha/configs/router/route_names.dart';
import 'package:bank_sha/modules/home/presentasions/widgets/home_service_item.dart';
import 'package:bank_sha/shared/theme.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class HomePopupMore extends StatelessWidget {
  const HomePopupMore({super.key});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Colors.transparent,
      insetPadding: EdgeInsets.zero,
      alignment: Alignment.bottomCenter,
      content: Container(
        height: 326,
        width: MediaQuery.of(context).size.width,
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(40),
          color: kLightBackgroundColor,
        ),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                'Do More With Us',
                style: blackTextStyle.copyWith(
                  fontSize: 16,
                  fontWeight: semiBold,
                ),
              ),
              const SizedBox(
                height: 13,
              ),
              Wrap(
                spacing: 29,
                runSpacing: 25,
                children: [
                  HomeServiceItem(
                    iconUrl: 'assets/ic_product_data.png',
                    title: 'Data',
                    onTap: () {
                      context.goNamed(RouteNames.dataProvider);
                    },
                  ),
                  HomeServiceItem(
                    iconUrl: 'assets/ic_product_water.png',
                    title: 'Water',
                    onTap: () {},
                  ),
                  HomeServiceItem(
                    iconUrl: 'assets/ic_product_stream.png',
                    title: 'Stream',
                    onTap: () {},
                  ),
                  HomeServiceItem(
                    iconUrl: 'assets/ic_product_movie.png',
                    title: 'Movie',
                    onTap: () {},
                  ),
                  HomeServiceItem(
                    iconUrl: 'assets/ic_product_food.png',
                    title: 'Food',
                    onTap: () {},
                  ),
                  HomeServiceItem(
                    iconUrl: 'assets/ic_product_travel.png',
                    title: 'Travel',
                    onTap: () {},
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
