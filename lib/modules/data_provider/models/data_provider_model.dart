import 'dart:convert';

import 'package:bank_sha/modules/data_provider/models/data_plan_model.dart';

DataProviderModel dataProviderModelFromJson(String str) =>
    DataProviderModel.fromJson(json.decode(str));

class DataProviderModel {
  final int? id;
  final String? name;
  final String? status;
  final String? thumbnail;
  final List<DataPlanModel>? dataPlans;

  DataProviderModel({
    this.id,
    this.name,
    this.status,
    this.thumbnail,
    this.dataPlans,
  });

  DataProviderModel copyWith({
    int? id,
    String? name,
    String? status,
    String? thumbnail,
    List<DataPlanModel>? dataPlans,
  }) =>
      DataProviderModel(
        id: id ?? this.id,
        name: name ?? this.name,
        status: status ?? this.status,
        thumbnail: thumbnail ?? this.thumbnail,
        dataPlans: dataPlans ?? this.dataPlans,
      );

  factory DataProviderModel.fromJson(Map<String, dynamic> json) =>
      DataProviderModel(
        id: json["id"],
        name: json["name"],
        status: json["status"],
        thumbnail: json["thumbnail"],
        dataPlans: List<DataPlanModel>.from(
            json["data_plans"].map((x) => DataPlanModel.fromJson(x))),
      );
}
