import 'package:json_annotation/json_annotation.dart';

/// Status part types
enum StatusPartType {
  /// Text part
  text,

  /// Timer part
  timer,

  /// Stopwatch part
  stopwatch,
}

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

/// Base class for timer or stopwatch parts
abstract class TimerOrStopwatchPart extends StatusPart {
  /// timestamp of the time at which this stopwatch started running.
  @DateTimeMillisConverter()
  final DateTime timeZero;

  /// timestamp of the time when this stopwatch was paused.
  @DateTimeMillisConverter()
  final DateTime? pausedAt;

  /// total duration of this stopwatch, useful to display as a progress bar or similar.
  @DurationMillisConverter()
  final Duration? totalDuration;

  /// Constructor
  TimerOrStopwatchPart({
    required super.type,
    required super.name,
    required this.timeZero,
    this.pausedAt,
    this.totalDuration,
  });
}

/// Convert between DateTime and millis
class DateTimeMillisConverter extends JsonConverter<DateTime, int> {
  /// Constructor
  const DateTimeMillisConverter();

  @override
  DateTime fromJson(int json) => DateTime.fromMillisecondsSinceEpoch(json);

  @override
  int toJson(DateTime object) => object.millisecondsSinceEpoch;
}

/// Convert between Duration and millis
class DurationMillisConverter extends JsonConverter<Duration, int> {
  /// Constructor
  const DurationMillisConverter();

  @override
  Duration fromJson(int json) => Duration(milliseconds: json);

  @override
  int toJson(Duration object) => object.inMilliseconds;
}
