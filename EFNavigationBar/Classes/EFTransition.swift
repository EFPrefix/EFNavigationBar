//
//  EFTransition.swift
//  EFNavigationBar
//
//  Created by EyreFree on 2019/2/17.
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

// MARK:- EFTransition
public protocol EFTransition {

    func mapping(percent: CGFloat) -> CGFloat
}

public extension EFTransition {

    // Calculate the middle alpha with translation percent
    func mappingAlpha(fromAlpha: CGFloat, toAlpha: CGFloat, percent: CGFloat) -> CGFloat {
        let newAlpha = fromAlpha + (toAlpha - fromAlpha) * mapping(percent: percent)
        return newAlpha
    }

    // Calculate the middle Color with translation percent
    func mappingColor(fromColor: UIColor, toColor: UIColor, percent: CGFloat) -> UIColor {
        // get current color RGBA
        var fromRed: CGFloat = 0
        var fromGreen: CGFloat = 0
        var fromBlue: CGFloat = 0
        var fromAlpha: CGFloat = 0
        fromColor.getRed(&fromRed, green: &fromGreen, blue: &fromBlue, alpha: &fromAlpha)

        // get to color RGBA
        var toRed: CGFloat = 0
        var toGreen: CGFloat = 0
        var toBlue: CGFloat = 0
        var toAlpha: CGFloat = 0
        toColor.getRed(&toRed, green: &toGreen, blue: &toBlue, alpha: &toAlpha)

        // calculate middle color RGBA
        let mappingPercent: CGFloat = mapping(percent: percent)
        let newRed = fromRed + (toRed - fromRed) * mappingPercent
        let newGreen = fromGreen + (toGreen - fromGreen) * mappingPercent
        let newBlue = fromBlue + (toBlue - fromBlue) * mappingPercent
        let newAlpha = fromAlpha + (toAlpha - fromAlpha) * mappingPercent
        return UIColor(red: newRed, green: newGreen, blue: newBlue, alpha: newAlpha)
    }
}

// MARK:- EFTransitionMethod
public enum EFTransitionMethod: Int, EFTransition {

    private static let mappingRate = Float(3.0)

    case linear = 0
    case easeIn = 1
    case easeOut = 2
    case easeInOut = 3
    case easeInBounce = 4
    case easeOutBounce = 5

    public func mapping(percent: CGFloat) -> CGFloat {
        switch self {
        case .linear:
            return percent
        case .easeIn:
            return CGFloat(powf(Float(percent), EFTransitionMethod.mappingRate))
        case .easeOut:
            return CGFloat(1.0 - powf(Float(1.0 - percent), EFTransitionMethod.mappingRate))
        case .easeInOut:
            let newt: CGFloat = 2 * percent
            if newt < 1 {
                return CGFloat(0.5 * powf (Float(newt), EFTransitionMethod.mappingRate))
            }
            return CGFloat(0.5 * (2.0 - powf(Float(2.0 - newt), EFTransitionMethod.mappingRate)))
        case .easeInBounce:
            if percent < 4.0 / 11.0 {
                return CGFloat(1.0 - (powf(11.0 / 4.0, 2) * powf(Float(percent), 2))) - percent
            } else if percent < 8.0 / 11.0 {
                return CGFloat(1.0 - (3.0 / 4.0 + powf(11.0 / 4.0, 2) * powf(Float(percent - 6.0 / 11.0), 2))) - percent
            } else if percent < 10.0 / 11.0 {
                return CGFloat(1.0 - (15.0 / 16.0 + powf(11.0 / 4.0, 2) * powf(Float(percent - 9.0 / 11.0), 2))) - percent
            }
            return CGFloat(1.0 - (63.0 / 64.0 + powf(11.0 / 4.0, 2) * powf(Float(percent - 21.0 / 22.0), 2))) - percent
        case .easeOutBounce:
            if percent < 4.0 / 11.0 {
                return CGFloat(powf(11.0 / 4.0, 2) * powf(Float(percent), 2))
            } else if percent < 8.0 / 11.0 {
                return CGFloat(3.0 / 4.0 + powf(11.0 / 4.0, 2) * powf(Float(percent - 6.0 / 11.0), 2))
            } else if percent < 10.0 / 11.0 {
                return CGFloat(15.0 / 16.0 + powf(11.0 / 4.0, 2) * powf(Float(percent - 9.0 / 11.0), 2))
            }
            return CGFloat(63.0 / 64.0 + powf(11.0 / 4.0, 2) * powf(Float(percent - 21.0 / 22.0), 2))
        }
    }
}
