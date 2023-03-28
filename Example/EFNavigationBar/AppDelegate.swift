//
//  AppDelegate.swift
//  EFNavigationBar
//
//  Created by wangrui on 2017/4/19.
//  Copyright © 2017年 wangrui. All rights reserved.
//

import UIKit
import EFNavigationBar

let MainNavBarColor = UIColor.init(red: 0 / 255.0, green: 175 / 255.0, blue: 240 / 255.0, alpha: 1)
let kScreenWidth = UIScreen.main.bounds.width
let kScreenHeight = UIScreen.main.bounds.height
var kNavBarHeight = EFNavigationBar.defaultStyle.titleHeight + (UIApplication.shared()?.statusBarFrame.size.height ?? 0)

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        window = UIWindow.init(frame: UIScreen.main.bounds)
        window?.backgroundColor = UIColor.white

        window?.rootViewController = BaseNavigationController(rootViewController: CustomListController())
        setNavBarAppearence()
        window?.makeKeyAndVisible()

        return true
    }

    func setNavBarAppearence() {
        EFNavigationBar.defaultStyle.backgroundColor = UIColor.white
        EFNavigationBar.defaultStyle.titleColor = .orange
        EFNavigationBar.defaultStyle.statusBarStyle = .lightContent
    }
}
