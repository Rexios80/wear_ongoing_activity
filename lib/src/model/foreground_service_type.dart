/// The available foreground service types
///
/// See https://developer.android.com/reference/android/content/pm/ServiceInfo
/// for required permissions and other details
enum ForegroundServiceType {
  /// A special value indicates to use all types set in manifest file
  manifest(-1),

  /// The default foreground service type if not been set in manifest file
  @Deprecated('This constant was deprecated in API level 34. Do not use.')
  none(0),

  /// Data(photo, file, account) upload/download, backup/restore, import/export, fetch, transfer over network between device and cloud
  dataSync(1),

  /// Music, video, news or other media playback
  mediaPlayback(2),

  /// Ongoing operations related to phone calls, video conferencing, or similar interactive communication
  phoneCall(4),

  /// GPS, map, navigation location update
  location(8),

  /// Auto, bluetooth, TV or other devices connection, monitoring and interaction
  connectedDevice(16),

  /// Use for [MediaProjection](https://developer.android.com/reference/android/media/projection/MediaProjection)
  mediaProjection(32),

  /// Use the camera device or record video
  camera(64),

  /// Use the microphone device or record audio
  microphone(128),

  /// Health, wellness and fitness
  ///
  /// Added in SDK 34
  health(256),

  /// Messaging use cases which host local server to relay messages across devices
  ///
  /// Added in SDK 34
  remoteMessaging(512),

  /// See https://developer.android.com/reference/android/content/pm/ServiceInfo#FOREGROUND_SERVICE_TYPE_SYSTEM_EXEMPTED
  ///
  /// Added in SDK 34
  systemExempted(1024),

  /// See https://developer.android.com/reference/android/content/pm/ServiceInfo#FOREGROUND_SERVICE_TYPE_SHORT_SERVICE
  ///
  /// Added in SDK 34
  shortService(2048),

  /// See https://developer.android.com/reference/android/content/pm/ServiceInfo#FOREGROUND_SERVICE_TYPE_SPECIAL_USE
  ///
  /// Added in SDK 34
  specialUse(1073741824);

  /// Constructor
  const ForegroundServiceType(this.value);

  /// The integer value
  final int value;
}
