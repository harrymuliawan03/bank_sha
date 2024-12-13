import 'package:bank_sha/modules/connected_apps/presentasions/widgets/connected_item.dart';
import 'package:bank_sha/modules/connected_apps/services/connected_apps_services.dart';
import 'package:flutter/material.dart';

class ConnectedAppsContent extends StatefulWidget {
  const ConnectedAppsContent({super.key});
  @override
  State<ConnectedAppsContent> createState() => ConnectedAppsContentState();
}

class ConnectedAppsContentState extends State<ConnectedAppsContent> {
  List<dynamic> connectedApps = []; // Store connected apps data
  bool isLoading = true; // Loading state

  @override
  void initState() {
    super.initState();
    _fetchConnectedApps();
  }

  Future<void> _fetchConnectedApps() async {
    try {
      final res = await ConnectedAppsServices().getConnectedApps(1982);
      print(res);
      if (res == null) {
        setState(() {
          isLoading = false;
          connectedApps = [];
        });
        return;
      }
      setState(() {
        connectedApps = res;
        isLoading = false;
      });
    } catch (e) {
      print('Error fetching connected apps: $e');
      setState(() {
        isLoading = false; // Stop loading if an error occurs
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Connected Apps',
        ),
      ),
      backgroundColor: const Color.fromARGB(255, 222, 222, 222),
      body: ListView.builder(
          padding: const EdgeInsets.symmetric(
            horizontal: 24,
            vertical: 10,
          ),
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: connectedApps.length,
          itemBuilder: (context, index) {
            if (isLoading) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
            return ConnectedItem(
              title: connectedApps[index]['app_name'],
              onPressed: () {
                showDialog(
                  context: context,
                  builder: (context) => AlertDialog(
                    title: const Text(
                      'Disconnect Google',
                    ),
                    content: const Text(
                      'Are you sure you want to disconnect Google?',
                    ),
                    actions: [
                      TextButton(
                        onPressed: () => Navigator.pop(context),
                        child: const Text('Cancel'),
                      ),
                      TextButton(
                        onPressed: () async {
                          await ConnectedAppsServices().deleteConnectedApps(
                            connectedApps[index]['id'],
                          );
                          _fetchConnectedApps();
                          Navigator.pop(context);
                        },
                        child: const Text('Disconnect'),
                      ),
                    ],
                  ),
                );
              },
            );
          }),
    );
  }
}
