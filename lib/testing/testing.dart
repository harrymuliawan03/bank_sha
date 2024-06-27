import 'package:bank_sha/testing/testing_case.dart';
import 'package:flutter/material.dart';

class MyWidget extends StatefulWidget {
  const MyWidget({super.key});

  @override
  State<MyWidget> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<MyWidget> {
  Future<void> getDataTesting() async {
    var res = await TestingUserCase.getUserByUsernameCase("Harry");
    print(res);
  }

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}
