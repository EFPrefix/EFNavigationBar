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

    public static var defaultNavBarBarTintColor: UIColor = UIColor.white
    public static var defaultNavBarBackgroundImage: UIImage? = nil
    public static var defaultNavBarTintColor: UIColor = UIColor(red: 0, green: 0.478431, blue: 1, alpha: 1.0)
    public static var defaultNavBarTitleColor: UIColor = UIColor.black
    public static var defaultStatusBarStyle: UIStatusBarStyle = UIStatusBarStyle.default
    public static var defaultShadowImageHidden: Bool = false
    public static var defaultTransition: EFTransition = EFTransitionMethod.linear
    public static var defaultBackgroundAlpha: CGFloat = 1.0

    public static var defaultNavBarBottom: CGFloat = UIDevice.isiPhoneXSeries ? 88 : 64
    public static var defaultTabBarHeight: CGFloat = UIDevice.isiPhoneXSeries ? 83 : 49
}
