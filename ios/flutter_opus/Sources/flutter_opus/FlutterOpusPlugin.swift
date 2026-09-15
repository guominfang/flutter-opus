import Flutter
import UIKit
import OpusFFI

public class FlutterOpusPlugin: NSObject, FlutterPlugin {
  public static func register(with registrar: FlutterPluginRegistrar) {
    // Keep the static Opus archive's FFI symbols in the final application.
    flutter_opus_link_anchor()

    let channel = FlutterMethodChannel(
      name: "flutter_opus",
      binaryMessenger: registrar.messenger()
    )
    let instance = FlutterOpusPlugin()
    registrar.addMethodCallDelegate(instance, channel: channel)
  }

  public func handle(
    _ call: FlutterMethodCall,
    result: @escaping FlutterResult
  ) {
    switch call.method {
    case "getPlatformVersion":
      result("iOS " + UIDevice.current.systemVersion)
    default:
      result(FlutterMethodNotImplemented)
    }
  }
}
