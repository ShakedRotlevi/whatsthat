//
//  MenuViewController.swift
//  whatsthat
//
//  Created by Shaked Rotlevi on 11/20/17.
//  Copyright © 2017 gwu. All rights reserved.
//

import UIKit
import Photos

class MenuViewController: UIViewController,UIImagePickerControllerDelegate,
UINavigationControllerDelegate {
    @IBOutlet weak var myImageView: UIImageView!
    let googleVisionAPIManager = GoogleVisionAPIManager()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func imagePicker(_: UIButton) {
        checkPermission {
            print("In image picker")
            let picker = UIImagePickerController()
             picker.delegate = self
             let alert = UIAlertController(title: nil, message: nil, preferredStyle: .actionSheet)
             alert.addAction(UIAlertAction(title: "Camera", style: .default, handler: {
             action in
             picker.sourceType = .camera
                self.checkCameraPermission{
             self.present(picker, animated: true, completion: nil)
                }
             }))
             alert.addAction(UIAlertAction(title: "Photo Library", style: .default, handler: {
             action in
             picker.sourceType = .photoLibrary
                self.checkPermission {
                print("before present")
             self.present(picker, animated: true, completion: nil)
                print("after present")
                }
             }))
             alert.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: nil))
             self.present(alert, animated: true, completion: nil)
        }
        
    }
    func checkCameraPermission(hanler: @escaping () -> Void) {
        AVCaptureDevice.requestAccess(for: AVMediaType.video) { response in
            if response {
                //access granted
                hanler()
            } else {
                 print("Error: no access to photo album.")
                
            }
        }
    }
    func checkPermission(hanler: @escaping () -> Void) {
        let photoAuthorizationStatus = PHPhotoLibrary.authorizationStatus()
        switch photoAuthorizationStatus {
        case .authorized:
            // Access is already granted by user
            hanler()
        case .notDetermined:
            PHPhotoLibrary.requestAuthorization { (newStatus) in
                if newStatus == PHAuthorizationStatus.authorized {
                    // Access is granted by user
                    hanler()
                }
            }
        case .restricted:
            // same same
            print("User do not have access to photo album.")
        case .denied:
            // same same
            print("User has denied the permission.")
        }
       // default:
         //   print("Error: no access to photo album.")
        //}
    }
    
//}
//extension MenuViewController{
    internal func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any])
    {
        // spinner.startAnimating()
        print("before chosen image")
        let chosenImage = info[UIImagePickerControllerOriginalImage] as! UIImage //2
        //   myImageView.contentMode = .scaleAspectFit //3
        //  myImageView.image = chosenImage //4
        /*   storageRef.putFile(from: imageURL!, metadata: nil) { metadata, error in
         if let error = error {
         print(error)
         self.spinner.stopAnimating()
         } else {
         print("uplaod success!")
         // TODO: handle Vision API response
         }
         }*/
        print("before fetch")
        googleVisionAPIManager.fetchGoogleVisionUsingCodable(with: "hi")
        
        dismiss(animated: true, completion: nil) //5
    }
    internal func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        dismiss(animated: true, completion: nil)
    }
}


