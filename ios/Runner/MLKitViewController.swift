import UIKit
import AVFoundation
import Vision

protocol SuggestionDataHandlerDelegate: class {
    func suggestedData(data: String)
}

class MLKitViewController: UIViewController, AVCaptureVideoDataOutputSampleBufferDelegate, UIPopoverPresentationControllerDelegate, DetectedItem {

    @IBOutlet var captureView: UIImageView!
    @IBOutlet weak var suggestionView: UIView!
    @IBOutlet weak var arrowImg: UIImageView!
    @IBOutlet weak var suggestionBtn: UIButton!
    @IBOutlet weak var crossBtn: UIButton!
    @IBOutlet weak var suggestionTableView: UITableView!
    @IBOutlet weak var suggestionViewLeading: NSLayoutConstraint!
    @IBOutlet weak var suggestionViewTrailing: NSLayoutConstraint!
    @IBOutlet weak var suggestionViewBottom: NSLayoutConstraint!
    @IBOutlet weak var suggestionViewHeight: NSLayoutConstraint!

    let captureSession = AVCaptureSession()
    var previewLayer: AVCaptureVideoPreviewLayer!
    var captureDevice: AVCaptureDevice!
    var totalTextString  = [String]()
    var flag = Bool()
    var shouldTakePhoto = false
    var frameCount = 0
    let detectViewModel = DetectViewModel()
    var isSuggestionsShowing = false
    var detectorType: DetectorType!
    var suggestedData : (( String) -> Void)?

    // Vision request for text recognition
    lazy var textRequest: VNRecognizeTextRequest = {
        let request = VNRecognizeTextRequest { [weak self] request, error in
            guard let self = self, let observations = request.results as? [VNRecognizedTextObservation] else { return }

            var detectedTexts: [String] = []
            for observation in observations {
                if let text = observation.topCandidates(1).first?.string {
                    detectedTexts.append(text)
                }
            }
            self.handleDetectedText(detectedTexts)
        }
        request.recognitionLevel = .accurate
        request.usesLanguageCorrection = true
        request.recognitionLanguages = ["en"] // Add more languages if needed
        return request
    }()

    // Vision model for image classification
    lazy var imageLabelerModel: VNCoreMLModel? = {
        
        if let modelURL = Bundle.main.url(forResource: "FastViTT8F16", withExtension: "mlmodelc") {
            print("Model URL: \(modelURL)")
        } else {
            print("Model file not found")
        }
        guard let modelURL = Bundle.main.url(forResource: "FastViTT8F16", withExtension: "mlmodelc") else {
            print("Model file not found")
            return nil
        }
        do {
            let model = try VNCoreMLModel(for: MLModel(contentsOf: modelURL))
            print("Model loaded successfully")
            return model
        } catch {
            print("Error loading model: \(error)")
            return nil
        }
    }()


    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let resourcePath = Bundle.main.resourcePath {
                print("📦 Bundle path:", resourcePath)
                print("📂 Bundle contents:")
                try? FileManager.default.contentsOfDirectory(atPath: resourcePath)
                    .forEach { print("Bundle ajay - \($0)") }
            }

        view.backgroundColor = UIColor.clear
        view.isOpaque = true
        self.suggestionView.layer.cornerRadius = 8
        prepareCamera()
        self.navigationItem.leftBarButtonItem = UIBarButtonItem(image: UIImage(named: "sharp-crossBtns")?.withRenderingMode(.alwaysTemplate), style: .done, target: self, action: #selector(tapCrossBtn))
    }

    override func viewDidDisappear(_ animated: Bool) {
        self.toggleTorch(on: false)
        captureSession.stopRunning()
        if let inputs = captureSession.inputs as? [AVCaptureDeviceInput] {
            for input in inputs {
                captureSession.removeInput(input)
            }
        }
    }

    @objc func tapCrossBtn() {
        self.dismiss(animated: true, completion: nil)
    }

    @IBAction func tapSuggestionBtn(_ sender: Any) {
        if isSuggestionsShowing {
            isSuggestionsShowing = false
            self.suggestionViewLeading.constant = 20
            self.suggestionViewTrailing.constant = 20
            self.suggestionViewBottom.constant = 20
            self.suggestionViewHeight.constant = 40
            UIView.animate(withDuration: 0.5) {
                self.suggestionView.layer.cornerRadius = 8
                self.suggestionView.layoutIfNeeded()
                self.arrowImg.transform = CGAffineTransform(rotationAngle: 0)
            }
        } else {
            isSuggestionsShowing = true
            self.suggestionViewLeading.constant = 0
            self.suggestionViewTrailing.constant = 0
            self.suggestionViewBottom.constant = 0
            let height = CGFloat(40 * (self.detectViewModel.TextStringValue.count + 1)) > (self.view.frame.size.height*3/4) ? (self.view.frame.size.height*3/4):CGFloat(40 * (self.detectViewModel.TextStringValue.count + 1))
            self.suggestionViewHeight.constant = height
            UIView.animate(withDuration: 0.5) {
                self.suggestionView.layer.cornerRadius = 0
                self.suggestionView.layoutIfNeeded()
                self.arrowImg.transform = CGAffineTransform(rotationAngle: .pi)
            }
        }
    }

    func DetectedValue(value: String) {
        self.dismiss(animated: true) {
            self.suggestedData?(value)
        }
    }

    func UIColorFromRGB(rgbValue: UInt) -> UIColor {
        return UIColor(
            red: CGFloat((rgbValue & 0xFF0000) >> 16) / 255.0,
            green: CGFloat((rgbValue & 0x00FF00) >> 8) / 255.0,
            blue: CGFloat(rgbValue & 0x0000FF) / 255.0,
            alpha: CGFloat(1.0)
        )
    }

    func prepareCamera() {
        captureSession.sessionPreset = AVCaptureSession.Preset.medium
        captureDevice = AVCaptureDevice.DiscoverySession(deviceTypes: [.builtInWideAngleCamera], mediaType: AVMediaType.video, position: AVCaptureDevice.Position.back).devices.first
        beginSession()
    }

    func beginSession() {
        do {
            let captureDeviceInput = try AVCaptureDeviceInput(device: captureDevice)
            captureSession.addInput(captureDeviceInput)
        } catch {
            presentCameraSettings()
        }
        previewLayer = AVCaptureVideoPreviewLayer(session: captureSession)
        previewLayer.videoGravity = AVLayerVideoGravity.resizeAspectFill
        view.layer.addSublayer(previewLayer)
        previewLayer.frame = CGRect(x: CGFloat(0), y: CGFloat(0), width: self.view.frame.size.width, height: self.view.frame.size.height)
        previewLayer.bounds = CGRect(x: CGFloat(0), y: CGFloat(0), width: self.view.frame.size.width, height: self.view.frame.size.height)
        self.view.bringSubviewToFront(self.suggestionView)
        self.view.bringSubviewToFront(self.crossBtn)
        captureSession.startRunning()
        let dataOutput = AVCaptureVideoDataOutput()
        dataOutput.videoSettings = [
            ((kCVPixelBufferPixelFormatTypeKey as NSString) as String): NSNumber(value: kCVPixelFormatType_32BGRA)
        ]
        dataOutput.alwaysDiscardsLateVideoFrames = true
        if captureSession.canAddOutput(dataOutput) {
            captureSession.addOutput(dataOutput)
        }
        captureSession.commitConfiguration()
        let queue = DispatchQueue(label: "captureQueue")
        dataOutput.setSampleBufferDelegate(self, queue: queue)
    }

    func presentCameraSettings() {
        let alertController = UIAlertController(title: "", message: "cameraAccessDenied", preferredStyle: .alert)
        alertController.addAction(UIAlertAction(title: "cancel", style: .default) { _ in
            self.dismiss(animated: true, completion: nil)
        })
        alertController.addAction(UIAlertAction(title: "settings", style: .cancel) { _ in
            if let url = URL(string: UIApplication.openSettingsURLString) {
                UIApplication.shared.open(url, options: [:], completionHandler: { _ in
                    self.prepareCamera()
                })
            }
        })
        self.present(alertController, animated: true)
    }

    func proccess(every: Int, callback: () -> Void) {
        frameCount += 1
        if frameCount % every == 0 {
            callback()
        }
    }

    private func handleDetectedText(_ texts: [String]) {
        for text in texts {
            if !totalTextString.contains(text) {
                if totalTextString.count < 21 {
                    totalTextString.append(text)
                    self.detectViewModel.getValue(data: totalTextString) { [weak self] (check) in
                        guard let self = self else { return }
                        if check {
                            DispatchQueue.main.async {
                                self.suggestionView.isHidden = false
                                self.detectViewModel.delegate = self
                                self.suggestionTableView.delegate = self.detectViewModel
                                self.suggestionTableView.dataSource = self.detectViewModel
                                self.suggestionTableView.alpha = 1
                                self.suggestionTableView.reloadData()
                                let dataStr = "\(self.detectViewModel.TextStringValue.count) Suggestions"
                                self.suggestionBtn.setTitle(dataStr, for: .normal)
                            }
                        }
                    }
                } else {
                    // Show a warning if needed
                }
            }
        }
    }

    func detectText(in buffer: CMSampleBuffer, completion: @escaping (_ text: String, _ image: UIImage) -> Void) {
        if let image = buffer.toUIImage() {
            let viImage = VNImageRequestHandler(cgImage: image.cgImage!, options: [:])
            do {
                try viImage.perform([textRequest])
            } catch {
                print("Error performing text recognition: \(error.localizedDescription)")
            }
        }
    }

    func detectImageLabels(in image: CGImage, completion: @escaping ([VNClassificationObservation]?) -> Void) {
        guard let model = imageLabelerModel else {
            print("Image labeler model is nil")
            completion(nil)
            return
        }

        let request = VNCoreMLRequest(model: model) { request, error in
            guard error == nil else {
                print("Error during image classification: \(error!)")
                completion(nil)
                return
            }
            let results = request.results as? [VNClassificationObservation]
            completion(results)
        }

        let handler = VNImageRequestHandler(cgImage: image, options: [:])
        do {
            try handler.perform([request])
        } catch {
            print("Failed to perform classification.\n\(error.localizedDescription)")
            completion(nil)
        }
    }
    func captureOutput(_ output: AVCaptureOutput, didOutput sampleBuffer: CMSampleBuffer, from connection: AVCaptureConnection) {
        proccess(every: 10) {
            guard let pixelBuffer = CMSampleBufferGetImageBuffer(sampleBuffer) else { return }
            let ciImage = CIImage(cvPixelBuffer: pixelBuffer)
            let context = CIContext()
            guard let cgImage = context.createCGImage(ciImage, from: ciImage.extent) else { return }

            switch detectorType {
            case .text:
                // Detect text only
                self.detectText(in: sampleBuffer) { text, image in
                    print("Detected Text: \(text)")
                    self.handleDetectedText([text])
                }

            case .image:
                // Detect image labels only
                self.detectImageLabels(in: cgImage) { classifications in
                    guard let classifications = classifications else { return }
                    let detectedLabels = classifications.map { $0.identifier }
                    DispatchQueue.main.async {
                        self.handleDetectedText(detectedLabels)
                    }
                    for classification in classifications {
                        print("Label: \(classification.identifier), Confidence: \(classification.confidence)")
                    }
                }

            default:
                break
            }
        }
    }

 
//    func captureOutput(_ output: AVCaptureOutput, didOutput sampleBuffer: CMSampleBuffer, from connection: AVCaptureConnection) {
//        proccess(every: 10) {
//            guard let pixelBuffer = CMSampleBufferGetImageBuffer(sampleBuffer) else { return }
//            let ciImage = CIImage(cvPixelBuffer: pixelBuffer)
//            let context = CIContext()
//            guard let cgImage = context.createCGImage(ciImage, from: ciImage.extent) else { return }
//
//            // Detect text
//            self.detectText(in: sampleBuffer) { text, image in
//                print("Detected Text: \(text)")
//            }
//
//            // Detect image labels
//            self.detectImageLabels(in: cgImage) { classifications in
//                guard let classifications = classifications else {
//                    print("No classifications returned")
//                    return
//                }
//                for classification in classifications {
//                    //self.handleDetectedText(detectedTexts)
//                    print("Label: \(classification.identifier), Confidence: \(classification.confidence)")
//
//                }
//            }
//        }
//    }

    func toggleTorch(on: Bool) {
        guard let device = AVCaptureDevice.default(for: AVMediaType.video) else { return }
        if device.hasTorch {
            do {
                try device.lockForConfiguration()
                if on {
                    device.torchMode = .on
                } else {
                    device.torchMode = .off
                }
                device.unlockForConfiguration()
            } catch {
                print("Torch could not be used")
            }
        } else {
            print("Torch is not available")
        }
    }
}

extension CMSampleBuffer {
    func toUIImage() -> UIImage? {
        if let pixelBuffer = CMSampleBufferGetImageBuffer(self) {
            let ciImage = CIImage(cvPixelBuffer: pixelBuffer)
            let context = CIContext()
            let imageRect = CGRect(x: 0, y: 0, width: CVPixelBufferGetWidth(pixelBuffer), height: CVPixelBufferGetHeight(pixelBuffer))
            if let image = context.createCGImage(ciImage, from: imageRect) {
                return UIImage(cgImage: image, scale: UIScreen.main.scale, orientation: .right)
            }
        }
        return nil
    }
}

protocol DetectedItem: class {
    func DetectedValue(value: String)
}

class DetectViewModel: NSObject {

    var TextStringValue: [String] = []
    weak var delegate: DetectedItem?

    func getValue(data: [String], completion: ((_ data: Bool) -> Void)) {
        if data.count != 0 {
            TextStringValue = data
            completion(true)
        } else {
            completion(false)
        }
    }
}

extension DetectViewModel: UITableViewDelegate, UITableViewDataSource {

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return TextStringValue.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: .default, reuseIdentifier: "cell")
        cell.textLabel?.textAlignment = .left
        cell.textLabel?.text = TextStringValue[indexPath.row]
        return cell
    }

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 40
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        delegate?.DetectedValue(value: TextStringValue[indexPath.row])
    }
}

struct AppDimensions {
    static let screenWidth = UIScreen.main.bounds.size.width
    static let screenHeight = UIScreen.main.bounds.size.height
}

struct MaxSizes {
    static let uploadImageMaxSize: CGFloat = 1048576
}

struct AppModules {
    static let isLottieEnable = false
}
