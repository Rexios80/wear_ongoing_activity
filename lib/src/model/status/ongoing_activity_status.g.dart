// GENERATED CODE - DO NOT MODIFY BY HAND

// ignore_for_file: require_trailing_commas

part of 'ongoing_activity_status.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

OngoingActivityStatus _$OngoingActivityStatusFromJson(
        Map<String, dynamic> json) =>
    OngoingActivityStatus(
      templates: (json['templates'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const [],
      parts: (json['parts'] as List<dynamic>?)
              ?.map((e) => StatusPart.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
    );

Map<String, dynamic> _$OngoingActivityStatusToJson(
        OngoingActivityStatus instance) =>
    <String, dynamic>{
      'templates': instance.templates,
      'parts': instance.parts,
    };
