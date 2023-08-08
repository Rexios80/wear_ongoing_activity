import 'package:json_annotation/json_annotation.dart';
import 'package:wear_ongoing_activity/src/convert.dart';
import 'package:wear_ongoing_activity/src/model/status/status_part_type.dart';
import 'package:wear_ongoing_activity/src/model/status/timer_or_stopwatch_part.dart';

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
  Map<String, dynamic> toJson();
}

/// A text part
@JsonSerializable(createFactory: false)
class TextPart extends StatusPart {
  /// The text
  final String text;

  /// Constructor
  TextPart({
    super.type = StatusPartType.text,
    required super.name,
    required this.text,
  }) : assert(type == StatusPartType.text);

  /// To json
  @override
  Map<String, dynamic> toJson() => _$TextPartToJson(this);
}

/// A timer part
@JsonSerializable(createFactory: false)
class TimerPart extends TimerOrStopwatchPart {
  /// Constructor
  TimerPart({
    super.type = StatusPartType.timer,
    required super.name,
    required super.timeZero,
    super.pausedAt,
    super.totalDuration,
  }) : assert(type == StatusPartType.timer);

  /// To json
  @override
  Map<String, dynamic> toJson() => _$TimerPartToJson(this);
}

/// A stopwatch part
@JsonSerializable(createFactory: false)
class StopwatchPart extends TimerOrStopwatchPart {
  /// Constructor
  StopwatchPart({
    super.type = StatusPartType.stopwatch,
    required super.name,
    required super.timeZero,
    super.pausedAt,
    super.totalDuration,
  }) : assert(type == StatusPartType.stopwatch);

  /// To json
  @override
  Map<String, dynamic> toJson() => _$StopwatchPartToJson(this);
}
