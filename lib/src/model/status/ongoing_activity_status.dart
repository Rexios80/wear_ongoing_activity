import 'package:json_annotation/json_annotation.dart';
import 'package:wear_ongoing_activity/wear_ongoing_activity.dart';

part 'ongoing_activity_status.g.dart';

/// The status of the ongoing activity
@JsonSerializable(createFactory: false)
class OngoingActivityStatus {
  /// The templates for this ongoing activity
  ///
  /// Status [parts] can be substituted into these templates using hashtags.
  /// For example: `#type#: #time#` will substitute in the [parts] named
  /// `type` and `time`.
  final List<String> templates;

  /// The parts for this ongoing activity
  final List<StatusPart> parts;

  /// Constructor
  OngoingActivityStatus({required this.templates, required this.parts});

  /// To json
  Map<String, dynamic> toJson() => _$OngoingActivityStatusToJson(this);
}
