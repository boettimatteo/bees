// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'apiary_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ApiaryResponse _$ApiaryResponseFromJson(Map<String, dynamic> json) =>
    ApiaryResponse(
      results: (json['results'] as List<dynamic>)
          .map((e) => Apiary.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$ApiaryResponseToJson(ApiaryResponse instance) =>
    <String, dynamic>{
      'results': instance.results,
    };
