import 'package:bank_sha/modules/connected_apps/presentasions/connected_apps_content.dart';
import 'package:flutter/material.dart';

class ConnectedAppsPage extends StatefulWidget {
  const ConnectedAppsPage({super.key});

  @override
  State<ConnectedAppsPage> createState() => ConnectedAppsPageState();
}

class ConnectedAppsPageState extends State<ConnectedAppsPage> {
  @override
  Widget build(BuildContext context) {
    return const ConnectedAppsContent();
  }
}
