import UIKit
import Flutter
import GoogleMaps
import Firebase
import FirebaseMessaging
import QuickLook
import AuthenticationServices
import SwiftKeychainWrapper
import UserNotifications

@UIApplicationMain
@objc class AppDelegate: FlutterAppDelegate, MessagingDelegate {
    
    private var _latestLink: String?
    var displayLink : CADisplayLink?
    private var _eventSink: FlutterEventSink?
    var fileURL: URL!
    var result: FlutterResult?

    private var latestLink: String? {
        get { _latestLink }
        set {
            _latestLink = newValue
            _eventSink?(_latestLink)
        }
    }

    override func application(
        _ application: UIApplication,
        didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
    ) -> Bool {
        
        displayLink = CADisplayLink(target: self, selector: #selector(displayLinkCallback))
        displayLink?.add(to: .current, forMode: .default)
        if #available(iOS 15.0, *) {
            displayLink?.preferredFrameRateRange = CAFrameRateRange(minimum: 120, maximum: 120, preferred: 120)
        }

        FirebaseApp.configure()
        Messaging.messaging().delegate = self
        UNUserNotificationCenter.current().delegate = self

        // Ask user for notification permissions
        UNUserNotificationCenter.current().requestAuthorization(options: [.alert, .badge, .sound]) { granted, error in
            if granted {
                DispatchQueue.main.async {
                    application.registerForRemoteNotifications()
                }
            }
        }

        GMSServices.provideAPIKey("AIzaSyAmdrssRgNUm6SG4CP3B5gTmr30xRl8ajQ")
        UserDefaults.standard.set(true, forKey: "FIRAnalyticsDebugEnabled")

        let controller = window?.rootViewController as! FlutterViewController
        let mlkitChannel = FlutterMethodChannel(name: "com.webkul.magento_mobikul/channel", binaryMessenger: controller.binaryMessenger)

        mlkitChannel.setMethodCallHandler { (call, result) in
            switch call.method {
            case "imageSearch":
                let vc = MLKitViewController(nibName: "MLKitViewController", bundle: nil)
                vc.detectorType = .image
                vc.modalPresentationStyle = .overFullScreen
                vc.suggestedData = { data in result(data) }
                controller.present(vc, animated: true)
            case "textSearch":
                let vc = MLKitViewController(nibName: "MLKitViewController", bundle: nil)
                vc.detectorType = .text
                vc.modalPresentationStyle = .overFullScreen
                vc.suggestedData = { data in result(data) }
                controller.present(vc, animated: true)
            case "fileviewer":
                if let urlString = call.arguments as? String, let url = self.showFileWithPath(urlString) {
                    self.fileURL = url
                    let previewController = QLPreviewController()
                    previewController.dataSource = self
                    previewController.delegate = self
                    previewController.modalPresentationStyle = .fullScreen
                    controller.present(previewController, animated: true)
                }
            case "appleSignin":
                self.result = result
                if #available(iOS 13.0, *) {
                    let request = ASAuthorizationAppleIDProvider().createRequest()
                    request.requestedScopes = [.fullName, .email]
                    let authorizationController = ASAuthorizationController(authorizationRequests: [request])
                    authorizationController.delegate = self
                    authorizationController.presentationContextProvider = self
                    authorizationController.performRequests()
                }
            case "dynamicLauncher":
                self.result = result
                let appIconType = call.arguments as? String ?? "0"
                if #available(iOS 13.0, *) {
                    self.checkIconType(Int(appIconType) ?? 0)
                }
                result(true)
            default:
                result(FlutterMethodNotImplemented)
            }
        }

        let chargingChannel = FlutterEventChannel(name: "uni_links/events", binaryMessenger: controller.binaryMessenger)
        chargingChannel.setStreamHandler(self)

        GeneratedPluginRegistrant.register(with: self)
        return super.application(application, didFinishLaunchingWithOptions: launchOptions)
    }

    @objc func displayLinkCallback() {}

    func showFileWithPath(_ path: String) -> URL? {
        if let documentsUrl = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first {
            let destinationFileUrl = documentsUrl.appendingPathComponent(path)
            if FileManager.default.fileExists(atPath: destinationFileUrl.path) {
                return destinationFileUrl
            }
        }
        return nil
    }

    override func application(_ application: UIApplication, continue userActivity: NSUserActivity,
                              restorationHandler: @escaping ([UIUserActivityRestoring]?) -> Void) -> Bool {
        if userActivity.activityType == NSUserActivityTypeBrowsingWeb {
            setLatestLink(userActivity.webpageURL?.description)
        }
        return true
    }

    // MARK: - Firebase Messaging Delegate
    func messaging(_ messaging: Messaging, didReceiveRegistrationToken fcmToken: String?) {
        print("🔥 FCM Token: \(fcmToken ?? "")")
        // You can send this token to your backend if needed
    }

    // MARK: - Foreground Notification Handler
    override func userNotificationCenter(_ center: UNUserNotificationCenter,
                                         willPresent notification: UNNotification,
                                         withCompletionHandler completionHandler: @escaping (UNNotificationPresentationOptions) -> Void) {
        completionHandler([.banner, .list, .sound])
    }

}

// MARK: - QLPreviewController Delegate
extension AppDelegate: QLPreviewControllerDelegate, QLPreviewControllerDataSource {
    override func application(_ application: UIApplication, willContinueUserActivityWithType userActivityType: String) -> Bool {
        return true
    }

    func numberOfPreviewItems(in controller: QLPreviewController) -> Int { 1 }
    func previewController(_ controller: QLPreviewController, previewItemAt index: Int) -> QLPreviewItem {
        return fileURL as QLPreviewItem
    }
}

// MARK: - Flutter Event Channel
extension AppDelegate: FlutterStreamHandler {
    func onListen(withArguments arguments: Any?, eventSink events: @escaping FlutterEventSink) -> FlutterError? {
        _eventSink = events
        return nil
    }

    func onCancel(withArguments arguments: Any?) -> FlutterError? {
        _eventSink = nil
        return nil
    }

    func setLatestLink(_ latestLink: String?) {
        self.latestLink = latestLink
        _eventSink?(latestLink)
    }
}
enum Keys: String {
    case fname
    case lname
    case email
    case userID
    case personID
}
@available(iOS 13.0, *)
extension AppDelegate: ASAuthorizationControllerDelegate {
    private var fourDigitNumber: String {
        var result = ""
        repeat {
            // Create a string with a random number 0...9999
            result = String(format:"%04d", arc4random_uniform(10000) )
        } while Set<Character>(result).count < 4
        return result
    }
    func authorizationController(controller: ASAuthorizationController, didCompleteWithAuthorization authorization: ASAuthorization) {
        guard let appleIDCredential = authorization.credential as? ASAuthorizationAppleIDCredential else {
            return
        }
        var socialParams = [String: Any]()
        if let _ = appleIDCredential.email, let _ = appleIDCredential.fullName {
            var status = false
            if KeychainWrapper.standard.set(appleIDCredential.email!, forKey: Keys.email.rawValue) {
                status = true
            }
            if KeychainWrapper.standard.set(appleIDCredential.fullName?.givenName ?? "Test", forKey: Keys.fname.rawValue) {
                status = true
            }
            if KeychainWrapper.standard.set(appleIDCredential.fullName?.familyName ?? "Test", forKey: Keys.lname.rawValue) {
                status = true
            }
            if status {
                socialParams["firstname"] = appleIDCredential.fullName?.givenName
                socialParams["lastname"] = appleIDCredential.fullName?.familyName
                let key = self.fourDigitNumber
                KeychainWrapper.standard.set(key, forKey: Keys.personID.rawValue)
                socialParams["email"] = appleIDCredential.email
                socialParams["pictureURL"] = ""
                self.result?(socialParams)
            }
        }else {
            //socialParams["wk_token"] = sharedPrefrence.object(forKey:"wk_token");
            socialParams["firstname"] = KeychainWrapper.standard.string(forKey: Keys.fname.rawValue)
            socialParams["lastname"] = KeychainWrapper.standard.string(forKey: Keys.lname.rawValue)
            // socialParams["personId"] = KeychainWrapper.standard.string(forKey: Keys.personID.rawValue)
            socialParams["email"] = KeychainWrapper.standard.string(forKey: Keys.email.rawValue)
            socialParams["pictureURL"] = ""
            self.result?(socialParams)
        }
    }


    func authorizationController(controller: ASAuthorizationController, didCompleteWithError error: Error) {
        //   NetworkManager.sharedInstance.showErrorSnackBar(msg: error.localizedDescription)
        print("AppleID Credential failed with error: \(error.localizedDescription)")
    }
    
    func checkIconType(_ appIcon: Int) {
        
        if(appIcon == 1){
            self.setIcon("AppIconDefault")
        }else if(appIcon == 2){
            self.setIcon("AppIconTwo")
        }else if(appIcon == 3){
            self.setIcon("AppIconThree")
        }else if(appIcon == 4){
            self.setIcon("AppIconFour")
        }else if(appIcon == 5){
            self.setIcon("AppIconFive")
        }else{
            self.setIcon("AppIconDefault")
        }
    }
    
    func setIcon(_ appIcon: String) {
                    print(appIcon)
                    if UIApplication.shared.responds(to: #selector(getter: UIApplication.supportsAlternateIcons)) && UIApplication.shared.supportsAlternateIcons {
                        
                        typealias setAlternateIconName = @convention(c) (NSObject, Selector, NSString?, @escaping (NSError) -> ()) -> ()
                        
                        let selectorString = "_setAlternateIconName:completionHandler:"
                        
                        let selector = NSSelectorFromString(selectorString)
                        let imp = UIApplication.shared.method(for: selector)
                        let method = unsafeBitCast(imp, to: setAlternateIconName.self)
                        method(UIApplication.shared, selector, appIcon as NSString?, { _ in })
                    }
        }

}

@available(iOS 13.0, *)
extension AppDelegate: ASAuthorizationControllerPresentationContextProviding {
    func presentationAnchor(for controller: ASAuthorizationController) -> ASPresentationAnchor {
        return self.window!
    }
}

