import 'package:json_annotation/json_annotation.dart';
import 'package:wear_ongoing_activity/src/convert.dart';
import 'package:wear_ongoing_activity/wear_ongoing_activity.dart';

/// Base class for timer or stopwatch parts
abstract class TimerOrStopwatchPart extends StatusPart {
  /// timestamp of the time at which this stopwatch started running.
  @DateTimeMillisConverter()
  @JsonKey(name: 'timeZeroMillis')
  final DateTime timeZero;

  /// timestamp of the time when this stopwatch was paused.
  @DateTimeMillisConverter()
  @JsonKey(name: 'pausedAtMillis')
  final DateTime? pausedAt;

  /// total duration of this stopwatch, useful to display as a progress bar or similar.
  @DurationMillisConverter()
  @JsonKey(name: 'totalDurationMillis')
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
