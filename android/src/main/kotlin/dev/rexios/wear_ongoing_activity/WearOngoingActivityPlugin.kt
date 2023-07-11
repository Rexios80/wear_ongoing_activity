package dev.rexios.wear_ongoing_activity

import android.app.NotificationManager
import android.app.PendingIntent
import android.content.Context
import androidx.core.app.NotificationCompat
import androidx.wear.ongoing.OngoingActivity
import androidx.wear.ongoing.Status
import io.flutter.embedding.engine.plugins.FlutterPlugin
import io.flutter.plugin.common.MethodCall
import io.flutter.plugin.common.MethodChannel
import io.flutter.plugin.common.MethodChannel.MethodCallHandler
import io.flutter.plugin.common.MethodChannel.Result

class WearOngoingActivityPlugin : FlutterPlugin, MethodCallHandler {
    private lateinit var context: Context
    private lateinit var channel: MethodChannel

    override fun onAttachedToEngine(flutterPluginBinding: FlutterPlugin.FlutterPluginBinding) {
        context = flutterPluginBinding.applicationContext
        channel = MethodChannel(flutterPluginBinding.binaryMessenger, "wear_ongoing_activity")
        channel.setMethodCallHandler(this)
    }

    override fun onDetachedFromEngine(binding: FlutterPlugin.FlutterPluginBinding) {
        channel.setMethodCallHandler(null)
    }

    @Suppress("UNCHECKED_CAST")
    override fun onMethodCall(call: MethodCall, result: Result) {
        when (call.method) {
            "start" -> start(call.arguments as Map<String, Any>)
            "update" -> update(call.arguments as Map<String, Any>)
            "pause" -> pause()
            "resume" -> resume()
            "stop" -> stop()
            else -> result.notImplemented()
        }
    }

    private fun start(arguments: Map<String, Any>) {
        val notificationId = arguments["notificationId"] as Int
        val channelId = arguments["channelId"] as String
        val smallIconString = arguments["smallIcon"] as String?

        val notificationBuilder = NotificationCompat.Builder(context, channelId)
            // TODO: Anything else?
            .apply {
                if (smallIconString != null) {
                    setSmallIcon(
                        context.resources.getIdentifier(
                            smallIconString, "drawable", context.packageName
                        )
                    )
                }
            }.setOngoing(true)

        val template = arguments["template"] as String?

        val ongoingActivityStatus = Status.Builder()
            // Sets the text used across various surfaces.
            .addTemplate(mainText).build()

        val animatedIconString = arguments["animatedIcon"] as String?
        val staticIconString = arguments["staticIcon"] as String?

        OngoingActivity.Builder(
            context, notificationId, notificationBuilder
        ).apply {
            if (animatedIconString != null) {
                setAnimatedIcon(
                    context.resources.getIdentifier(
                        animatedIconString, "drawable", context.packageName
                    )
                )
            }
            if (staticIconString != null) {
                setStaticIcon(
                    context.resources.getIdentifier(
                        staticIconString, "drawable", context.packageName
                    )
                )
            }
        }.setTouchIntent(
            PendingIntent.getActivity(
                context,
                0,
                context.packageManager.getLaunchIntentForPackage(context.packageName),
                PendingIntent.FLAG_IMMUTABLE
            )
        ).setStatus(ongoingActivityStatus).build().apply(context)

        val notificationManager =
            context.getSystemService(Context.NOTIFICATION_SERVICE) as NotificationManager
        notificationManager.notify(notificationId, notificationBuilder.build())

    }

    private fun update(arguments: Map<String, Any>) {

    }

    private fun pause() {}

    private fun resume() {}

    private fun stop() {}
}
