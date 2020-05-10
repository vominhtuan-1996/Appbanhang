//
//  MainController.swift
//  VideosApp
//
//  Created by VoMinhTuanIOS on 2/5/20.
//  Copyright © 2020 VoMinhTuanIOS. All rights reserved.
//

import UIKit
import SOTabBar

class MainController: SOTabBarViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self .initSOTabbar()
        
    }
    

    func initSOTabbar() {
        let firstViewController = UIStoryboard(name:"Main", bundle: nil).instantiateViewController(withIdentifier:"First_ID")
        let secondVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier:"Three_ID")
        let threeVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier:"Second_ID")
        
        firstViewController.tabBarItem = UITabBarItem(title: "Menu", image: UIImage(named: "icons-menu-50.png"), selectedImage: UIImage(named: "icons-menu-50.png"))
        secondVC.tabBarItem = UITabBarItem(title: "Home", image: UIImage(named: "icons8-home-50.png"), selectedImage: UIImage(named: "icons8-home-50.png"))
        threeVC.tabBarItem = UITabBarItem(title: "Calendar", image: UIImage(named: "icons8-calendar-50.png"), selectedImage: UIImage(named: "icons8-calendar-50.png"))
        SOTabBarSetting.tabBarShadowColor = UIColor.purple.cgColor
        viewControllers = [firstViewController, secondVC, threeVC]
        
    }
}
