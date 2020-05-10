//
//  CameraViewController.swift
//  VideosApp
//
//  Created by VoMinhTuanIOS on 2/11/20.
//  Copyright © 2020 VoMinhTuanIOS. All rights reserved.
//

import UIKit
import AVFoundation
import SwiftUI
import MobileCoreServices
import CircleMenu

class CameraViewController: UIViewController, UIImagePickerControllerDelegate,UINavigationControllerDelegate {
   
    
    @IBOutlet weak var takeImageView: UIImageView!
    @IBOutlet weak var mainMenu: CircleMenu!
    
    // which camera input do we want to use
    override func viewDidLoad() {
        super.viewDidLoad()
         let circleButton = CircleMenu(frame: CGRect(x:0, y:self.mainMenu.frame.size.height/5 - 30,width: 60,height: 60), normalIcon: "icons_menu.png", selectedIcon: "icons8-close-window-24.png", buttonsCount: 6, duration: 1, distance: 120)
        let buttonMenu = UIButton()
        circleButton.addSubview(buttonMenu)
        circleMenu(circleMenu: circleButton, willDisplay:buttonMenu , atIndex: 0)
    }
    func buttonMenu()  {
        let circleButton = CircleMenu(frame: CGRect(x:0, y:self.mainMenu.frame.size.height/5 - 30,width: 60,height: 60), normalIcon: "icons_menu.png", selectedIcon: "icons8-close-window-24.png", buttonsCount: 6, duration: 1, distance: 120)
           circleButton.delegate = self
           circleButton.backgroundColor = .gray
           circleButton.layer.cornerRadius = circleButton.frame.size.width/2
           self.mainMenu.addSubview(circleButton)
           circleButton.tag = 2222
    }
    
    func circleMenu(circleMenu: CircleMenu, willDisplay button: UIButton, atIndex: Int) {
        circleMenu.frame = CGRect(x: 0, y: self.mainMenu.frame.size.height/5 - 30, width: 60, height: 60)
        circleMenu.delegate = self
        circleMenu.backgroundColor = .gray
        circleMenu.layer.cornerRadius = circleMenu.frame.size.width/2
    }
    func circleMenu(circleMenu: CircleMenu, buttonWillSelected button: UIButton, atIndex: Int) {
        
    }
    func circleMenu(circleMenu: CircleMenu, buttonDidSelected button: UIButton, atIndex: Int){
    
    }
    func menuCollapsed(_ circleMenu: CircleMenu) {
   
    }
    
    func menuOpened(_ circleMenu: CircleMenu) {
   
    }
    @IBAction func shutterButtonClick(_ sender: Any) {
        if UIImagePickerController.isSourceTypeAvailable(UIImagePickerController.SourceType.camera) {
            let imagePicker = UIImagePickerController()
            imagePicker.delegate = self
            imagePicker.allowsEditing = false
            imagePicker.sourceType = UIImagePickerController.SourceType.camera
            imagePicker.modalPresentationStyle = .fullScreen
            imagePicker.cameraCaptureMode = .photo
            self.present(imagePicker, animated: true, completion: nil)
        }
    }
    @IBAction func openPhotoLibraryClick(_ sender: Any) {
        if UIImagePickerController.isSourceTypeAvailable(UIImagePickerController.SourceType.photoLibrary){
            let imagePicker = UIImagePickerController()
            imagePicker.delegate = self
            imagePicker.allowsEditing = true
            imagePicker.sourceType = UIImagePickerController.SourceType.photoLibrary
//            imagePicker.sourceType = UIImagePickerControllerSourceTypeSavedPhotosAlbum
            imagePicker.mediaTypes = [kUTTypeImage as String]
            self.present(imagePicker, animated: true, completion: nil)
        }
    }
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        picker.dismiss(animated:  true, completion: nil)
    }
    
}
