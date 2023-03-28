//
//  BaseViewController.swift
//  EFNavigationBar
//
//  Created by wangrui on 2017/5/16.
//  Copyright © 2017年 wangrui. All rights reserved.
//

import UIKit
import SnapKit
import EFNavigationBar

class BaseViewController: UIViewController {
    lazy var navBar = EFNavigationBar.CustomNavigationBar()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.navigationBar.isHidden = true
        automaticallyAdjustsScrollViewInsets = false
        setupNavBar()
    }
    
    fileprivate func setupNavBar() {
        view.addSubview(navBar)
        navBar.snp.makeConstraints { make in
            make.left.right.top.equalTo(0)
            make.bottom.equalTo(self.view.safeAreaLayoutGuide.snp.top).offset(EFNavigationBar.defaultStyle.titleHeight)
        }
        
        // 设置自定义导航栏背景图片
        navBar.barBackgroundImage = UIImage(named: "millcolorGrad")

        // 设置自定义导航栏背景颜色
        // navBar.backgroundColor = MainNavBarColor
        
        // 设置自定义导航栏标题颜色
        navBar.setTitleColor(color: .blue)

        // 设置自定义导航栏左右按钮字体颜色
        navBar.setTintColor(color: .white)
        
        if self.navigationController?.children.count != 1 {
            navBar.setLeftButton(title: "<<", titleColor: UIColor.white)
        }
    }
    
    @objc fileprivate func back() {
        _ = navigationController?.popViewController(animated: true)
    }
}
