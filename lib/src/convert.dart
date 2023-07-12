import 'package:json_annotation/json_annotation.dart';

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
