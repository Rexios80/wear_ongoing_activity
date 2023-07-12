/// Notification categories
enum NotificationCategory {
  /// Call
  call,

  /// Navigation
  navigation,

  /// Transport
  transport,

  /// Alarm
  alarm,

  /// Workout
  workout,

  /// Location sharing
  locationSharing,

  /// Stopwatch
  stopwatch;

  /// To json
  String toJson() => switch (this) {
        locationSharing => 'location_sharing',
        _ => name,
      };
}
