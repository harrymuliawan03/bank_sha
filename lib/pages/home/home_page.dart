import 'package:bank_sha/configs/router/route_names.dart';
import 'package:bank_sha/modules/home/presentasions/home_content.dart';
import 'package:bank_sha/shared/helpers.dart';
import 'package:bank_sha/shared/theme.dart';
import 'package:bank_sha/modules/home/presentasions/widgets/home_latest_transaction_item.dart';
import 'package:bank_sha/modules/home/presentasions/widgets/home_service_item.dart';
import 'package:bank_sha/modules/home/presentasions/widgets/home_tips_item.dart';
import 'package:bank_sha/modules/home/presentasions/widgets/home_user_item.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return const HomeContent();
  }
}
