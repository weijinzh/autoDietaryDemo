//
//  RecordingViewController.swift
//  autoDietary
//
//  Created by Weijin on 3/11/19.
//  Copyright © 2019 Weijin. All rights reserved.
//

import UIKit
import AVFoundation

import AWSS3
import AWSCore




class RecordingViewController: UIViewController, AVAudioRecorderDelegate{
    @IBOutlet weak var RecordingBackButton: UIBarButtonItem!
    @IBOutlet weak var btnAudioRecord: UIButton!
    var recordingSession : AVAudioSession!
    var audioRecorder    :AVAudioRecorder!
    var settings         = [String : Int]()
    //var loginInfo = LoginViewController()
    
    weak var timer: Timer?

    override func viewDidLoad() {

        super.viewDidLoad()

        
        let credentialsProvider = AWSCognitoCredentialsProvider(regionType:.USEast2,
                                                                identityPoolId:"*******")
        
        let configuration = AWSServiceConfiguration(region:.USEast2, credentialsProvider:credentialsProvider)
        
        AWSServiceManager.default().defaultServiceConfiguration = configuration
        
        
        btnAudioRecord.setButtonGUI()
        recordingSession = AVAudioSession.sharedInstance()
        do {

            try recordingSession.setCategory(.playAndRecord, mode: .default)
            try recordingSession.setActive(true)
            
            recordingSession.requestRecordPermission() { [unowned self] allowed in
                DispatchQueue.main.async {
                    if allowed {
                        //print("Allow")
                    } else {
                        print("Dont Allow")
                    }
                }
            }
        } catch {
            print("failed to record!")
        }
        

        settings = [
            AVFormatIDKey: Int(kAudioFormatMPEG4AAC),
            AVSampleRateKey: 12000,
            AVNumberOfChannelsKey: 1,
            AVEncoderAudioQualityKey: AVAudioQuality.high.rawValue
        ]
    }
    
    @objc func update() {
        let nextCollor = getNextColor()
        UIView.animate(withDuration: 1, animations: {
            self.view.backgroundColor = nextCollor
        })
       
    }
    
    
    func getNextColor() -> UIColor {
        let currentColor = self.view.backgroundColor
        
        if currentColor == UIColor.red {
            return UIColor.white
        }else {
            return UIColor.red
        }
    }
    
    
    
    @IBAction func Back(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    class func getDocumentsDirectory() -> URL {
        
        let paths = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
        let documentsDirectory = paths[0]
        print("debug")
        print(documentsDirectory)
        return documentsDirectory
    }
    

    
    class func directoryURL() -> URL {
        return getDocumentsDirectory().appendingPathComponent("sound.m4a")
    }
    
    func startRecording() {
        view.backgroundColor = UIColor(red:0.8,green:0,blue:0,alpha: 1)

        let audioSession = AVAudioSession.sharedInstance()
        let audioURL = RecordingViewController.directoryURL()
        
        print(audioURL.absoluteString)
        do {
            audioRecorder = try AVAudioRecorder(url:audioURL,
                                                settings: settings)
            audioRecorder.delegate = self
            audioRecorder.prepareToRecord()
        } catch {
            finishRecording(success: false)
        }
        do {
            try audioSession.setActive(true)
            audioRecorder.record()
        } catch {
        }
        
    }
    
    
    func finishRecording(success: Bool) {
        audioRecorder.stop()
        if success {
            //print(success)
        } else {
            audioRecorder = nil
            print("Somthing Wrong.")
        }
    }
    @IBAction func click_AudioRecord(_ sender: Any) {
            if audioRecorder == nil {
                self.btnAudioRecord.setTitle("Stop", for: UIControl.State.normal)

                self.startRecording()
               
            } else {
                self.btnAudioRecord.setTitle("Recorded", for: UIControl.State.normal)
                self.view.backgroundColor = UIColor(red:0,green:0.8,blue:0,alpha: 1)

                self.finishRecording(success: true)
            }
        
            
        
    }
    

    
    func audioRecorderDidFinishRecording(_ recorder: AVAudioRecorder, successfully flag: Bool) {
        if !flag {
            finishRecording(success: false)
        }
    }
    
    func upload(){
        let MyUrl = RecordingViewController.directoryURL()

        let key = MyUrl

        
        
        let date = Date()
        let calendar = Calendar.current
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd HH:mm:ss"
        let str = dateFormatter.string(from: date as Date)

        print("this is the date")
        print(str)


        
        
        

        
    
        let remoteName = "\(str).m4a"
        let name = UserDefaults.standard.string(forKey:"acc")!
        print("erro")
        print(name)
        let S3BucketName = "********/\(name)"
        
        
        
        
        let uploadRequest = AWSS3TransferManagerUploadRequest()!
        uploadRequest.body = key
        uploadRequest.key = remoteName
        uploadRequest.bucket = S3BucketName
        uploadRequest.contentType = "audio/m4a"
        uploadRequest.acl = .publicRead
        
        
        
        
        let transferManager = AWSS3TransferManager.default()
        transferManager.upload(uploadRequest).continueWith(executor: AWSExecutor.mainThread()) { (task) -> Any? in
            if let error = task.error{
                print(error)
            }
            if task.result != nil{
                print("uploaded")
            }
            return nil
        }

        
    }
    
    
    @IBAction func UploadFiles(_ sender: Any) {
        upload()
    }
    
    
    
}





