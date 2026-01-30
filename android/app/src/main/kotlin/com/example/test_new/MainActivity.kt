package com.example.test_new

import io.flutter.embedding.android.FlutterActivity
import android.content.pm.PackageManager

import android.app.Activity
import android.content.ComponentName
import android.content.Intent
import android.net.Uri
import android.util.Log
import androidx.annotation.NonNull
import androidx.core.content.FileProvider
import com.example.test_new.arcore.activities.ArActivity
import com.google.ar.core.ArCoreApk
import com.webkul.magento.mlkit.activities.CameraSearchActivity
import io.flutter.embedding.android.FlutterFragmentActivity
import io.flutter.embedding.engine.FlutterEngine
import io.flutter.plugin.common.MethodChannel
import io.flutter.plugins.GeneratedPluginRegistrant
//import org.apache.commons.io.FilenameUtils
import java.io.File
import com.example.test_new.launcherAlias.LauncherAliasDefault
import com.example.test_new.launcherAlias.LauncherAliasFive
import com.example.test_new.launcherAlias.LauncherAliasFour
import com.example.test_new.launcherAlias.LauncherAliasOne
import com.example.test_new.launcherAlias.LauncherAliasThree
import com.example.test_new.launcherAlias.LauncherAliasTwo
import com.example.test_new.helper.AppSharedPref
//import org.apache.commons.io.FilenameUtils

class MainActivity: FlutterFragmentActivity() {
    private val CHANNEL = "com.webkul.magento_mobikul/channel"
    var methodChannelResult: MethodChannel.Result? = null

    @Override
    override fun configureFlutterEngine(flutterEngine: FlutterEngine) {
        super.configureFlutterEngine(flutterEngine)
        GeneratedPluginRegistrant.registerWith(flutterEngine)
        MethodChannel(flutterEngine.dartExecutor.binaryMessenger, CHANNEL).setMethodCallHandler { call, result ->
            try {
                methodChannelResult = result;
                Log.d("TEST_LOG", "MethodChannel")

                if (call.method.equals("fileviewer")) {
                    var path: String = call.arguments()!!
                    var file = File(path)
                    val extension = com.google.firebase.crashlytics.buildtools.reloc.org.apache.commons.io.FilenameUtils.getExtension(path)

                    val photoURI: Uri = FileProvider.getUriForFile(
                            this.applicationContext,
                            this.applicationContext.packageName.toString(),
                            file
                    )
                    val intent = Intent(Intent.ACTION_VIEW)
                    intent.setFlags(Intent.FLAG_ACTIVITY_NO_HISTORY)
                    intent.addFlags(Intent.FLAG_GRANT_READ_URI_PERMISSION)
                    intent.setDataAndType(photoURI, "application/" + extension)
                    if (intent.resolveActivity(getPackageManager()) != null) {
                        //if device have requested extension app then respective app will open
                        println("File extension app found in the device")
                        startActivity(intent);
                    }
                    else {
                        //if device don't have requested extension app then all app option will be visible.
                        println("File extension app Not found in the device")

                        intent.setDataAndType(photoURI, "*/*")
                        startActivity(intent);
                    }
                    result.success(true)

                }
                else if (call.method == "initialLink") {
                    val initialUrl = initialLink()
                    if (initialUrl != null) {
                        result.success(initialLink())
                    }
                    else {
                        result.error("UNAVAILABLE", "No deep link found", null)
                    }
                }
                else if (call.method == "imageSearch") {
                    startImageFinding()
                }
                else if (call.method == "textSearch") {
                    startTextFinding()
                }

                else if (call.method == "showAr") {
                    if (call.hasArgument("url")) {
                        Log.d("TEST_LOG", call.argument("url") ?: "No Name")
                    }
                    showArActivity(call.argument("name"), call.argument("url"))

                } else if (call.method == "dynamicLauncher") {
                    Log.d("TEST_LOG", "dynamicLauncher")
                    var path: String? = call.arguments<String?>()
                    checkLauncherType(path)
                    result.success("Success launcher")
                }
            } catch (e: Exception) {
                print(e)
            }
        }
    }

    override fun onActivityResult(requestCode: Int, resultCode: Int, data: Intent?) {
        super.onActivityResult(requestCode, resultCode, data)
        if (requestCode == 101 && resultCode == Activity.RESULT_OK) {
            methodChannelResult?.success(data?.getStringExtra(CameraSearchActivity.CAMERA_SEARCH_HELPER))
        }
    }

    fun initialLink(): String? {
        val uri = intent.data
        Log.d("Deep link url:::", uri.toString())
        return if (uri != null) {
            uri.toString();
        } else {
            null
        }
    }

    private fun startImageFinding() {
        val intent = Intent(this, CameraSearchActivity::class.java)
        intent.putExtra(
                CameraSearchActivity.CAMERA_SELECTED_MODEL,
                CameraSearchActivity.IMAGE_LABELING
        )
        startActivityForResult(intent, 101)
    }

    private fun startTextFinding() {
        val intent = Intent(this, CameraSearchActivity::class.java)
        intent.putExtra(
                CameraSearchActivity.CAMERA_SELECTED_MODEL,
                CameraSearchActivity.TEXT_RECOGNITION
        )
        startActivityForResult(intent, 101)
    }



    private fun showArActivity(name: String?, url: String?){
        val availability = ArCoreApk.getInstance().checkAvailability(this)
        if (availability.isSupported) {
            Log.d("TEST_LOG", "${name}----${url}")
            val intent = Intent(this, ArActivity::class.java)
            intent.putExtra("name", name)
            intent.putExtra("link", url)
            startActivity(intent)
            // methodChannelResult?.success("Supported ");
        } else {
            methodChannelResult?.error("401", "Your device does not support AR feature","");
        }
    }

    private fun checkLauncherType(launcherType: String?) {
        print("Called Launcher ===>")
        Log.d("TEST_LOG","TEST_LOG for Android")
        AppSharedPref.setLauncherIcon(this, launcherType ?: "0");
//        setIcon(AppSharedPref.getLauncherIcon(this).toString(), AppSharedPref.getCount(this))
    }

    private fun setIcon(targetIcon: String, index: Int) {
        try {
            when (targetIcon) {
                "0" -> {
                    // default launcher
                    packageManager.setComponentEnabledSetting(ComponentName(this@MainActivity, LauncherAliasDefault::class.java), PackageManager.COMPONENT_ENABLED_STATE_ENABLED, PackageManager.DONT_KILL_APP)
                    packageManager.setComponentEnabledSetting(ComponentName(this@MainActivity, LauncherAliasTwo::class.java), PackageManager.COMPONENT_ENABLED_STATE_DISABLED, PackageManager.DONT_KILL_APP)
                    packageManager.setComponentEnabledSetting(ComponentName(this@MainActivity, LauncherAliasTwo::class.java), PackageManager.COMPONENT_ENABLED_STATE_DISABLED, PackageManager.DONT_KILL_APP)
                    packageManager.setComponentEnabledSetting(ComponentName(this@MainActivity, LauncherAliasThree::class.java), PackageManager.COMPONENT_ENABLED_STATE_DISABLED, PackageManager.DONT_KILL_APP)
                    packageManager.setComponentEnabledSetting(ComponentName(this@MainActivity, LauncherAliasFour::class.java), PackageManager.COMPONENT_ENABLED_STATE_DISABLED, PackageManager.DONT_KILL_APP)
                    packageManager.setComponentEnabledSetting(ComponentName(this@MainActivity, LauncherAliasFive::class.java), PackageManager.COMPONENT_ENABLED_STATE_DISABLED, PackageManager.DONT_KILL_APP)
                }
                "1" -> {
                    packageManager.setComponentEnabledSetting(ComponentName(this@MainActivity, LauncherAliasOne::class.java), PackageManager.COMPONENT_ENABLED_STATE_ENABLED, PackageManager.DONT_KILL_APP)
                    packageManager.setComponentEnabledSetting(ComponentName(this@MainActivity, LauncherAliasTwo::class.java), PackageManager.COMPONENT_ENABLED_STATE_DISABLED, PackageManager.DONT_KILL_APP)
                    packageManager.setComponentEnabledSetting(ComponentName(this@MainActivity, LauncherAliasThree::class.java), PackageManager.COMPONENT_ENABLED_STATE_DISABLED, PackageManager.DONT_KILL_APP)
                    packageManager.setComponentEnabledSetting(ComponentName(this@MainActivity, LauncherAliasDefault::class.java), PackageManager.COMPONENT_ENABLED_STATE_DISABLED, PackageManager.DONT_KILL_APP)
                    packageManager.setComponentEnabledSetting(ComponentName(this@MainActivity, LauncherAliasFour::class.java), PackageManager.COMPONENT_ENABLED_STATE_DISABLED, PackageManager.DONT_KILL_APP)
                    packageManager.setComponentEnabledSetting(ComponentName(this@MainActivity, LauncherAliasFive::class.java), PackageManager.COMPONENT_ENABLED_STATE_DISABLED, PackageManager.DONT_KILL_APP)
                }
                "2" -> {
                    packageManager.setComponentEnabledSetting(ComponentName(this@MainActivity, LauncherAliasOne::class.java), PackageManager.COMPONENT_ENABLED_STATE_DISABLED, PackageManager.DONT_KILL_APP)
                    packageManager.setComponentEnabledSetting(ComponentName(this@MainActivity, LauncherAliasTwo::class.java), PackageManager.COMPONENT_ENABLED_STATE_ENABLED, PackageManager.DONT_KILL_APP)
                    packageManager.setComponentEnabledSetting(ComponentName(this@MainActivity, LauncherAliasThree::class.java), PackageManager.COMPONENT_ENABLED_STATE_DISABLED, PackageManager.DONT_KILL_APP)
                    packageManager.setComponentEnabledSetting(ComponentName(this@MainActivity, LauncherAliasDefault::class.java), PackageManager.COMPONENT_ENABLED_STATE_DISABLED, PackageManager.DONT_KILL_APP)
                    packageManager.setComponentEnabledSetting(ComponentName(this@MainActivity, LauncherAliasFour::class.java), PackageManager.COMPONENT_ENABLED_STATE_DISABLED, PackageManager.DONT_KILL_APP)
                    packageManager.setComponentEnabledSetting(ComponentName(this@MainActivity, LauncherAliasFive::class.java), PackageManager.COMPONENT_ENABLED_STATE_DISABLED, PackageManager.DONT_KILL_APP)
                }
                "3" -> {
                    packageManager.setComponentEnabledSetting(ComponentName(this@MainActivity, LauncherAliasOne::class.java), PackageManager.COMPONENT_ENABLED_STATE_DISABLED, PackageManager.DONT_KILL_APP)
                    packageManager.setComponentEnabledSetting(ComponentName(this@MainActivity, LauncherAliasTwo::class.java), PackageManager.COMPONENT_ENABLED_STATE_DISABLED, PackageManager.DONT_KILL_APP)
                    packageManager.setComponentEnabledSetting(ComponentName(this@MainActivity, LauncherAliasThree::class.java), PackageManager.COMPONENT_ENABLED_STATE_ENABLED, PackageManager.DONT_KILL_APP)
                    packageManager.setComponentEnabledSetting(ComponentName(this@MainActivity, LauncherAliasDefault::class.java), PackageManager.COMPONENT_ENABLED_STATE_DISABLED, PackageManager.DONT_KILL_APP)
                    packageManager.setComponentEnabledSetting(ComponentName(this@MainActivity, LauncherAliasFour::class.java), PackageManager.COMPONENT_ENABLED_STATE_DISABLED, PackageManager.DONT_KILL_APP)
                    packageManager.setComponentEnabledSetting(ComponentName(this@MainActivity, LauncherAliasFive::class.java), PackageManager.COMPONENT_ENABLED_STATE_DISABLED, PackageManager.DONT_KILL_APP)
                }
                "4" -> {
                    packageManager.setComponentEnabledSetting(ComponentName(this@MainActivity, LauncherAliasOne::class.java), PackageManager.COMPONENT_ENABLED_STATE_DISABLED, PackageManager.DONT_KILL_APP)
                    packageManager.setComponentEnabledSetting(ComponentName(this@MainActivity, LauncherAliasTwo::class.java), PackageManager.COMPONENT_ENABLED_STATE_DISABLED, PackageManager.DONT_KILL_APP)
                    packageManager.setComponentEnabledSetting(ComponentName(this@MainActivity, LauncherAliasThree::class.java), PackageManager.COMPONENT_ENABLED_STATE_DISABLED, PackageManager.DONT_KILL_APP)
                    packageManager.setComponentEnabledSetting(ComponentName(this@MainActivity, LauncherAliasDefault::class.java), PackageManager.COMPONENT_ENABLED_STATE_DISABLED, PackageManager.DONT_KILL_APP)
                    packageManager.setComponentEnabledSetting(ComponentName(this@MainActivity, LauncherAliasFour::class.java), PackageManager.COMPONENT_ENABLED_STATE_ENABLED, PackageManager.DONT_KILL_APP)
                    packageManager.setComponentEnabledSetting(ComponentName(this@MainActivity, LauncherAliasFive::class.java), PackageManager.COMPONENT_ENABLED_STATE_DISABLED, PackageManager.DONT_KILL_APP)
                }
                "5" -> {
                    packageManager.setComponentEnabledSetting(ComponentName(this@MainActivity, LauncherAliasOne::class.java), PackageManager.COMPONENT_ENABLED_STATE_DISABLED, PackageManager.DONT_KILL_APP)
                    packageManager.setComponentEnabledSetting(ComponentName(this@MainActivity, LauncherAliasTwo::class.java), PackageManager.COMPONENT_ENABLED_STATE_DISABLED, PackageManager.DONT_KILL_APP)
                    packageManager.setComponentEnabledSetting(ComponentName(this@MainActivity, LauncherAliasThree::class.java), PackageManager.COMPONENT_ENABLED_STATE_DISABLED, PackageManager.DONT_KILL_APP)
                    packageManager.setComponentEnabledSetting(ComponentName(this@MainActivity, LauncherAliasDefault::class.java), PackageManager.COMPONENT_ENABLED_STATE_DISABLED, PackageManager.DONT_KILL_APP)
                    packageManager.setComponentEnabledSetting(ComponentName(this@MainActivity, LauncherAliasFour::class.java), PackageManager.COMPONENT_ENABLED_STATE_DISABLED, PackageManager.DONT_KILL_APP)
                    packageManager.setComponentEnabledSetting(ComponentName(this@MainActivity, LauncherAliasFive::class.java), PackageManager.COMPONENT_ENABLED_STATE_ENABLED, PackageManager.DONT_KILL_APP)
                }
            }
        } catch (e: Exception) {
            Log.e("Error setComponentName", e.message.toString())
        }
    }

    override fun onStop() {
        super.onStop()
        setIcon(AppSharedPref.getLauncherIcon(this).toString(), AppSharedPref.getCount(this))
    }
    override fun onDestroy() {
        super.onDestroy()
       }
}
