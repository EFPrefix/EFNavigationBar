![](Assets/EFNavigationBar.png)

[![CI Status](https://img.shields.io/travis/EFPrefix/EFNavigationBar.svg?style=flat)](https://travis-ci.org/EFPrefix/EFNavigationBar)
[![Version](https://img.shields.io/cocoapods/v/EFNavigationBar.svg?style=flat)](https://cocoapods.org/pods/EFNavigationBar)
[![License](https://img.shields.io/cocoapods/l/EFNavigationBar.svg?style=flat)](https://cocoapods.org/pods/EFNavigationBar)
[![Platform](https://img.shields.io/cocoapods/p/EFNavigationBar.svg?style=flat)](https://cocoapods.org/pods/EFNavigationBar)

An ordinary custom navigation bar.

> [中文介绍](README_CN.md)

## Overview

|Gradation|Image|Weibo|Q Zone|
|:-:|:-:|:-:|:-:|
|![](Assets/导航栏显示渐变色.gif)|![](Assets/导航栏显示图片.gif)|![](Assets/新浪微博个人中心.gif)|![](Assets/qq空间.gif)|

|Zhihu|QQ|Alipay|Transparent gradient|
|:-:|:-:|:-:|:-:|
|![](Assets/知乎日报.gif)|![](Assets/QQ我的资料页.gif)|![](Assets/蚂蚁森林.gif)|![](Assets/连续多个界面导航栏透明.gif)|

## Example

To run the example project, clone the repo, and run `pod install` from the Example directory first.

## Requirements

- iOS 8+
- Xcode 8+

## Installation

EFNavigationBar is available through [CocoaPods](https://cocoapods.org). To install
it, simply add the following line to your Podfile:

```ruby
pod 'EFNavigationBar'
```

## Use

For more details, see the `Example` project：

```swift
navBarBarTintColor = .white
navBarBackgroundAlpha = alpha
navBarTintColor = UIColor(red: 0, green: 0.478431, blue: 1, alpha: 1.0)
navBarTitleColor = .black
statusBarStyle = .default
navBarShadowImageHidden = true

EFNavigationBar.defaultNavBarBarTintColor = UIColor.init(red: 0 / 255.0, green: 175 / 255.0, blue: 240 / 255.0, alpha: 1)
EFNavigationBar.defaultNavBarTintColor = .white
EFNavigationBar.defaultNavBarTitleColor = .white
EFNavigationBar.defaultStatusBarStyle = .lightContent
EFNavigationBar.defaultShadowImageHidden = true
```

## Other

- The original code of [EFNavigationBar](https://github.com/EFPrefix/EFNavigationBar) come from [WRNavigationBar_swift](https://github.com/wangrui460/WRNavigationBar_swift/commit/a445f74ac57d675f87a60a49a745c5a3b01b6324), since the `WRNavigationBar_swift` project seems to be no longer maintained, so `EFNavigationBar` project has been established;
- For Objective-C version, see [WRNavigationBar](https://github.com/wangrui460/WRNavigationBar).

## Maintainer

EyreFree, eyrefree@eyrefree.org

## License

<img src="https://upload.wikimedia.org/wikipedia/commons/thumb/f/f8/License_icon-mit-88x31-2.svg/128px-License_icon-mit-88x31-2.svg.png">

EFNavigationBar is available under the MIT license. See the [LICENSE](LICENSE) file for more info.
