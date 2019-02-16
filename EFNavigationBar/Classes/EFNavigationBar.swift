//
//  EFNavigationBar.swift
//  EFNavigationBar
//
//  Created by wangrui on 2017/4/19.
//
//  Copyright (c) 2019 EyreFree <eyrefree@eyrefree.org>
//
//  Permission is hereby granted, free of charge, to any person obtaining a copy
//  of this software and associated documentation files (the "Software"), to deal
//  in the Software without restriction, including without limitation the rights
//  to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
//  copies of the Software, and to permit persons to whom the Software is
//  furnished to do so, subject to the following conditions:
//
//  The above copyright notice and this permission notice shall be included in
//  all copies or substantial portions of the Software.
//
//  THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
//  IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
//  FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
//  AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
//  LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
//  OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
//  THE SOFTWARE.

import UIKit

public class EFNavigationBar {

    struct AssociatedKeys {   // default is system attributes
        static var defaultNavBarBarTintColorKey: UIColor = UIColor.white
        static var defaultNavBarBackgroundImageKey: UIImage = UIImage()
        static var defaultNavBarTintColorKey: UIColor = UIColor(red: 0, green: 0.478431, blue: 1, alpha: 1.0)
        static var defaultNavBarTitleColorKey: UIColor = UIColor.black
        static var defaultStatusBarStyleKey: UIStatusBarStyle = UIStatusBarStyle.default
        static var defaultShadowImageHiddenKey: Bool = false
    }
    
    public class var defaultNavBarBarTintColor: UIColor {
        get {
            return objc_getAssociatedObject(self, &AssociatedKeys.defaultNavBarBarTintColorKey) as? UIColor ?? AssociatedKeys.defaultNavBarBarTintColorKey
        }
        set {
            objc_setAssociatedObject(self, &AssociatedKeys.defaultNavBarBarTintColorKey, newValue, .OBJC_ASSOCIATION_RETAIN_NONATOMIC)
        }
    }
    
    public class var defaultNavBarBackgroundImage: UIImage? {
        get {
            return objc_getAssociatedObject(self, &AssociatedKeys.defaultNavBarBackgroundImageKey) as? UIImage
        }
        set {
            objc_setAssociatedObject(self, &AssociatedKeys.defaultNavBarBackgroundImageKey, newValue, .OBJC_ASSOCIATION_RETAIN_NONATOMIC)
        }
    }
    
    public class var defaultNavBarTintColor: UIColor {
        get {
            return objc_getAssociatedObject(self, &AssociatedKeys.defaultNavBarTintColorKey) as? UIColor ?? AssociatedKeys.defaultNavBarTintColorKey
        }
        set {
            objc_setAssociatedObject(self, &AssociatedKeys.defaultNavBarTintColorKey, newValue, .OBJC_ASSOCIATION_RETAIN_NONATOMIC)
        }
    }
    
    public class var defaultNavBarTitleColor: UIColor {
        get {
            return objc_getAssociatedObject(self, &AssociatedKeys.defaultNavBarTitleColorKey) as? UIColor ?? AssociatedKeys.defaultNavBarTitleColorKey
        }
        set {
            objc_setAssociatedObject(self, &AssociatedKeys.defaultNavBarTitleColorKey, newValue, .OBJC_ASSOCIATION_RETAIN_NONATOMIC)
        }
    }
    
    public class var defaultStatusBarStyle: UIStatusBarStyle {
        get {
            return objc_getAssociatedObject(self, &AssociatedKeys.defaultStatusBarStyleKey) as? UIStatusBarStyle ?? .default
        }
        set {
            objc_setAssociatedObject(self, &AssociatedKeys.defaultStatusBarStyleKey, newValue, .OBJC_ASSOCIATION_RETAIN_NONATOMIC)
        }
    }
    
    public class var defaultShadowImageHidden: Bool {
        get {
            return objc_getAssociatedObject(self, &AssociatedKeys.defaultShadowImageHiddenKey) as? Bool ?? false
        }
        set {
            objc_setAssociatedObject(self, &AssociatedKeys.defaultShadowImageHiddenKey, newValue, .OBJC_ASSOCIATION_ASSIGN)
        }
    }
    
    public class var defaultBackgroundAlpha: CGFloat {
        get {
            return 1.0
        }
    }
}

public extension EFNavigationBar {

    class func navBarBottom() -> Int {
        return UIDevice.isiPhoneX ? 88 : 64
    }

    class func tabBarHeight() -> Int {
        return UIDevice.isiPhoneX ? 83 : 49
    }

    class func screenWidth() -> Int {
        return Int(UIScreen.main.bounds.size.width)
    }

    class func screenHeight() -> Int {
        return Int(UIScreen.main.bounds.size.height)
    }
}
