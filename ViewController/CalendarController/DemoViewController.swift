//
//  DemoViewController.swift
//  VideosApp
//
//  Created by VoMinhTuanIOS on 3/3/20.
//  Copyright © 2020 VoMinhTuanIOS. All rights reserved.
//

import UIKit

class DemoViewController: UIViewController {

    @IBOutlet weak var messageTextView: UITextView!
    override func viewDidLoad() {
        super.viewDidLoad()
        let tap = UITapGestureRecognizer(target: self.view, action: #selector(UIView.endEditing(_:)))
        tap.cancelsTouchesInView = false
        self.view.addGestureRecognizer(tap)
        setupLayoutTextView()
        layoutNavigationBar()
        self.messageTextView.textColor = UIColor.black
        self.messageTextView.textAlignment = NSTextAlignment.left
        self.messageTextView.contentInset = UIEdgeInsets(top: 5,left: 10,bottom: 10,right: 10)
    }
    override func viewDidAppear(_ animated: Bool) {
    }
    
    func setupLayoutTextView() {
        let toolbar = UIToolbar(frame: CGRect(origin: .zero, size: .init(width: self.messageTextView.frame.size.width, height: 30)))
        let textViewSpace = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: nil, action: nil)
        let doneButton = UIBarButtonItem(title: "Done", style: .done, target: self, action: #selector(doneButtonAction))
        
        toolbar.setItems([textViewSpace,doneButton], animated: false)
        toolbar.sizeToFit()
        self.messageTextView.inputAccessoryView = toolbar
    }
    @objc func doneButtonAction() {
        self.view.endEditing(true)
    }
    func layoutNavigationBar() {
        let color = UIColor(red: 81 / 255, green: 155 / 255, blue: 22 / 255, alpha: 1.0)
        self.navigationController?.navigationBar.barTintColor = color
        let navBar = UINavigationBar(frame: CGRect(x: 0, y: 20, width: view.frame.size.width, height: 40))
        view.addSubview(navBar)
        let navItem = UINavigationItem()
        let imageView = UIImageView(frame: CGRect(x: 0, y: 0, width: 40, height: 40))
        imageView.contentMode = .scaleAspectFit
        let image = UIImage(named: "icons_apple_logo.png")
        imageView.image = image
        navItem.titleView = imageView
        let doneItem = barButton(imageName: "icons_menu.png", selector: #selector(selectorName))
        navItem.leftBarButtonItem = doneItem
        navBar.setItems([navItem], animated: false)
        
    }
    private func imageView(imageName: String) -> UIImageView {
        let logo = UIImage(named: imageName)
        let logoImageView = UIImageView(frame: CGRect(x: 0, y: 0, width: 35, height: 35))
        logoImageView.contentMode = .scaleAspectFit
        logoImageView.image = logo
        logoImageView.widthAnchor.constraint(equalToConstant: 35).isActive = true
        logoImageView.heightAnchor.constraint(equalToConstant: 35).isActive = true
        return logoImageView
    }
    func barImageView(imageName: String) -> UIBarButtonItem {
        return UIBarButtonItem(customView: imageView(imageName: imageName))
    }
    func barButton(imageName: String, selector: Selector) -> UIBarButtonItem {
        let button = UIButton(type: .custom)
        button.setImage(UIImage(named: imageName), for: .normal)
        button.frame = CGRect(x: 0, y: 0, width: 35, height: 35)
        button.widthAnchor.constraint(equalToConstant: 35).isActive = true
        button.heightAnchor.constraint(equalToConstant: 35).isActive = true
        button.addTarget(self, action: selector, for: .touchUpInside)
        return UIBarButtonItem(customView: button)
    }
    @objc func selectorName() {
        let appdel = UIApplication.shared.delegate as! AppDelegate
        appdel.drawerController.setDrawerState(.opened, animated:false)
        print("aaaaa")
        
    }
    
    func textFieldShouleRetuen(textField:UITextView) -> Bool {
        self.view.endEditing(true)
        return true
    }
}
