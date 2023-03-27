![](https://raw.githubusercontent.com/EFPrefix/EFNavigationBar/master/Assets/EFNavigationBar.png)

<p align="center">
    <a href="https://travis-ci.org/EFPrefix/EFNavigationBar">
    	<img src="https://img.shields.io/travis/EFPrefix/EFNavigationBar.svg">
    </a>
    <a href="https://swiftpackageindex.com/EFPrefix/EFNavigationBar">
        <img src="https://img.shields.io/badge/SPM-ready-orange.svg">
    </a>
    <a href="https://cocoapods.org/pods/EFNavigationBar">
    	<img src="https://img.shields.io/cocoapods/v/EFNavigationBar.svg?style=flat">
    </a>
    <a href="https://cocoapods.org/pods/EFNavigationBar">
    	<img src="https://img.shields.io/cocoapods/p/EFNavigationBar.svg?style=flat">
    </a>
    <a href="https://github.com/apple/swift">
    	<img src="https://img.shields.io/badge/language-swift-orange.svg">
    </a>
    <a href="https://raw.githubusercontent.com/EFPrefix/EFNavigationBar/master/LICENSE">
    	<img src="https://img.shields.io/cocoapods/l/EFNavigationBar.svg?style=flat">
    </a>
    <a href="https://twitter.com/EyreFree777">
    	<img src="https://img.shields.io/badge/twitter-@EyreFree777-blue.svg?style=flat">
    </a>
    <a href="https://www.weibo.com/eyrefree777">
    	<img src="https://img.shields.io/badge/weibo-@EyreFree-red.svg?style=flat">
    </a>
</p>

An ordinary custom navigation bar.

> [中文介绍](https://github.com/EFPrefix/EFNavigationBar/blob/master/README_CN.md)

## Overview

|Gradation|Image|Weibo|Q Zone|
|:-:|:-:|:-:|:-:|
|![](https://github.com/EFPrefix/EFNavigationBar/blob/master/Assets/导航栏显示渐变色.gif)|![](https://github.com/EFPrefix/EFNavigationBar/blob/master/Assets/导航栏显示图片.gif)|![](https://github.com/EFPrefix/EFNavigationBar/blob/master/Assets/新浪微博个人中心.gif)|![](https://github.com/EFPrefix/EFNavigationBar/blob/master/Assets/qq空间.gif)|

|Zhihu|QQ|Alipay|Transparent gradient|
|:-:|:-:|:-:|:-:|
|![](https://github.com/EFPrefix/EFNavigationBar/blob/master/Assets/知乎日报.gif)|![](https://github.com/EFPrefix/EFNavigationBar/blob/master/Assets/QQ我的资料页.gif)|![](https://github.com/EFPrefix/EFNavigationBar/blob/master/Assets/蚂蚁森林.gif)|![](https://github.com/EFPrefix/EFNavigationBar/blob/master/Assets/连续多个界面导航栏透明.gif)|

## Example

To run the example project, clone the repo, and run `pod install` from the Example directory first.

## Requirements

| Version | Needs                                 |
|:--------|:--------------------------------------|
| <5.0    | Xcode 10.0+<br>Swift 4.2+<br>iOS 8.0+ |
| 5.x     | Xcode 10.2+<br>Swift 5.0+<br>iOS 9.3+ |

## Installation

### CocoaPods

EFNavigationBar is available through [CocoaPods](https://cocoapods.org). To install
it, simply add the following line to your Podfile:

```ruby
pod 'EFNavigationBar'
```

### Swift Package Manager

The [Swift Package Manager](https://swift.org/package-manager/) is a tool for automating the distribution of Swift code and is integrated into the Swift compiler.

Once you have your Swift package set up, adding EFNavigationBar as a dependency is as easy as adding it to the `dependencies` value of your `Package.swift`.

```swift
dependencies: [
    .package(url: "https://github.com/EFPrefix/EFNavigationBar.git", .upToNextMinor(from: "5.1.4"))
]
```

## Use

For more details, see the `Example` project：

```swift
// Part
navBarBarTintColor = .white
navBarBackgroundAlpha = alpha
navBarTintColor = UIColor(red: 0, green: 0.478431, blue: 1, alpha: 1.0)
navBarTitleColor = .black
statusBarStyle = .default
navBarShadowImageHidden = true
navBarTransition = .linear

// Global
EFNavigationBar.defaultStyle.backgroundColor = UIColor.white
EFNavigationBar.defaultStyle.titleColor = UIColor.black
EFNavigationBar.defaultStyle.statusBarStyle = UIStatusBarStyle.default
```

## Other

- [EFNavigationBar](https://github.com/EFPrefix/EFNavigationBar) based on [WRNavigationBar_swift](https://github.com/wangrui460/WRNavigationBar_swift/commit/a445f74ac57d675f87a60a49a745c5a3b01b6324);
- For Objective-C version, see [WRNavigationBar](https://github.com/wangrui460/WRNavigationBar).

## Maintainer

EyreFree, eyrefree@eyrefree.org

## License

<img src="https://upload.wikimedia.org/wikipedia/commons/thumb/f/f8/License_icon-mit-88x31-2.svg/128px-License_icon-mit-88x31-2.svg.png">

EFNavigationBar is available under the MIT license. See the [LICENSE](https://github.com/EFPrefix/EFNavigationBar/blob/master/LICENSE) file for more info.
