//
//  UIImageView+Extensions.swift
//  Pollexa
//
//  Created by Karim Amsha on 2.04.2024.
//

import UIKit

extension UIImageView {
    
    func applyCornerRadius(_ radius: CGFloat, corners: UIRectCorner) {
        let maskPath = UIBezierPath(roundedRect: bounds,
                                     byRoundingCorners: corners,
                                     cornerRadii: CGSize(width: radius, height: radius))
        
        let maskLayer = CAShapeLayer()
        maskLayer.frame = bounds
        maskLayer.path = maskPath.cgPath
        
        layer.mask = maskLayer
    }
}
