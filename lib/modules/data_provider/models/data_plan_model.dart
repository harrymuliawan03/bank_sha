import 'package:freezed_annotation/freezed_annotation.dart';

part 'data_plan_model.freezed.dart';
part 'data_plan_model.g.dart';

@freezed
class DataPlanModel with _$DataPlanModel {
  const factory DataPlanModel({
    int? id,
    String? name,
    int? price,
    int? operatorCardId,
  }) = _DataPlanModel;

  factory DataPlanModel.fromJson(Map<String, dynamic> json) =>
      _$DataPlanModelFromJson(json);
}




// class DataPlanModel {
//   final int? id;
//   final String? name;
//   final int? price;
//   final int? operatorCardId;

//   DataPlanModel({
//     this.id,
//     this.name,
//     this.price,
//     this.operatorCardId,
//   });

//   DataPlanModel copyWith({
//     int? id,
//     String? name,
//     int? price,
//     int? operatorCardId,
//   }) =>
//       DataPlanModel(
//         id: id ?? this.id,
//         name: name ?? this.name,
//         price: price ?? this.price,
//         operatorCardId: operatorCardId ?? this.operatorCardId,
//       );

//   factory DataPlanModel.fromJson(Map<String, dynamic> json) => DataPlanModel(
//         id: json["id"],
//         name: json["name"],
//         price: json["price"],
//         operatorCardId: json["operator_card_id"],
//       );

//   Map<String, dynamic> toJson() => {
//         "id": id,
//         "name": name,
//         "price": price,
//         "operator_card_id": operatorCardId,
//       };
// }
