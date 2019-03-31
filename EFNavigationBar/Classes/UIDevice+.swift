//
//  UIDevice+.swift
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

enum UIDeviceGeneration: Int {
    case other = 0
    case iPhone5_5S_5C = 1
    case iPhone6_6S_7_8 = 2
    case iPhone6P_6SP_7P_8P = 3
    case iPhoneX_XS = 4
    case iPhoneXSMax = 5
    case iPhoneXR = 6
}

extension UIDevice {

    static let generation: UIDeviceGeneration = {
        if UIDevice().userInterfaceIdiom == .phone {
            switch UIScreen.main.bounds.height {
            case 568..<667:
                return UIDeviceGeneration.iPhone5_5S_5C
            case 667..<736:
                return UIDeviceGeneration.iPhone6_6S_7_8
            case 736..<812:
                return UIDeviceGeneration.iPhone6P_6SP_7P_8P
            case 812..<828:
                return UIDeviceGeneration.iPhoneX_XS
            case 828..<1242:
                return UIDeviceGeneration.iPhoneXSMax
            case 1242...1500:
                return UIDeviceGeneration.iPhoneXR
            default:
                return UIDeviceGeneration.other
            }
        }
        return UIDeviceGeneration.other
    }()

    static let isiPhoneX: Bool = {
        return UIDeviceGeneration.iPhoneX_XS == generation
            || UIDeviceGeneration.iPhoneXSMax == generation
            || UIDeviceGeneration.iPhoneXR == generation
    }()
}
