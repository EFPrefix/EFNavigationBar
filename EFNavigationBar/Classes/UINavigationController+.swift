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

public extension UINavigationController {
    open override var preferredStatusBarStyle: UIStatusBarStyle {
        return topViewController?.statusBarStyle ?? EFNavigationBar.defaultStatusBarStyle
    }
    
    func setNeedsNavigationBarUpdate(backgroundImage: UIImage) {
        navigationBar.ef_setBackgroundImage(image: backgroundImage)
    }
    
    func setNeedsNavigationBarUpdate(barTintColor: UIColor) {
        navigationBar.ef_setBackgroundColor(color: barTintColor)
    }
    
    func setNeedsNavigationBarUpdate(barBackgroundAlpha: CGFloat) {
        navigationBar.ef_setBackgroundAlpha(alpha: barBackgroundAlpha)
    }
    
    func setNeedsNavigationBarUpdate(tintColor: UIColor) {
        navigationBar.tintColor = tintColor
    }
    
    func setNeedsNavigationBarUpdate(hideShadowImage: Bool) {
        navigationBar.shadowImage = (hideShadowImage == true) ? UIImage() : nil
    }
    
    func setNeedsNavigationBarUpdate(titleColor: UIColor) {
        guard let titleTextAttributes = navigationBar.titleTextAttributes else {
            navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor:titleColor]
            return
        }
        
        var newTitleTextAttributes = titleTextAttributes
        newTitleTextAttributes.updateValue(titleColor, forKey: NSAttributedString.Key.foregroundColor)
        navigationBar.titleTextAttributes = newTitleTextAttributes
    }
    
    func updateNavigationBar(fromVC: UIViewController?, toVC: UIViewController?, progress: CGFloat) {
        // change navBarBarTintColor
        let fromBarTintColor: UIColor = fromVC?.navBarBarTintColor ?? EFNavigationBar.defaultNavBarBarTintColor
        let toBarTintColor: UIColor = toVC?.navBarBarTintColor ?? EFNavigationBar.defaultNavBarBarTintColor
        let newBarTintColor: UIColor = fromVC?.navBarTransition.mappingColor(fromColor: fromBarTintColor, toColor: toBarTintColor, percent: progress) ?? fromBarTintColor
        setNeedsNavigationBarUpdate(barTintColor: newBarTintColor)
        
        // change navBarTintColor
        let fromTintColor: UIColor = fromVC?.navBarTintColor ?? EFNavigationBar.defaultNavBarTintColor
        let toTintColor: UIColor = toVC?.navBarTintColor ?? EFNavigationBar.defaultNavBarTintColor
        let newTintColor: UIColor = fromVC?.navBarTransition.mappingColor(fromColor: fromTintColor, toColor: toTintColor, percent: progress) ?? fromTintColor
        setNeedsNavigationBarUpdate(tintColor: newTintColor)
        
        // change navBarTitleColor
        //        let fromTitleColor = fromVC?.navBarTitleColor ?? EFNavigationBar.defaultNavBarTitleColor
        //        let toTitleColor = toVC?.navBarTitleColor ?? EFNavigationBar.defaultNavBarTitleColor
        //        let newTitleColor = fromVC?.navBarTransition.mappingColor(fromColor: fromTitleColor, toColor: toTitleColor, percent: progress) ?? fromTitleColor
        //        setNeedsNavigationBarUpdate(titleColor: newTitleColor)
        
        // change navBar _UIBarBackground alpha
        let fromBarBackgroundAlpha: CGFloat = fromVC?.navBarBackgroundAlpha ?? EFNavigationBar.defaultBackgroundAlpha
        let toBarBackgroundAlpha: CGFloat = toVC?.navBarBackgroundAlpha ?? EFNavigationBar.defaultBackgroundAlpha
        let newBarBackgroundAlpha: CGFloat = fromVC?.navBarTransition.mappingAlpha(fromAlpha: fromBarBackgroundAlpha, toAlpha: toBarBackgroundAlpha, percent: progress) ?? fromBarBackgroundAlpha
        setNeedsNavigationBarUpdate(barBackgroundAlpha: newBarBackgroundAlpha)
    }
    
    // call swizzling methods active 主动调用交换方法
    public static func fatherAwake() {
        DispatchQueue.once() {
            let needSwizzleSelectorArr = [
                NSSelectorFromString("_updateInteractiveTransition:"),
                #selector(popToViewController),
                #selector(popToRootViewController),
                #selector(pushViewController)
            ]
            
            for selector in needSwizzleSelectorArr {
                // _updateInteractiveTransition:  =>  ef_updateInteractiveTransition:
                let str = ("ef_" + selector.description).replacingOccurrences(of: "__", with: "_")
                if let originalMethod = class_getInstanceMethod(self, selector),
                    let swizzledMethod = class_getInstanceMethod(self, Selector(str)) {
                    method_exchangeImplementations(originalMethod, swizzledMethod)
                }
            }
        }
    }
    
    //==========================================================================
    // MARK: swizzling pop
    //==========================================================================
    struct popProperties {
        static let popDuration = 0.13
        static var displayCount = 0
        static var popProgress: CGFloat {
            let all: CGFloat = CGFloat(60.0 * popDuration)
            let current = min(all, CGFloat(displayCount))
            return current / all
        }
    }
    
    // swizzling system method: popToViewController
    @objc func ef_popToViewController(_ viewController: UIViewController, animated: Bool) -> [UIViewController]? {
        setNeedsNavigationBarUpdate(titleColor: viewController.navBarTitleColor)
        var displayLink: CADisplayLink? = CADisplayLink(target: self, selector: #selector(popNeedDisplay))
        // UITrackingRunLoopMode: 界面跟踪 Mode，用于 ScrollView 追踪触摸滑动，保证界面滑动时不受其他 Mode 影响
        // NSRunLoopCommonModes contains kCFRunLoopDefaultMode and UITrackingRunLoopMode
        displayLink?.add(to: RunLoop.main, forMode: RunLoop.Mode.common)
        CATransaction.setCompletionBlock {
            displayLink?.invalidate()
            displayLink = nil
            popProperties.displayCount = 0
        }
        CATransaction.setAnimationDuration(popProperties.popDuration)
        CATransaction.begin()
        let vcs = ef_popToViewController(viewController, animated: animated)
        CATransaction.commit()
        return vcs
    }
    
    // swizzling system method: popToRootViewControllerAnimated
    @objc func ef_popToRootViewControllerAnimated(_ animated: Bool) -> [UIViewController]? {
        var displayLink: CADisplayLink? = CADisplayLink(target: self, selector: #selector(popNeedDisplay))
        displayLink?.add(to: RunLoop.main, forMode: RunLoop.Mode.common)
        CATransaction.setCompletionBlock {
            displayLink?.invalidate()
            displayLink = nil
            popProperties.displayCount = 0
        }
        CATransaction.setAnimationDuration(popProperties.popDuration)
        CATransaction.begin()
        let vcs = ef_popToRootViewControllerAnimated(animated)
        CATransaction.commit()
        return vcs
    }
    
    // change navigationBar barTintColor smooth before pop to current VC finished
    @objc  func popNeedDisplay() {
        guard let topViewController = topViewController, let coordinator = topViewController.transitionCoordinator else {
            return
        }
        
        popProperties.displayCount += 1
        let popProgress = popProperties.popProgress
        // print("第\(popProperties.displayCount)次pop的进度：\(popProgress)")
        let fromVC = coordinator.viewController(forKey: .from)
        let toVC = coordinator.viewController(forKey: .to)
        updateNavigationBar(fromVC: fromVC, toVC: toVC, progress: popProgress)
    }
    
    
    //==========================================================================
    // MARK: swizzling push
    //==========================================================================
    struct pushProperties {
        static let pushDuration = 0.13
        static var displayCount = 0
        static var pushProgress: CGFloat {
            let all: CGFloat = CGFloat(60.0 * pushDuration)
            let current = min(all, CGFloat(displayCount))
            return current / all
        }
    }
    
    // swizzling system method: pushViewController
    @objc func ef_pushViewController(_ viewController: UIViewController, animated: Bool) {
        var displayLink: CADisplayLink? = CADisplayLink(target: self, selector: #selector(pushNeedDisplay))
        displayLink?.add(to: RunLoop.main, forMode: RunLoop.Mode.common)
        CATransaction.setCompletionBlock {
            displayLink?.invalidate()
            displayLink = nil
            pushProperties.displayCount = 0
            viewController.pushToCurrentVCFinished = true
        }
        CATransaction.setAnimationDuration(pushProperties.pushDuration)
        CATransaction.begin()
        ef_pushViewController(viewController, animated: animated)
        CATransaction.commit()
    }
    
    // change navigationBar barTintColor smooth before push to current VC finished or before pop to current VC finished
    @objc  func pushNeedDisplay() {
        guard let topViewController = topViewController,
            let coordinator       = topViewController.transitionCoordinator else {
                return
        }
        
        pushProperties.displayCount += 1
        let pushProgress = pushProperties.pushProgress
        // print("第\(pushProperties.displayCount)次push的进度：\(pushProgress)")
        let fromVC = coordinator.viewController(forKey: .from)
        let toVC = coordinator.viewController(forKey: .to)
        updateNavigationBar(fromVC: fromVC, toVC: toVC, progress: pushProgress)
    }
}

//==========================================================================
// MARK: - deal the gesture of return
//==========================================================================
extension UINavigationController: UINavigationBarDelegate {
    public func navigationBar(_ navigationBar: UINavigationBar, shouldPop item: UINavigationItem) -> Bool {
        if let topVC = topViewController,
            let coor = topVC.transitionCoordinator, coor.initiallyInteractive {
            if #available(iOS 10.0, *) {
                coor.notifyWhenInteractionChanges({ (context) in
                    self.dealInteractionChanges(context)
                })
            } else {
                coor.notifyWhenInteractionEnds({ (context) in
                    self.dealInteractionChanges(context)
                })
            }
            return true
        }
        
        let itemCount = navigationBar.items?.count ?? 0
        let n = viewControllers.count >= itemCount ? 2 : 1
        let popToVC = viewControllers[viewControllers.count - n]
        
        popToViewController(popToVC, animated: true)
        return true
    }
    
    // deal the gesture of return break off
    private func dealInteractionChanges(_ context: UIViewControllerTransitionCoordinatorContext) {
        let animations: (UITransitionContextViewControllerKey) -> () = {
            let curColor = context.viewController(forKey: $0)?.navBarBarTintColor ?? EFNavigationBar.defaultNavBarBarTintColor
            let curAlpha = context.viewController(forKey: $0)?.navBarBackgroundAlpha ?? EFNavigationBar.defaultBackgroundAlpha
            
            self.setNeedsNavigationBarUpdate(barTintColor: curColor)
            self.setNeedsNavigationBarUpdate(barBackgroundAlpha: curAlpha)
        }
        
        // after that, cancel the gesture of return
        if context.isCancelled {
            let cancelDuration: TimeInterval = context.transitionDuration * Double(context.percentComplete)
            UIView.animate(withDuration: cancelDuration) {
                animations(.from)
            }
        } else {
            // after that, finish the gesture of return
            let finishDuration: TimeInterval = context.transitionDuration * Double(1 - context.percentComplete)
            UIView.animate(withDuration: finishDuration) {
                animations(.to)
            }
        }
    }
    
    // swizzling system method: _updateInteractiveTransition
    @objc func ef_updateInteractiveTransition(_ percentComplete: CGFloat) {
        guard let topViewController = topViewController,
            let coordinator       = topViewController.transitionCoordinator else {
                ef_updateInteractiveTransition(percentComplete)
                return
        }
        
        let fromVC = coordinator.viewController(forKey: .from)
        let toVC = coordinator.viewController(forKey: .to)
        updateNavigationBar(fromVC: fromVC, toVC: toVC, progress: percentComplete)
        
        ef_updateInteractiveTransition(percentComplete)
    }
}
