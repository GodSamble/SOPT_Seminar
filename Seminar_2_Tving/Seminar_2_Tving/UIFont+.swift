//
//  UIFont+.swift
//  Seminar_2_Tving
//
//  Created by 고영민 on 2023/07/01.
//

import UIKit

extension UIFont {
    public enum pretendardType: String {
        case medium = "Mediun"
        case regular = "Regular"
        case semibold = "SemiBold"
    }
    static func pretendard(_ type: pretendardType, size: CGFloat) -> UIFont {
        return UIFont(name: "Pretendard-\(type.rawValue)", size: size)!
    }
}

