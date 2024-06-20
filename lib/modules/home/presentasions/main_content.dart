import 'package:bank_sha/configs/router/route_names.dart';
import 'package:bank_sha/modules/home/presentasions/home_content.dart';
import 'package:bank_sha/pages/history/history_page.dart';
import 'package:bank_sha/pages/notification/notification_page.dart';
import 'package:bank_sha/pages/reward/reward_page.dart';
import 'package:bank_sha/shared/theme.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:permission_handler/permission_handler.dart';

class MainContent extends StatefulWidget {
  const MainContent({super.key});

  @override
  State<MainContent> createState() => _MainContentState();
}

class _MainContentState extends State<MainContent> {
  int indexBar = 0;
  String titleAppbar = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomAppBar(
        color: kWhiteColor,
        shape: const CircularNotchedRectangle(),
        clipBehavior: Clip.antiAlias,
        notchMargin: 6,
        elevation: 0,
        child: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          backgroundColor: kWhiteColor,
          elevation: 0,
          selectedItemColor: kBlueColor,
          unselectedItemColor: kBlackColor,
          showSelectedLabels: true,
          showUnselectedLabels: true,
          selectedLabelStyle: blueTextStyle.copyWith(
            fontSize: 10,
            fontWeight: medium,
          ),
          unselectedLabelStyle: blackTextStyle.copyWith(
            fontSize: 10,
            fontWeight: medium,
          ),
          currentIndex: indexBar,
          onTap: (value) {
            setState(() {
              if (value == 1) {
                titleAppbar = 'History';
              }
              if (value == 2) {
                titleAppbar = 'Notification';
              }
              if (value == 3) {
                titleAppbar = 'Reward';
              }
              indexBar = value;
            });
          },
          items: [
            BottomNavigationBarItem(
              icon: Image.asset(
                'assets/ic_overview.png',
                width: 20,
                color: indexBar == 0 ? kBlueColor : null,
              ),
              label: 'Overview',
            ),
            BottomNavigationBarItem(
              icon: Image.asset(
                'assets/ic_history.png',
                width: 20,
                color: indexBar == 1 ? kBlueColor : null,
              ),
              label: 'History',
            ),
            BottomNavigationBarItem(
              icon: Image.asset(
                'assets/ic_notification.png',
                width: 20,
                color: indexBar == 2 ? kBlueColor : null,
              ),
              label: 'Notification',
            ),
            BottomNavigationBarItem(
              icon: Image.asset(
                'assets/ic_reward.png',
                width: 20,
                color: indexBar == 3 ? kBlueColor : null,
              ),
              label: 'Reward',
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          await Permission.camera.request().then(
            (value) {
              if (value.isGranted) {
                context.goNamed(RouteNames.scan);
              } else {
                _showSettingsDialog(context);
              }
            },
          );
        },
        backgroundColor: kPurpleColor,
        shape: const CircleBorder(),
        child: Image.asset(
          'assets/ic_plus_circle.png',
          width: 24,
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      appBar: indexBar == 0
          ? null
          : AppBar(
              iconTheme: IconThemeData(
                color: kBlackColor,
              ),
              title: Text(
                titleAppbar,
                style: whiteTextStyle.copyWith(fontWeight: bold),
              ),
              backgroundColor: kPurpleColor,
            ),
      body: _getContentForIndex(indexBar),
    );
  }

  Widget _getContentForIndex(int index) {
    switch (index) {
      case 0:
        return const HomeContent();
      case 1:
        return const HistoryPage();
      case 2:
        return const NotificationPage();
      default:
        return const RewardPage(); // Default case
    }
  }
}

void _showSettingsDialog(BuildContext context) {
  showDialog(
    context: context,
    builder: (context) => AlertDialog(
      title: Text('Camera Permission'),
      content: Text(
          'Camera permission is permanently denied. Please go to settings to enable it.'),
      actions: [
        TextButton(
          onPressed: () async {
            Navigator.of(context).pop();
            await openAppSettings();
          },
          child: Text('Open Settings'),
        ),
        TextButton(
          onPressed: () => Navigator.of(context).pop(),
          child: Text('Cancel'),
        ),
      ],
    ),
  );
}
