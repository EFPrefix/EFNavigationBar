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

public class EFNavigationBar: UIView {

    public static var defaultNavBarBackgroundColor: UIColor = UIColor.white
    public static var defaultNavBarTitleColor: UIColor = UIColor.black
    public static var defaultNavBarTitleSize: CGFloat = 18
    public static var defaultStatusBarStyle: UIStatusBarStyle = UIStatusBarStyle.default

    public static var defaultNavBarBottom: CGFloat = UIDevice.isiPhoneXSeries ? 88 : 64
    public static var defaultTabBarHeight: CGFloat = UIDevice.isiPhoneXSeries ? 83 : 49

    public var onClickLeftButton:(()->())?
    public var onClickRightButton:(()->())?
    public var title: String? {
        willSet {
            titleLabel.isHidden = false
            titleLabel.text = newValue
        }
    }
    public var titleLabelColor: UIColor? {
        willSet {
            titleLabel.textColor = newValue
        }
    }
    public var titleLabelFont: UIFont? {
        willSet {
            titleLabel.font = newValue
        }
    }
    public var barBackgroundColor: UIColor? {
        willSet {
            backgroundImageView.isHidden = true
            backgroundView.isHidden = false
            backgroundView.backgroundColor = newValue
        }
    }
    public var barBackgroundImage: UIImage? {
        willSet {
            backgroundView.isHidden = true
            backgroundImageView.isHidden = false
            backgroundImageView.image = newValue
        }
    }

    //  UI variable
    lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.textColor = EFNavigationBar.defaultNavBarTitleColor
        label.font = UIFont.systemFont(ofSize: EFNavigationBar.defaultNavBarTitleSize)
        label.textAlignment = .center
        label.isHidden = true
        return label
    }()

    public lazy var leftButton: UIButton = {
        let button = UIButton()
        button.imageView?.contentMode = .center
        button.isHidden = true
        button.addTarget(self, action: #selector(clickLeft), for: .touchUpInside)
        return button
    }()

    public lazy var rightButton: UIButton = {
        let button = UIButton()
        button.imageView?.contentMode = .center
        button.isHidden = true
        button.addTarget(self, action: #selector(clickRight), for: .touchUpInside)
        return button
    }()

    lazy var bottomLine: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor(red: 218.0 / 255.0, green: 218.0 / 255.0, blue: 218.0 / 255.0, alpha: 1.0)
        return view
    }()

    lazy var backgroundView: UIView = {
        let view = UIView()
        return view
    }()

    lazy var backgroundImageView: UIImageView = {
        let imgView = UIImageView()
        imgView.isHidden = true
        return imgView
    }()

    //  other variable
    static var navBarBottom: CGFloat = EFNavigationBar.defaultNavBarBottom

    // init
    public class func CustomNavigationBar() -> EFNavigationBar {
        let frame = CGRect(x: 0, y: 0, width: UIScreen.main.bounds.size.width, height: CGFloat(navBarBottom))
        return EFNavigationBar(frame: frame)
    }
    public override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }
    public required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setupView()
    }

    public func setupView() {
        addSubview(backgroundView)
        addSubview(backgroundImageView)
        addSubview(leftButton)
        addSubview(titleLabel)
        addSubview(rightButton)
        addSubview(bottomLine)
        updateFrame()
        backgroundColor = UIColor.clear
        backgroundView.backgroundColor = EFNavigationBar.defaultNavBarBackgroundColor
    }
    public func updateFrame() {
        let top: CGFloat = UIDevice.isiPhoneXSeries ? 44 : 20
        let margin: CGFloat = 0
        let buttonHeight: CGFloat = 44
        let buttonWidth: CGFloat = 44
        let titleLabelHeight: CGFloat = 44
        let titleLabelWidth: CGFloat = 180

        backgroundView.frame = self.bounds
        backgroundImageView.frame = self.bounds
        leftButton.frame = CGRect(x: margin, y: top, width: buttonWidth, height: buttonHeight)
        rightButton.frame = CGRect(x: UIScreen.main.bounds.size.width - buttonWidth - margin, y: top, width: buttonWidth, height: buttonHeight)
        titleLabel.frame = CGRect(x: (UIScreen.main.bounds.size.width - titleLabelWidth) / 2.0, y: top, width: titleLabelWidth, height: titleLabelHeight)
        bottomLine.frame = CGRect(x: 0, y: bounds.height - 0.5, width: UIScreen.main.bounds.size.width, height: 0.5)
    }
}

public extension EFNavigationBar {
    func setBottomLineHidden(hidden: Bool) {
        bottomLine.isHidden = hidden
    }
    func setBackgroundAlpha(alpha: CGFloat) {
        backgroundView.alpha = alpha
        backgroundImageView.alpha = alpha
        bottomLine.alpha = alpha
    }
    func setTintColor(color: UIColor) {
        leftButton.setTitleColor(color, for: .normal)
        rightButton.setTitleColor(color, for: .normal)
        titleLabel.textColor = color
    }

    // 左右按钮共有方法
    func setLeftButton(normal: UIImage, highlighted: UIImage) {
        setLeftButton(normal: normal, highlighted: highlighted, title: nil, titleColor: nil)
    }
    func setLeftButton(image: UIImage) {
        setLeftButton(normal: image, highlighted: image, title: nil, titleColor: nil)
    }
    func setLeftButton(title: String, titleColor: UIColor) {
        setLeftButton(normal: nil, highlighted: nil, title: title, titleColor: titleColor)
    }

    func setRightButton(normal: UIImage, highlighted: UIImage) {
        setRightButton(normal: normal, highlighted: highlighted, title: nil, titleColor: nil)
    }
    func setRightButton(image: UIImage) {
        setRightButton(normal: image, highlighted: image, title: nil, titleColor: nil)
    }
    func setRightButton(title: String, titleColor: UIColor) {
        setRightButton(normal: nil, highlighted: nil, title: title, titleColor: titleColor)
    }

    // 左右按钮私有方法
    private func setLeftButton(normal: UIImage?, highlighted: UIImage?, title: String?, titleColor: UIColor?) {
        setButton(isLeft: true, normal: normal, highlighted: highlighted, title: title, titleColor: titleColor)
    }
    private func setRightButton(normal: UIImage?, highlighted: UIImage?, title: String?, titleColor: UIColor?) {
        setButton(isLeft: false, normal: normal, highlighted: highlighted, title: title, titleColor: titleColor)
    }
    private func setButton(isLeft: Bool, normal: UIImage?, highlighted: UIImage?, title: String?, titleColor: UIColor?) {
        let button: UIButton = isLeft ? leftButton : rightButton
        button.isHidden = false
        button.setImage(normal, for: .normal)
        button.setImage(highlighted, for: .highlighted)
        button.setTitle(title, for: .normal)
        button.setTitleColor(titleColor, for: .normal)
    }
}

// MARK: - 导航栏左右按钮事件
public extension EFNavigationBar {

    @objc func clickLeft() {
        if let onClickLeft = onClickLeftButton {
            onClickLeft()
        } else {
            let currentVC = UIViewController.currentViewController()
            currentVC.gotoLastViewController(animated: true)
        }
    }

    @objc func clickRight() {
        if let onClickRight = onClickRightButton {
            onClickRight()
        }
    }
}
