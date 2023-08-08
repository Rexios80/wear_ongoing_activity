// GENERATED CODE - DO NOT MODIFY BY HAND

// ignore_for_file: require_trailing_commas

part of 'status_part.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Map<String, dynamic> _$TextPartToJson(TextPart instance) => <String, dynamic>{
      'type': _$StatusPartTypeEnumMap[instance.type]!,
      'name': instance.name,
      'text': instance.text,
    };

const _$StatusPartTypeEnumMap = {
  StatusPartType.text: 'text',
  StatusPartType.timer: 'timer',
  StatusPartType.stopwatch: 'stopwatch',
};

Map<String, dynamic> _$TimerPartToJson(TimerPart instance) => <String, dynamic>{
      'type': _$StatusPartTypeEnumMap[instance.type]!,
      'name': instance.name,
      'timeZeroMillis':
          const DateTimeMillisConverter().toJson(instance.timeZero),
      'pausedAtMillis': _$JsonConverterToJson<int, DateTime>(
          instance.pausedAt, const DateTimeMillisConverter().toJson),
      'totalDurationMillis': _$JsonConverterToJson<int, Duration>(
          instance.totalDuration, const DurationMillisConverter().toJson),
    };

Json? _$JsonConverterToJson<Json, Value>(
  Value? value,
  Json? Function(Value value) toJson,
) =>
    value == null ? null : toJson(value);

Map<String, dynamic> _$StopwatchPartToJson(StopwatchPart instance) =>
    <String, dynamic>{
      'type': _$StatusPartTypeEnumMap[instance.type]!,
      'name': instance.name,
      'timeZeroMillis':
          const DateTimeMillisConverter().toJson(instance.timeZero),
      'pausedAtMillis': _$JsonConverterToJson<int, DateTime>(
          instance.pausedAt, const DateTimeMillisConverter().toJson),
      'totalDurationMillis': _$JsonConverterToJson<int, Duration>(
          instance.totalDuration, const DurationMillisConverter().toJson),
    };
