//
//  UIView+.swift
//  seminar_3
//
//  Created by 고영민 on 2023/07/08.
//

import UIKit

extension UIView {
    
    func makeRounded(radius: CGFloat) {
        self.clipsToBounds = true
        self.layer.cornerRadius = radius
    }
}
