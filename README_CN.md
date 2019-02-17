# EFNavigationBar

[![CI Status](https://img.shields.io/travis/EFPrefix/EFNavigationBar.svg?style=flat)](https://travis-ci.org/EFPrefix/EFNavigationBar)
[![Version](https://img.shields.io/cocoapods/v/EFNavigationBar.svg?style=flat)](https://cocoapods.org/pods/EFNavigationBar)
[![License](https://img.shields.io/cocoapods/l/EFNavigationBar.svg?style=flat)](https://cocoapods.org/pods/EFNavigationBar)
[![Platform](https://img.shields.io/cocoapods/p/EFNavigationBar.svg?style=flat)](https://cocoapods.org/pods/EFNavigationBar)
[![QQ Group](https://img.shields.io/badge/QQ群-769966374-32befc.svg?logo=data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAA4AAAAQCAMAAAARSr4IAAAA4VBMVEUAAAAAAAAAAAD3rwgAAAAAAADpICBuTQNUDAwAAAAAAAAAAAAAAADnICAAAAAAAACbFRUAAAD5rgkfFgEAAADHGxu1GBhGOyQ6LhMPCgAAAAB0UQRbDAziHh7hHh5HRUEAAAAPAgIQCwEQEBAdBAQgICAvIQIvLy8+LAJAQEBJCgpWRBpbW1tfX19gYGBqZVptTARvb299VwSAgICEhISHh4ePhnGbbAWgoKCseAawsLC7gwbAwMDExMTFrKzLjgfoHx/powfqpAjvZGTw8PDxcnLxenrzj4/5rgj5x8f///9y6ONcAAAAIHRSTlMAECAgMEBQVlhggZGhobHBwdHR3eHh4+fp7/Hx9/f5+3tefS0AAACkSURBVHjaNc1FAsJAEAXRDj64BAv2IbgEd2s0gfsfiJkAtXurIpkWMQBd0K8O3KZfhWEeW9YB8LnUYY2Gi6WJqJIHwKo7GAMpRT/aV0d2BhRD/Xp7tt9OGs2yYoy5mpUxc0BOc/yvkiQSwJPZtu3XCdAoDtjMb5k8C9KN1utx+zFChsD97bYzRII0Ss2/7IUliILFjZKV8ZLM61xK+V6tsHbSRB+BYB6Vhuib7wAAAABJRU5ErkJggg==)](http://shang.qq.com/wpa/qunwpa?idkey=d0f732585dcb0c6f2eb26bc9e0327f6305d18260eeba89ed26a201b520c572c0)

一个普通的自定义导航栏。

> [English Introduction](README.md)

## 概述

|导航栏显示渐变色|导航栏显示图片|新浪微博个人中心|QQ 空间|
|:-:|:-:|:-:|:-:|
|![](Assets/导航栏显示渐变色.gif)|![](Assets/导航栏显示图片.gif)|![](Assets/新浪微博个人中心.gif)|![](Assets/qq空间.gif)|

|知乎日报|QQ 我的资料页|蚂蚁森林|连续多个界面导航栏透明|
|:-:|:-:|:-:|:-:|
|![](Assets/知乎日报.gif)|![](Assets/QQ我的资料页.gif)|![](Assets/蚂蚁森林.gif)|![](Assets/连续多个界面导航栏透明.gif)|

## 示例

1. 利用 `git clone` 命令下载本仓库；
2. 利用 cd 命令切换到 Example 目录下，执行 `pod install` 命令；
3. 随后打开 `EFNavigationBar.xcworkspace` 编译即可。

或执行以下命令：

```bash
git clone git@github.com:EFPrefix/EFNavigationBar.git; cd EFNavigationBar/Example; pod install; open EFNavigationBar.xcworkspace
```

## 环境

- iOS 8.0+
- Xcode 8.0+

## 安装

EFNavigationBar 可以通过 [CocoaPods](http://cocoapods.org) 进行获取。只需要在你的 Podfile 中添加如下代码就能实现引入：

```ruby
pod 'EFNavigationBar'
```

然后，执行如下命令即可：

```bash
pod install
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

// 设置导航栏默认的背景颜色
EFNavigationBar.defaultNavBarBarTintColor = UIColor.init(red: 0 / 255.0, green: 175 / 255.0, blue: 240 / 255.0, alpha: 1)
// 设置导航栏所有按钮的默认颜色
EFNavigationBar.defaultNavBarTintColor = .white
// 设置导航栏标题默认颜色
EFNavigationBar.defaultNavBarTitleColor = .white
// 统一设置状态栏样式
EFNavigationBar.defaultStatusBarStyle = .lightContent
// 如果需要设置导航栏底部分割线隐藏，可以在这里统一设置
EFNavigationBar.defaultShadowImageHidden = true
```

## 其它

- [EFNavigationBar](https://github.com/EFPrefix/EFNavigationBar) 基于 [WRNavigationBar_swift](https://github.com/wangrui460/WRNavigationBar_swift/commit/a445f74ac57d675f87a60a49a745c5a3b01b6324) 进行开发，由于 `WRNavigationBar_swift` 似乎已长时间无人维护，所以建立了本项目；
- 对等的 Objective-C 版本，可查看 [WRNavigationBar](https://github.com/wangrui460/WRNavigationBar)。

## 维护者

EyreFree, eyrefree@eyrefree.org

## 协议

<img src="https://upload.wikimedia.org/wikipedia/commons/thumb/f/f8/License_icon-mit-88x31-2.svg/128px-License_icon-mit-88x31-2.svg.png">

EFNavigationBar 基于 MIT 协议进行分发和使用，更多信息参见 [协议文件](LICENSE)。
