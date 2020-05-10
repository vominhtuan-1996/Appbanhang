//
//  MenuViewController.swift
//  VideosApp
//
//  Created by VoMinhTuanIOS on 3/9/20.
//  Copyright © 2020 VoMinhTuanIOS. All rights reserved.
//

import UIKit

class MenuViewController: UITableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.leftBarButtonItem = UIBarButtonItem(title: "Logout", style: .plain, target: self, action: #selector(handleLogout))
    
    }
    @objc func handleLogout() {
     //   let loginControler = LoginViewController()
      //    present(loginControler, animated: false, completion: nil)
    }

  

}
