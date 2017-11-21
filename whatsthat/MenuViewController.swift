//
//  MenuViewController.swift
//  whatsthat
//
//  Created by Shaked Rotlevi on 11/20/17.
//  Copyright © 2017 gwu. All rights reserved.
//

import UIKit

class MenuViewController: UIViewController,UIImagePickerControllerDelegate,
UINavigationControllerDelegate {
    @IBOutlet weak var myImageView: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func imagePicker(_: UIButton) {
         let picker = UIImagePickerController()
         picker.delegate = self
         let alert = UIAlertController(title: nil, message: nil, preferredStyle: .actionSheet)
         alert.addAction(UIAlertAction(title: "Camera", style: .default, handler: {
         action in
         picker.sourceType = .camera
         self.present(picker, animated: true, completion: nil)
         }))
         alert.addAction(UIAlertAction(title: "Photo Library", style: .default, handler: {
         action in
         picker.sourceType = .photoLibrary
         self.present(picker, animated: true, completion: nil)
         }))
         alert.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: nil))
         self.present(alert, animated: true, completion: nil)
    }

    
}

