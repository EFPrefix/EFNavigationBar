//
//  UIViewController+.swift
//  EFNavigationBar
//
//  Created by EyreFree on 2019/2/16.
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

import Foundation

// MARK: - Router
public extension UIViewController {
    //  A页面 弹出 登录页面B
    //  presentedViewController:    A页面
    //  presentingViewController:   B页面

    func ef_toLastViewController(animated: Bool) {
        if self.navigationController != nil {
            if self.navigationController?.viewControllers.count == 1 {
                self.dismiss(animated: animated, completion: nil)
            } else {
                self.navigationController?.popViewController(animated: animated)
            }
        } else if self.presentingViewController != nil {
            self.dismiss(animated: animated, completion: nil)
        }
    }

    class func ef_currentViewController() -> UIViewController {
        if let rootVC = UIApplication.shared.delegate?.window??.rootViewController {
            return self.ef_currentViewController(from: rootVC)
        } else {
            return UIViewController()
        }
    }

    class func ef_currentViewController(from fromVC: UIViewController) -> UIViewController {
        if let navigationController = fromVC as? UINavigationController, let subViewController = navigationController.viewControllers.last {
            return ef_currentViewController(from: subViewController)
        } else if let tabBarController = fromVC as? UITabBarController, let subViewController = tabBarController.selectedViewController {
            return ef_currentViewController(from: subViewController)
        } else if let presentedViewController = fromVC.presentedViewController {
            return ef_currentViewController(from: presentedViewController)
        } else {
            return fromVC
        }
    }
}

public extension UIViewController {
    struct AssociatedKeys {
        static var pushToCurrentVCFinished: Bool = false
        static var pushToNextVCFinished: Bool = false

        static var navBarBackgroundImage: UIImage = UIImage()

        static var navBarBarTintColor: UIColor = EFNavigationBar.defaultNavBarBarTintColor
        static var navBarBackgroundAlpha: CGFloat = 1.0
        static var navBarTintColor: UIColor = EFNavigationBar.defaultNavBarTintColor
        static var navBarTitleColor: UIColor = EFNavigationBar.defaultNavBarTitleColor
        static var statusBarStyle: UIStatusBarStyle = UIStatusBarStyle.default
        static var navBarShadowImageHidden: Bool = false

        static var customNavBar: UINavigationBar = UINavigationBar()
    }

    // navigationBar barTintColor can not change by currentVC before fromVC push to currentVC finished
    var pushToCurrentVCFinished: Bool {
        get {
            guard let isFinished = objc_getAssociatedObject(self, &AssociatedKeys.pushToCurrentVCFinished) as? Bool else {
                return false
            }
            return isFinished
        }
        set {
            objc_setAssociatedObject(self, &AssociatedKeys.pushToCurrentVCFinished, newValue, .OBJC_ASSOCIATION_ASSIGN)
        }
    }

    // navigationBar barTintColor can not change by currentVC when currentVC push to nextVC finished
    var pushToNextVCFinished: Bool {
        get {
            guard let isFinished = objc_getAssociatedObject(self, &AssociatedKeys.pushToNextVCFinished) as? Bool else {
                return false
            }
            return isFinished
        }
        set {
            objc_setAssociatedObject(self, &AssociatedKeys.pushToNextVCFinished, newValue, .OBJC_ASSOCIATION_ASSIGN)
        }
    }

    // you can set navigationBar backgroundImage
    var navBarBackgroundImage: UIImage? {
        get {
            guard let bgImage = objc_getAssociatedObject(self, &AssociatedKeys.navBarBackgroundImage) as? UIImage else {
                return EFNavigationBar.defaultNavBarBackgroundImage
            }
            return bgImage
        }
        //        set {
        //            if customNavBar.isKind(of: UINavigationBar.self) {
        //                let navBar = customNavBar as! UINavigationBar
        //                navBar.ef_setBackgroundImage(image: newValue!)
        //            }
        //            else {
        //                objc_setAssociatedObject(self, &AssociatedKeys.navBarBackgroundImage, newValue, .OBJC_ASSOCIATION_RETAIN_NONATOMIC)
        //            }
        //        }
    }

    // navigationBar barTintColor
    var navBarBarTintColor: UIColor {
        get {
            guard let barTintColor = objc_getAssociatedObject(self, &AssociatedKeys.navBarBarTintColor) as? UIColor else {
                return EFNavigationBar.defaultNavBarBarTintColor
            }
            return barTintColor
        }
        set {
            objc_setAssociatedObject(self, &AssociatedKeys.navBarBarTintColor, newValue, .OBJC_ASSOCIATION_RETAIN_NONATOMIC)

            if customNavBar.isKind(of: UINavigationBar.self) {
                //                let navBar = customNavBar as! UINavigationBar
                //                navBar.ef_setBackgroundColor(color: newValue)
            } else {
                if canUpdateNavBarBarTintColorOrBackgroundAlpha == true {
                    navigationController?.setNeedsNavigationBarUpdate(barTintColor: newValue)
                }
            }
        }
    }

    // navigationBar _UIBarBackground alpha
    var navBarBackgroundAlpha: CGFloat {
        get {
            guard let barBackgroundAlpha = objc_getAssociatedObject(self, &AssociatedKeys.navBarBackgroundAlpha) as? CGFloat else {
                return 1.0
            }
            return barBackgroundAlpha
        }
        set {
            objc_setAssociatedObject(self, &AssociatedKeys.navBarBackgroundAlpha, newValue, .OBJC_ASSOCIATION_RETAIN_NONATOMIC)

            if customNavBar.isKind(of: UINavigationBar.self) {
                //                let navBar = customNavBar as! UINavigationBar
                //                navBar.ef_setBackgroundAlpha(alpha: newValue)
            } else {
                if canUpdateNavBarBarTintColorOrBackgroundAlpha == true {
                    navigationController?.setNeedsNavigationBarUpdate(barBackgroundAlpha: newValue)
                }
            }
        }
    }
    private var canUpdateNavBarBarTintColorOrBackgroundAlpha: Bool {
        get {
            let isRootViewController = self.navigationController?.viewControllers.first == self
            if (pushToCurrentVCFinished == true || isRootViewController == true) && pushToNextVCFinished == false {
                return true
            } else {
                return false
            }
        }
    }

    // navigationBar tintColor
    var navBarTintColor: UIColor {
        get {
            guard let tintColor = objc_getAssociatedObject(self, &AssociatedKeys.navBarTintColor) as? UIColor else {
                return EFNavigationBar.defaultNavBarTintColor
            }
            return tintColor
        }
        set {
            objc_setAssociatedObject(self, &AssociatedKeys.navBarTintColor, newValue, .OBJC_ASSOCIATION_RETAIN_NONATOMIC)

            if customNavBar.isKind(of: UINavigationBar.self) {
                //                let navBar = customNavBar as! UINavigationBar
                //                navBar.tintColor = newValue
            } else {
                if pushToNextVCFinished == false {
                    navigationController?.setNeedsNavigationBarUpdate(tintColor: newValue)
                }
            }
        }
    }

    // navigationBar titleColor
    var navBarTitleColor: UIColor {
        get {
            guard let titleColor = objc_getAssociatedObject(self, &AssociatedKeys.navBarTitleColor) as? UIColor else {
                return EFNavigationBar.defaultNavBarTitleColor
            }
            return titleColor
        }
        set {
            objc_setAssociatedObject(self, &AssociatedKeys.navBarTitleColor, newValue, .OBJC_ASSOCIATION_RETAIN_NONATOMIC)

            if customNavBar.isKind(of: UINavigationBar.self) {
                //                let navBar = customNavBar as! UINavigationBar
                //                navBar.titleTextAttributes = [NSAttributedStringKey.foregroundColor:newValue]
            } else {
                if pushToNextVCFinished == false {
                    navigationController?.setNeedsNavigationBarUpdate(titleColor: newValue)
                }
            }
        }
    }

    // statusBarStyle
    var statusBarStyle: UIStatusBarStyle {
        get {
            guard let style = objc_getAssociatedObject(self, &AssociatedKeys.statusBarStyle) as? UIStatusBarStyle else {
                return EFNavigationBar.defaultStatusBarStyle
            }
            return style
        }
        set {
            objc_setAssociatedObject(self, &AssociatedKeys.statusBarStyle, newValue, .OBJC_ASSOCIATION_RETAIN_NONATOMIC)
            setNeedsStatusBarAppearanceUpdate()
        }
    }

    // if you want shadowImage hidden,you can via hideShadowImage = true
    var navBarShadowImageHidden: Bool {
        get {
            guard let isHidden = objc_getAssociatedObject(self, &AssociatedKeys.navBarShadowImageHidden) as? Bool else {
                return EFNavigationBar.defaultShadowImageHidden
            }
            return isHidden
        }
        set {
            objc_setAssociatedObject(self, &AssociatedKeys.navBarShadowImageHidden, newValue, .OBJC_ASSOCIATION_ASSIGN)
            navigationController?.setNeedsNavigationBarUpdate(hideShadowImage: newValue)
        }
    }

    // custom navigationBar
    var customNavBar: UIView {
        get {
            guard let navBar = objc_getAssociatedObject(self, &AssociatedKeys.customNavBar) as? UINavigationBar else {
                return UIView()
            }
            return navBar
        }
        set {
            objc_setAssociatedObject(self, &AssociatedKeys.customNavBar, newValue, .OBJC_ASSOCIATION_RETAIN_NONATOMIC)
        }
    }

    // swizzling two system methods: viewWillAppear(_:) and viewWillDisappear(_:)
    private static let onceToken = UUID().uuidString
    @objc public static func efAwake() {
        DispatchQueue.once(token: onceToken) {
            let needSwizzleSelectors = [
                #selector(viewWillAppear(_:)),
                #selector(viewWillDisappear(_:)),
                #selector(viewDidAppear(_:))
            ]

            for selector in needSwizzleSelectors {
                let newSelectorStr = "ef_" + selector.description
                if let originalMethod = class_getInstanceMethod(self, selector),
                    let swizzledMethod = class_getInstanceMethod(self, Selector(newSelectorStr)) {
                    method_exchangeImplementations(originalMethod, swizzledMethod)
                }
            }
        }
    }

    @objc func ef_viewWillAppear(_ animated: Bool) {
        if canUpdateNavigationBar() == true {
            pushToNextVCFinished = false
            navigationController?.setNeedsNavigationBarUpdate(tintColor: navBarTintColor)
            navigationController?.setNeedsNavigationBarUpdate(titleColor: navBarTitleColor)
        }
        ef_viewWillAppear(animated)
    }

    @objc func ef_viewWillDisappear(_ animated: Bool) {
        if canUpdateNavigationBar() == true {
            pushToNextVCFinished = true
        }
        ef_viewWillDisappear(animated)
    }

    @objc func ef_viewDidAppear(_ animated: Bool) {

        if self.navigationController?.viewControllers.first != self {
            self.pushToCurrentVCFinished = true
        }
        if canUpdateNavigationBar() == true {
            if let navBarBgImage = navBarBackgroundImage {
                navigationController?.setNeedsNavigationBarUpdate(backgroundImage: navBarBgImage)
            } else {
                navigationController?.setNeedsNavigationBarUpdate(barTintColor: navBarBarTintColor)
            }
            navigationController?.setNeedsNavigationBarUpdate(barBackgroundAlpha: navBarBackgroundAlpha)
            navigationController?.setNeedsNavigationBarUpdate(tintColor: navBarTintColor)
            navigationController?.setNeedsNavigationBarUpdate(titleColor: navBarTitleColor)
            navigationController?.setNeedsNavigationBarUpdate(hideShadowImage: navBarShadowImageHidden)
        }
        ef_viewDidAppear(animated)
    }

    func canUpdateNavigationBar() -> Bool {
        let viewFrame = view.frame
        let maxFrame = UIScreen.main.bounds
        let middleFrame = CGRect(x: 0, y: EFNavigationBar.navBarBottom(), width: EFNavigationBar.screenWidth(), height: EFNavigationBar.screenHeight()-EFNavigationBar.navBarBottom())
        let minFrame = CGRect(x: 0, y: EFNavigationBar.navBarBottom(), width: EFNavigationBar.screenWidth(), height: EFNavigationBar.screenHeight()-EFNavigationBar.navBarBottom()-EFNavigationBar.tabBarHeight())
        // 蝙蝠🦇
        let isBat = viewFrame.equalTo(maxFrame) || viewFrame.equalTo(middleFrame) || viewFrame.equalTo(minFrame)
        if self.navigationController != nil && isBat == true {
            return true
        } else {
            return false
        }
    }
}
