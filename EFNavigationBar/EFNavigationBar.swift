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
import EFFoundation

public class EFNavigationBar: UIView {
    
    public static var defaultStyle: EFNavigationBarConfig = EFNavigationBarConfig()
    
    public var onLeftButtonClick: (()->())?
    public var onRightButtonClick: (()->())?
    
    public var title: String? {
        willSet {
            titleLabel.text = newValue
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
    
    // UI variable
    public lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.text = EFNavigationBar.defaultStyle.title
        label.textColor = EFNavigationBar.defaultStyle.titleColor
        label.font = EFNavigationBar.defaultStyle.titleFont
        label.textAlignment = .center
        return label
    }()
    
    public lazy var leftButton: UIButton = {
        let button = UIButton()
        button.setTitleColor(EFNavigationBar.defaultStyle.buttonTitleColor)
        button.titleLabel?.font = EFNavigationBar.defaultStyle.buttonTitleFont
        button.imageView?.contentMode = .center
        button.isHidden = true
        button.addTarget(self, action: #selector(clickLeft), for: .touchUpInside)
        return button
    }()
    
    public lazy var rightButton: UIButton = {
        let button = UIButton()
        button.setTitleColor(EFNavigationBar.defaultStyle.buttonTitleColor)
        button.titleLabel?.font = EFNavigationBar.defaultStyle.buttonTitleFont
        button.imageView?.contentMode = .center
        button.isHidden = true
        button.addTarget(self, action: #selector(clickRight), for: .touchUpInside)
        return button
    }()
    
    public lazy var bottomLine: UIView = {
        let view = UIView()
        view.backgroundColor = EFNavigationBar.defaultStyle.bottomLineColor
        return view
    }()
    
    public lazy var backgroundView: UIView = {
        let view = UIView()
        view.backgroundColor = EFNavigationBar.defaultStyle.backgroundColor
        return view
    }()
    
    public lazy var backgroundImageView: UIImageView = {
        let view = UIImageView()
        view.isHidden = true
        return view
    }()
    
    // init
    public class func CustomNavigationBar() -> EFNavigationBar {
        let frame = CGRect(x: 0, y: 0, width: UIScreen.main.bounds.size.width, height: EFNavigationBar.defaultStyle.height)
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
    }
    public func updateFrame() {
        
        let top: CGFloat = CGFloat.statusBarHeight
        let margin: CGFloat = EFNavigationBar.defaultStyle.buttonMargin
        
        backgroundView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate(
            [backgroundView.topAnchor.constraint(equalTo: topAnchor),
             backgroundView.bottomAnchor.constraint(equalTo: bottomAnchor),
             backgroundView.leftAnchor.constraint(equalTo: leftAnchor),
             backgroundView.rightAnchor.constraint(equalTo: rightAnchor)]
        )

        leftButton.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate(
            [leftButton.leftAnchor.constraint(equalTo: leftAnchor, constant: margin),
             leftButton.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -12)]
        )
        leftButton.setContentHuggingPriority(UILayoutPriority.defaultHigh + 1, for: .horizontal)
        
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate(
            [titleLabel.leftAnchor.constraint(equalTo: leftButton.rightAnchor, constant: 0),
             titleLabel.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -10)
            ]
        )
        titleLabel.setContentCompressionResistancePriority(UILayoutPriority.defaultLow - 1, for: .horizontal)
        
        rightButton.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate(
            [rightButton.rightAnchor.constraint(equalTo: rightAnchor, constant: -margin),
             rightButton.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -12),
             rightButton.leftAnchor.constraint(equalTo: titleLabel.rightAnchor, constant: 0)]
        )
        rightButton.setContentHuggingPriority(.defaultHigh + 2, for: .horizontal)
        
        NSLayoutConstraint.activate(
            [bottomLine.rightAnchor.constraint(equalTo: rightAnchor, constant: 0),
             bottomLine.leftAnchor.constraint(equalTo: leftAnchor, constant: 0),
             bottomLine.bottomAnchor.constraint(equalTo: bottomAnchor, constant: 0),
             bottomLine.heightAnchor.constraint(equalToConstant: 0.5)]
        )
        
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
    func setTitleColor(color: UIColor) {
        titleLabel.textColor = color
    }
    func setTintColor(color: UIColor) {
        leftButton.setTitleColor(color, for: .normal)
        rightButton.setTitleColor(color, for: .normal)
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
        if let onClickLeft = onLeftButtonClick {
            onClickLeft()
        } else {
            UIViewController.topViewController.goBack(animated: true)
        }
    }
    
    @objc func clickRight() {
        if let onClickRight = onRightButtonClick {
            onClickRight()
        }
    }
}
