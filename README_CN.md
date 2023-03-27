![](https://github.com/EFPrefix/EFNavigationBar/blob/master/Assets/EFNavigationBar.png)

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
    <a href="https://shang.qq.com/wpa/qunwpa?idkey=d0f732585dcb0c6f2eb26bc9e0327f6305d18260eeba89ed26a201b520c572c0">
        <img src="https://img.shields.io/badge/Q群-769966374-32befc.svg?logo=data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAA4AAAAQCAMAAAARSr4IAAAA4VBMVEUAAAAAAAAAAAD3rwgAAAAAAADpICBuTQNUDAwAAAAAAAAAAAAAAADnICAAAAAAAACbFRUAAAD5rgkfFgEAAADHGxu1GBhGOyQ6LhMPCgAAAAB0UQRbDAziHh7hHh5HRUEAAAAPAgIQCwEQEBAdBAQgICAvIQIvLy8+LAJAQEBJCgpWRBpbW1tfX19gYGBqZVptTARvb299VwSAgICEhISHh4ePhnGbbAWgoKCseAawsLC7gwbAwMDExMTFrKzLjgfoHx/powfqpAjvZGTw8PDxcnLxenrzj4/5rgj5x8f///9y6ONcAAAAIHRSTlMAECAgMEBQVlhggZGhobHBwdHR3eHh4+fp7/Hx9/f5+3tefS0AAACkSURBVHjaNc1FAsJAEAXRDj64BAv2IbgEd2s0gfsfiJkAtXurIpkWMQBd0K8O3KZfhWEeW9YB8LnUYY2Gi6WJqJIHwKo7GAMpRT/aV0d2BhRD/Xp7tt9OGs2yYoy5mpUxc0BOc/yvkiQSwJPZtu3XCdAoDtjMb5k8C9KN1utx+zFChsD97bYzRII0Ss2/7IUliILFjZKV8ZLM61xK+V6tsHbSRB+BYB6Vhuib7wAAAABJRU5ErkJggg==">
    </a>
</p>

一个普通的自定义导航栏。

> [English Introduction](README.md)

## 概述

|导航栏显示渐变色|导航栏显示图片|新浪微博个人中心|QQ 空间|
|:-:|:-:|:-:|:-:|
|![](https://github.com/EFPrefix/EFNavigationBar/blob/master/Assets/导航栏显示渐变色.gif)|![](https://github.com/EFPrefix/EFNavigationBar/blob/master/Assets/导航栏显示图片.gif)|![](https://github.com/EFPrefix/EFNavigationBar/blob/master/Assets/新浪微博个人中心.gif)|![](https://github.com/EFPrefix/EFNavigationBar/blob/master/Assets/qq空间.gif)|

|知乎日报|QQ 我的资料页|蚂蚁森林|连续多个界面导航栏透明|
|:-:|:-:|:-:|:-:|
|![](https://github.com/EFPrefix/EFNavigationBar/blob/master/Assets/知乎日报.gif)|![](https://github.com/EFPrefix/EFNavigationBar/blob/master/Assets/QQ我的资料页.gif)|![](https://github.com/EFPrefix/EFNavigationBar/blob/master/Assets/蚂蚁森林.gif)|![](https://github.com/EFPrefix/EFNavigationBar/blob/master/Assets/连续多个界面导航栏透明.gif)|

## 示例

1. 利用 `git clone` 命令下载本仓库；
2. 利用 cd 命令切换到 Example 目录下，执行 `pod install` 命令；
3. 随后打开 `EFNavigationBar.xcworkspace` 编译即可。

或执行以下命令：

```bash
git clone git@github.com:EFPrefix/EFNavigationBar.git; cd EFNavigationBar/Example; pod install; open EFNavigationBar.xcworkspace
```

## 环境

| 版本   | 需求                                  |
|:------|:--------------------------------------|
| <5.0  | Xcode 10.0+<br>Swift 4.2+<br>iOS 8.0+ |
| 5.x   | Xcode 10.2+<br>Swift 5.0+<br>iOS 9.3+ |

## 安装

### CocoaPods

EFNavigationBar 可以通过 [CocoaPods](http://cocoapods.org) 进行获取。只需要在你的 Podfile 中添加如下代码就能实现引入：

```ruby
pod 'EFNavigationBar'
```

然后，执行如下命令即可：

```bash
pod install
```

### Swift Package Manager

[Swift Package Manager](https://swift.org/package-manager/) 是一个集成在 Swift 编译器中的用来进行 Swift 代码自动化发布的工具。

如果你已经建立了你的 Swift 包，将 EFNavigationBar 加入依赖是十分容易的，只需要将其添加到你的 `Package.swift` 文件的 `dependencies` 项中即可：

```swift
dependencies: [
    .package(url: "https://github.com/EFPrefix/EFNavigationBar.git", .upToNextMinor(from: "5.2.4"))
]
```

## 使用

更多具体使用方法细节，请参考 Example 工程：

```swift
// 一行代码搞定导航栏颜色
navBarBarTintColor = .white
// 一行代码搞定导航栏透明度
navBarBackgroundAlpha = alpha
// 一行代码搞定导航栏两边按钮颜色
navBarTintColor = UIColor(red: 0, green: 0.478431, blue: 1, alpha: 1.0)
// 一行代码搞定导航栏上标题颜色
navBarTitleColor = .black
// 一行代码搞定状态栏是 default 还是 lightContent
statusBarStyle = .default
// 一行代码搞定导航栏底部分割线是否隐藏
navBarShadowImageHidden = true
// 导航栏转场过渡
navBarTransition = .linear

// 设置导航栏默认的背景颜色
EFNavigationBar.defaultStyle.backgroundColor = UIColor.white
// 设置导航栏标题默认颜色
EFNavigationBar.defaultStyle.titleColor = UIColor.black
// 统一设置状态栏样式
EFNavigationBar.defaultStyle.statusBarStyle = UIStatusBarStyle.default
```

## 其它

- [EFNavigationBar](https://github.com/EFPrefix/EFNavigationBar) 基于 [WRNavigationBar_swift](https://github.com/wangrui460/WRNavigationBar_swift/commit/a445f74ac57d675f87a60a49a745c5a3b01b6324) 进行开发；
- 对等的 Objective-C 版本，可查看 [WRNavigationBar](https://github.com/wangrui460/WRNavigationBar)。

## 维护者

EyreFree, eyrefree@eyrefree.org

## 协议

<img src="https://upload.wikimedia.org/wikipedia/commons/thumb/f/f8/License_icon-mit-88x31-2.svg/128px-License_icon-mit-88x31-2.svg.png">

EFNavigationBar 基于 MIT 协议进行分发和使用，更多信息参见 [协议文件](https://github.com/EFPrefix/EFNavigationBar/blob/master/LICENSE)。
