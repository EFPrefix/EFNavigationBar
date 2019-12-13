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

import UIKit

// MARK: - Router
public extension UIViewController {
    
    // https://www.jianshu.com/p/1cab96bcbde9
    func gotoLastViewController(animated: Bool, completion: (() -> Void)? = nil) {
        if let navigationController = self.navigationController {
            if navigationController.viewControllers.count == 1 {
                self.dismiss(animated: animated, completion: completion)
            } else {
                CATransaction.begin()
                CATransaction.setCompletionBlock(completion)
                navigationController.popViewController(animated: animated)
                CATransaction.commit()
            }
        } else if nil != self.presentingViewController {
            self.dismiss(animated: animated, completion: completion)
        }
    }
    
    class func currentViewController() -> UIViewController {
        if let rootVC = UIApplication.shared.delegate?.window??.rootViewController {
            return self.currentViewController(from: rootVC)
        } else {
            return UIViewController()
        }
    }
    
    class func currentViewController(from viewController: UIViewController) -> UIViewController {
        if let navigationController = viewController as? UINavigationController, let subViewController = navigationController.viewControllers.last {
            return currentViewController(from: subViewController)
        } else if let tabBarController = viewController as? UITabBarController, let subViewController = tabBarController.selectedViewController {
            return currentViewController(from: subViewController)
        } else if let presentedViewController = viewController.presentedViewController {
            return currentViewController(from: presentedViewController)
        } else {
            return viewController
        }
    }
}

public extension UIViewController {
    private struct AssociatedKeys {
        static var statusBarStyle: String = "statusBarStyle"
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
}
