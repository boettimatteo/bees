import 'package:bees/models/apiary.dart';
import 'package:json_annotation/json_annotation.dart';

part 'apiary_response.g.dart';

@JsonSerializable()
class ApiaryResponse {
  final List<Apiary> results;

  ApiaryResponse({
    required this.results,
  });

  factory ApiaryResponse.fromJson(Map<String, dynamic> json) =>
      _$ApiaryResponseFromJson(json);

  Map<String, dynamic> toJson() => _$ApiaryResponseToJson(this);
}
