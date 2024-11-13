//
//  UIView.swift
//  Spotify-UIKit
//
//  Created by soyoongdev on 13/11/2024.
//

import UIKit

extension UIView {
    
    /**
     Ex:
     view.addSubviews(label, button)
     **/
    /// Add multiple UIViews to a superview
    func addSubviews(_ views: UIView...) {
        views.forEach { addSubview($0) }
    }
    
    /**
     Ex:
     let label = UILabel()
     label.anchor(top: view.topAnchor, left: view.leftAnchor, paddingTop: 20, paddingLeft: 20, width: 100, height: 50)
     **/
    /// Setting Auto Layout Constraints
    func anchor(top: NSLayoutYAxisAnchor? = nil,
                left: NSLayoutXAxisAnchor? = nil,
                bottom: NSLayoutYAxisAnchor? = nil,
                right: NSLayoutXAxisAnchor? = nil,
                paddingTop: CGFloat = 0,
                paddingLeft: CGFloat = 0,
                paddingBottom: CGFloat = 0,
                paddingRight: CGFloat = 0,
                width: CGFloat? = nil,
                height: CGFloat? = nil) {
        translatesAutoresizingMaskIntoConstraints = false
        if let top = top {
            topAnchor.constraint(equalTo: top, constant: paddingTop).isActive = true
        }
        
        if let left = left {
            leftAnchor.constraint(equalTo: left, constant: paddingLeft).isActive = true
        }
        
        if let bottom = bottom {
            bottomAnchor.constraint(equalTo: bottom, constant: -paddingBottom).isActive = true
        }
        
        if let right = right {
            rightAnchor.constraint(equalTo: right, constant: -paddingRight).isActive = true
        }
        
        if let width = width {
            widthAnchor.constraint(equalToConstant: width).isActive = true
        }
        
        if let height = height {
            heightAnchor.constraint(equalToConstant: height).isActive = true
        }
    }
    
    /**
     Ex:
     let button = UIButton()
     view.addSubview(button)
     button.centerInSuperview(size: CGSize(width: 100, height: 50))
     **/
    /// Center UIView in Superview
    func centerInSuperview(size: CGSize = .zero) {
        translatesAutoresizingMaskIntoConstraints = false
        if let superviewCenterX = superview?.centerXAnchor {
            centerXAnchor.constraint(equalTo: superviewCenterX).isActive = true
        }
        
        if let superviewCenterY = superview?.centerYAnchor {
            centerYAnchor.constraint(equalTo: superviewCenterY).isActive = true
        }
        
        if size.width != 0 {
            widthAnchor.constraint(equalToConstant: size.width).isActive = true
        }
        
        if size.height != 0 {
            heightAnchor.constraint(equalToConstant: size.height).isActive = true
        }
    }
    
    /**
     Ex:
     let containerView = UIView()
     view.addSubview(containerView)
     containerView.fillSuperview(padding: UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10))
     **/
    /// Align UIView to Superview Size
    func fillSuperview(padding: UIEdgeInsets = .zero) {
        translatesAutoresizingMaskIntoConstraints = false
        
        if let superviewTop = superview?.topAnchor {
            topAnchor.constraint(equalTo: superviewTop, constant: padding.top).isActive = true
        }
        
        if let superviewLeft = superview?.leftAnchor {
            leftAnchor.constraint(equalTo: superviewLeft, constant: padding.left).isActive = true
        }
        
        if let superviewBottom = superview?.bottomAnchor {
            bottomAnchor.constraint(equalTo: superviewBottom, constant: -padding.bottom).isActive = true
        }
        
        if let superviewRight = superview?.rightAnchor {
            rightAnchor.constraint(equalTo: superviewRight, constant: -padding.right).isActive = true
        }
    }
    
    /**
     Ex:
     let view = UIView()
     view.roundCorners(radius: 10)
     **/
    /// Create Round Corners
    func roundCorners(radius: CGFloat) {
        layer.cornerRadius = radius
        layer.masksToBounds = true
    }
    
    /**
     Ex:
     let view = UIView()
     view.setBorder(width: 2, color: .red)
     **/
    /// Create Border for UIView
    func setBorder(width: CGFloat, color: UIColor) {
        layer.borderWidth = width
        layer.borderColor = color.cgColor
    }
    
    /**
     Ex:
     let view = UIView()
     view.addShadow(color: .gray, offset: CGSize(width: 0, height: 2), radius: 6, opacity: 0.3)
     **/
    /// Setting Shadow for UIView
    func addShadow(color: UIColor = .black,
                   offset: CGSize = CGSize(width: 0, height: 2),
                   radius: CGFloat = 4,
                   opacity: Float = 0.5) {
        layer.shadowColor = color.cgColor
        layer.shadowOffset = offset
        layer.shadowRadius = radius
        layer.shadowOpacity = opacity
        layer.masksToBounds = false
    }
}
