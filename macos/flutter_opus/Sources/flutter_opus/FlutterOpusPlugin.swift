import Cocoa
import FlutterMacOS
import OpusFFI

public class FlutterOpusPlugin: NSObject, FlutterPlugin {
  public static func register(with registrar: FlutterPluginRegistrar) {
    flutter_opus_link_anchor()

    let channel = FlutterMethodChannel(
      name: "flutter_opus",
      binaryMessenger: registrar.messenger
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
      result("macOS " + ProcessInfo.processInfo.operatingSystemVersionString)
    default:
      result(FlutterMethodNotImplemented)
    }
  }
}
