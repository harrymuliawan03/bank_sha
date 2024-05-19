import 'package:bank_sha/modules/data_provider/models/data_provider_model.dart';
import 'package:bank_sha/modules/data_provider/presentasions/data_package_content.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class DataPackagePage extends StatelessWidget {
  final DataProviderModel dataProvider;
  const DataPackagePage({super.key, required this.dataProvider});

  @override
  Widget build(BuildContext context) {
    return DataPackageContent(dataProvider: dataProvider);
  }
}
