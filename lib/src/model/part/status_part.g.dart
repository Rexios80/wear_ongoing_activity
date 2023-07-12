// GENERATED CODE - DO NOT MODIFY BY HAND

// ignore_for_file: require_trailing_commas

part of 'status_part.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TextPart _$TextPartFromJson(Map<String, dynamic> json) => TextPart(
      name: json['name'] as String,
      text: json['text'] as String,
    );

Map<String, dynamic> _$TextPartToJson(TextPart instance) => <String, dynamic>{
      'name': instance.name,
      'text': instance.text,
    };

TimerPart _$TimerPartFromJson(Map<String, dynamic> json) => TimerPart(
      name: json['name'] as String,
      timeZero:
          const DateTimeMillisConverter().fromJson(json['timeZero'] as int),
      pausedAt: _$JsonConverterFromJson<int, DateTime>(
          json['pausedAt'], const DateTimeMillisConverter().fromJson),
      totalDuration: _$JsonConverterFromJson<int, Duration>(
          json['totalDuration'], const DurationMillisConverter().fromJson),
    );

Map<String, dynamic> _$TimerPartToJson(TimerPart instance) => <String, dynamic>{
      'name': instance.name,
      'timeZero': const DateTimeMillisConverter().toJson(instance.timeZero),
      'pausedAt': _$JsonConverterToJson<int, DateTime>(
          instance.pausedAt, const DateTimeMillisConverter().toJson),
      'totalDuration': _$JsonConverterToJson<int, Duration>(
          instance.totalDuration, const DurationMillisConverter().toJson),
    };

Value? _$JsonConverterFromJson<Json, Value>(
  Object? json,
  Value? Function(Json json) fromJson,
) =>
    json == null ? null : fromJson(json as Json);

Json? _$JsonConverterToJson<Json, Value>(
  Value? value,
  Json? Function(Value value) toJson,
) =>
    value == null ? null : toJson(value);

StopwatchPart _$StopwatchPartFromJson(Map<String, dynamic> json) =>
    StopwatchPart(
      name: json['name'] as String,
      timeZero:
          const DateTimeMillisConverter().fromJson(json['timeZero'] as int),
      pausedAt: _$JsonConverterFromJson<int, DateTime>(
          json['pausedAt'], const DateTimeMillisConverter().fromJson),
      totalDuration: _$JsonConverterFromJson<int, Duration>(
          json['totalDuration'], const DurationMillisConverter().fromJson),
    );

Map<String, dynamic> _$StopwatchPartToJson(StopwatchPart instance) =>
    <String, dynamic>{
      'name': instance.name,
      'timeZero': const DateTimeMillisConverter().toJson(instance.timeZero),
      'pausedAt': _$JsonConverterToJson<int, DateTime>(
          instance.pausedAt, const DateTimeMillisConverter().toJson),
      'totalDuration': _$JsonConverterToJson<int, Duration>(
          instance.totalDuration, const DurationMillisConverter().toJson),
    };
