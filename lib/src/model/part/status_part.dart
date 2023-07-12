import 'package:json_annotation/json_annotation.dart';
import 'package:wear_ongoing_activity/src/convert.dart';
import 'package:wear_ongoing_activity/src/model/part/status_part_type.dart';
import 'package:wear_ongoing_activity/src/model/part/timer_or_stopwatch_part.dart';

part 'status_part.g.dart';

/// Base class for status parts
abstract class StatusPart {
  /// The type of this part
  final StatusPartType type;

  /// The name of this part
  final String name;

  /// Constructor
  StatusPart({required this.type, required this.name});

  /// To json
  Map<String, dynamic> toJson() => {'type': type.name};
}

/// A text part
@JsonSerializable()
class TextPart extends StatusPart {
  /// The text
  final String text;

  /// Constructor
  TextPart({required super.name, required this.text})
      : super(type: StatusPartType.text);

  /// From json
  factory TextPart.fromJson(Map<String, dynamic> json) =>
      _$TextPartFromJson(json);

  /// To json
  @override
  Map<String, dynamic> toJson() =>
      {...super.toJson(), ..._$TextPartToJson(this)};
}

/// A timer part
@JsonSerializable()
class TimerPart extends TimerOrStopwatchPart {
  /// Constructor
  TimerPart({
    required super.name,
    required super.timeZero,
    super.pausedAt,
    super.totalDuration,
  }) : super(type: StatusPartType.timer);

  /// From json
  factory TimerPart.fromJson(Map<String, dynamic> json) =>
      _$TimerPartFromJson(json);

  /// To json
  @override
  Map<String, dynamic> toJson() =>
      {...super.toJson(), ..._$TimerPartToJson(this)};
}

/// A stopwatch part
@JsonSerializable()
class StopwatchPart extends TimerOrStopwatchPart {
  /// Constructor
  StopwatchPart({
    required super.name,
    required super.timeZero,
    super.pausedAt,
    super.totalDuration,
  }) : super(type: StatusPartType.stopwatch);

  /// From json
  factory StopwatchPart.fromJson(Map<String, dynamic> json) =>
      _$StopwatchPartFromJson(json);

  /// To json
  @override
  Map<String, dynamic> toJson() =>
      {...super.toJson(), ..._$StopwatchPartToJson(this)};
}
