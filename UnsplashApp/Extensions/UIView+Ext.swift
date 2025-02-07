//
//  UIView+Ext.swift
//  UnsplashApp
//
//  Created by Paul Matar on 07.02.2025.
//

import UIKit

extension UIView {
    
    func addSubviews(_ views: UIView...) {
        views.forEach { addSubview($0) }
    }
    
    func roundCorners(corners: UIRectCorner, radius: CGFloat) {
        let path = UIBezierPath(roundedRect: bounds, byRoundingCorners: corners, cornerRadii: CGSize(width: radius, height: radius))
        let mask = CAShapeLayer()
        mask.path = path.cgPath
        layer.mask = mask
    }
    
    func setRadius(_ radius: CGFloat, mask maskToBounds: Bool = false) {
        layer.cornerRadius = radius
        layer.masksToBounds = maskToBounds
    }
    
    func rounded(_ masked: Bool = false) {
        layer.cornerRadius = frame.height / 2
        layer.masksToBounds = masked
    }
}
