//
//  BaseViewController.swift
//  EFNavigationBar
//
//  Created by wangrui on 2017/5/16.
//  Copyright © 2017年 wangrui. All rights reserved.
//

import UIKit
import EFNavigationBar

class BaseViewController: UIViewController {
    lazy var navBar = EFCustomNavigationBar.CustomNavigationBar()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.navigationBar.isHidden = true
        automaticallyAdjustsScrollViewInsets = false
        setupNavBar()
    }

    fileprivate func setupNavBar() {
        view.addSubview(navBar)
        
        // 设置自定义导航栏背景图片
        navBar.barBackgroundImage = UIImage(named: "millcolorGrad")

        // 设置自定义导航栏背景颜色
        // navBar.backgroundColor = MainNavBarColor
        
        // 设置自定义导航栏标题颜色
        navBar.titleLabelColor = .white

        // 设置自定义导航栏左右按钮字体颜色
        navBar.ef_setTintColor(color: .white)
        
        if self.navigationController?.children.count != 1 {
            navBar.ef_setLeftButton(title: "<<", titleColor: UIColor.white)
        }
    }
    
    @objc fileprivate func back() {
        _ = navigationController?.popViewController(animated: true)
    }
}
