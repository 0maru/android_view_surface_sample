import Flutter
import UIKit

public class SwiftAndroidViewSurfaceSamplePlugin: NSObject, FlutterPlugin {
  public static func register(with registrar: FlutterPluginRegistrar) {
    let channel = FlutterMethodChannel(name: "android_view_surface_sample", binaryMessenger: registrar.messenger())
    let instance = SwiftAndroidViewSurfaceSamplePlugin()
    registrar.addMethodCallDelegate(instance, channel: channel)
  }

  public func handle(_ call: FlutterMethodCall, result: @escaping FlutterResult) {
    result("iOS " + UIDevice.current.systemVersion)
  }
}
