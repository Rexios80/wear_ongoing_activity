/// Notification categories
///
/// See https://developer.android.com/reference/androidx/core/app/NotificationCompat
/// for details
enum NotificationCategory {
  /// alarm or timer
  alarm('alarm'),

  /// incoming call (voice or video) or similar synchronous communication request
  call('call'),

  /// asynchronous bulk message (email)
  email('email'),

  /// error in background operation or authentication status
  error('err'),

  /// calendar event
  event('event'),

  /// temporarily sharing location
  locationSharing('location_sharing'),

  /// incoming direct message (SMS, instant message, etc.)
  message('msg'),

  /// missed call
  missedCall('missed_call'),

  /// map turn-by-turn navigation
  navigation('navigation'),

  /// progress of a long-running background operation
  progress('progress'),

  /// promotion or advertisement
  promo('promo'),

  /// a specific, timely recommendation for a single thing
  recommendation('recommendation'),

  /// user-scheduled reminder
  reminder('reminder'),

  /// indication of running background service
  service('service'),

  /// social network or sharing update
  social('social'),

  /// ongoing information about device or contextual status
  status('status'),

  /// running stopwatch
  stopwatch('stopwatch'),

  /// system or device status update
  system('sys'),

  /// media transport control for playback
  transport('transport'),

  /// tracking a user's workout
  workout('workout');

  /// Constructor
  const NotificationCategory(this.value);

  /// The string value
  final String value;
}
