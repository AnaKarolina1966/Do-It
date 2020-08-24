//
//  ButtonAspect.swift
//  Do.It
//
//  Created by Ana Karolina Costa da Silva on 19/08/20.
//  Copyright © 2020 Ana Karolina Costa da Silva. All rights reserved.
//

import UIKit

class AspectButton: UIButton {
    
    var cornerRadius: CGFloat = 80.0 {
       didSet {
          setNeedsLayout()
       }
    }
    
    var shadowColor: UIColor = .mainGreen {
       didSet {
          setNeedsLayout()
       }
    }
    
    var shadowOffsetWidth: CGFloat = 0.0 {
       didSet {
          setNeedsLayout()
       }
    }
    
    var shadowOffsetHeight: CGFloat = 0.2 {
       didSet {
          setNeedsLayout()
       }
    }
    
    var shadowOpacity: Float = 0.20 {
       didSet {
          setNeedsLayout()
       }
    }
    
    var shadowRadius: CGFloat = 0.70 {
       didSet {
          setNeedsLayout()
       }
    }
    
    private var shadowLayer: CAShapeLayer = CAShapeLayer() {
       didSet {
          setNeedsLayout()
       }
    }
    
    override func layoutSubviews() {
       super.layoutSubviews()
       layer.cornerRadius = cornerRadius
       shadowLayer.path = UIBezierPath(roundedRect: bounds,
          cornerRadius: cornerRadius).cgPath
       shadowLayer.fillColor = backgroundColor?.cgColor
       shadowLayer.shadowColor = shadowColor.cgColor
       shadowLayer.shadowPath = shadowLayer.path
       shadowLayer.shadowOffset = CGSize(width: shadowOffsetWidth,
          height: shadowOffsetHeight)
       shadowLayer.shadowOpacity = shadowOpacity
       shadowLayer.shadowRadius = shadowRadius
       layer.insertSublayer(shadowLayer, at: 0)
    }
}
