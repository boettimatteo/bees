import 'package:json_annotation/json_annotation.dart';

part 'apiary.g.dart';

@JsonSerializable()
class Apiary {
  final int id;
  final String name;
  @JsonKey(name: "thumbnail_apiary_list_url")
  final String? imageUrl;
  final Map<String, dynamic> weights;

  Apiary({
    required this.id,
    required this.name,
    required this.imageUrl,
    required this.weights,
  });

  factory Apiary.fromJson(Map<String, dynamic> json) => _$ApiaryFromJson(json);

  Map<String, dynamic> toJson() => _$ApiaryToJson(this);
}
