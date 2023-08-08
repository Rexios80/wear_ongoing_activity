package dev.rexios.wear_ongoing_activity

import android.annotation.SuppressLint
import android.app.NotificationChannel
import android.app.NotificationManager
import android.app.PendingIntent
import android.content.ComponentName
import android.content.Context
import android.content.Intent
import android.content.ServiceConnection
import android.os.Binder
import android.os.IBinder
import android.os.SystemClock
import androidx.core.app.NotificationCompat
import androidx.lifecycle.LifecycleService
import androidx.wear.ongoing.OngoingActivity
import androidx.wear.ongoing.Status
import io.flutter.embedding.engine.plugins.FlutterPlugin
import io.flutter.plugin.common.MethodCall
import io.flutter.plugin.common.MethodChannel
import io.flutter.plugin.common.MethodChannel.MethodCallHandler
import io.flutter.plugin.common.MethodChannel.Result

class WearOngoingActivityPlugin : FlutterPlugin, MethodCallHandler {
    private lateinit var channel: MethodChannel

    private var ongoingActivityService: OngoingActivityService? = null
    private val ongoingActivityServiceConnection = object : ServiceConnection {
        override fun onServiceConnected(name: ComponentName, service: IBinder) {
            val binder = service as OngoingActivityService.LocalBinder
            ongoingActivityService = binder.ongoingActivityService
        }

        override fun onServiceDisconnected(name: ComponentName) {
            ongoingActivityService = null
        }
    }

    override fun onAttachedToEngine(flutterPluginBinding: FlutterPlugin.FlutterPluginBinding) {
        channel = MethodChannel(flutterPluginBinding.binaryMessenger, "wear_ongoing_activity")
        channel.setMethodCallHandler(this)

        val context = flutterPluginBinding.applicationContext
        val serviceIntent = Intent(context, OngoingActivityService::class.java)
        context.bindService(
            serviceIntent, ongoingActivityServiceConnection, Context.BIND_AUTO_CREATE
        )
    }

    override fun onDetachedFromEngine(binding: FlutterPlugin.FlutterPluginBinding) {
        channel.setMethodCallHandler(null)
    }

    @Suppress("UNCHECKED_CAST")
    override fun onMethodCall(call: MethodCall, result: Result) {
        when (call.method) {
            "start" -> ongoingActivityService!!.start(call.arguments as Map<String, Any>)
            "update" -> ongoingActivityService!!.update(call.arguments as Map<String, Any>)
            "stop" -> ongoingActivityService!!.stop()
            else -> return result.notImplemented()
        }

        result.success(null)
    }
}

class OngoingActivityService : LifecycleService() {
    private val localBinder = LocalBinder()

    private lateinit var notificationManager: NotificationManager

    inner class LocalBinder : Binder() {
        internal val ongoingActivityService: OngoingActivityService
            get() = this@OngoingActivityService
    }

    override fun onCreate() {
        super.onCreate()

        notificationManager = getSystemService(Context.NOTIFICATION_SERVICE) as NotificationManager
    }

    override fun onBind(intent: Intent): IBinder {
        super.onBind(intent)
        return localBinder
    }

    @Suppress("UNCHECKED_CAST")
    private fun createStatus(arguments: Map<String, Any>): Status {
        val templates = arguments["templates"] as List<String>
        val parts = arguments["parts"] as List<Map<String, Any>>

        return Status.Builder().apply {
            for (template in templates) {
                addTemplate(template)
            }
            for (part in parts) {
                val type = part["type"]
                val name = part["name"] as String
                val statusPart = when (type) {
                    "text" -> Status.TextPart(part["text"] as String)
                    "timer", "stopwatch" -> {
                        val bootMillis = System.currentTimeMillis() - SystemClock.elapsedRealtime()

                        val timeZeroMillis = part["timeZeroMillis"] as Long - bootMillis
                        val pausedAtMillis =
                            (part["pausedAtMillis"] as Long?)?.minus(bootMillis) ?: -1
                        val totalDurationMillis =
                            (part["totalDurationMillis"] as Long?)?.minus(bootMillis) ?: -1

                        when (type) {

                            "timer" -> Status.TimerPart(
                                timeZeroMillis, pausedAtMillis, totalDurationMillis
                            )

                            "stopwatch" -> Status.StopwatchPart(
                                timeZeroMillis, pausedAtMillis, totalDurationMillis
                            )

                            else -> throw IllegalArgumentException("Unknown type: $type")
                        }
                    }

                    else -> throw IllegalArgumentException("Unknown type: $type")
                }

                addPart(name, statusPart)
            }
        }.build()
    }

    @SuppressLint("DiscouragedApi")
    fun start(arguments: Map<String, Any>) {
        val channelId = arguments["channelId"] as String
        val channelName = arguments["channelName"] as String
        val channel = NotificationChannel(
            channelId, channelName, NotificationManager.IMPORTANCE_DEFAULT
        )
        notificationManager.createNotificationChannel(channel)

        val notificationId = arguments["notificationId"] as Int
        val category = arguments["category"] as String
        val smallIconString = arguments["smallIcon"] as String

        val notificationBuilder = NotificationCompat.Builder(this, channelId)
            .setSmallIcon(
                applicationContext.resources.getIdentifier(
                    smallIconString, "drawable", applicationContext.packageName
                )
            ).setCategory(category).setOngoing(true)

        val ongoingActivityStatus = createStatus(arguments)

        val staticIconString = arguments["staticIcon"] as String
        val animatedIconString = arguments["animatedIcon"] as String?

        OngoingActivity.Builder(
            this, notificationId, notificationBuilder
        ).setStaticIcon(
            applicationContext.resources.getIdentifier(
                staticIconString, "drawable", applicationContext.packageName
            )
        ).apply {
            if (animatedIconString != null) {
                setAnimatedIcon(
                    applicationContext.resources.getIdentifier(
                        animatedIconString, "drawable", applicationContext.packageName
                    )
                )
            }
        }.setTouchIntent(
            // Open this app
            PendingIntent.getActivity(
                this,
                0,
                applicationContext.packageManager.getLaunchIntentForPackage(applicationContext.packageName),
                PendingIntent.FLAG_IMMUTABLE
            )
        ).setStatus(ongoingActivityStatus).build().apply(this)

        val foregroundServiceType = arguments["foregroundServiceType"] as Int
        startForeground(notificationId, notificationBuilder.build(), foregroundServiceType)
    }

    fun update(arguments: Map<String, Any>) {
        OngoingActivity.recoverOngoingActivity(this)!!.update(this, createStatus(arguments))
    }

    fun stop() {
        stopForeground(STOP_FOREGROUND_REMOVE)
    }
}