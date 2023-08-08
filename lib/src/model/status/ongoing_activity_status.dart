import 'package:json_annotation/json_annotation.dart';
import 'package:wear_ongoing_activity/wear_ongoing_activity.dart';

part 'ongoing_activity_status.g.dart';

/// The status of the ongoing activity
@JsonSerializable(createFactory: false)
class OngoingActivityStatus {
  /// The templates for this ongoing activity
  final List<String> templates;

  /// The parts for this ongoing activity
  final List<StatusPart> parts;

  /// Constructor
  OngoingActivityStatus({this.templates = const [], this.parts = const []});

  /// To json
  Map<String, dynamic> toJson() => _$OngoingActivityStatusToJson(this);
}
