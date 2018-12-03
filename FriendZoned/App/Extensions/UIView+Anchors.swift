//
//  UIView+Anchors.swift
//  FriendZoned
//
//  Created by Ashish Dwivedi on 20/11/18.
//  Copyright © 2018 Ashish Dwivedi. All rights reserved.
//

import UIKit

extension UIView{
    func anchor(_ top: NSLayoutYAxisAnchor?,
                left: NSLayoutXAxisAnchor?,
                bottom: NSLayoutYAxisAnchor?,
                right: NSLayoutXAxisAnchor?,
                padding: UIEdgeInsets = .zero,
                size: CGSize = .zero){
        self.translatesAutoresizingMaskIntoConstraints = false
        
        if let top = top{
            self.topAnchor.constraint(equalTo: top, constant: padding.top).isActive = true
        }
        
        if let left = left{
            self.leftAnchor.constraint(equalTo: left, constant: padding.left).isActive = true
        }
        
        if let bottom = bottom{
            self.bottomAnchor.constraint(equalTo: bottom, constant: -padding.bottom).isActive = true
        }
        
        if let right = right{
            self.rightAnchor.constraint(equalTo: right, constant: -padding.right).isActive = true
        }
        
        if size.width != 0{
            self.widthAnchor.constraint(equalToConstant: size.width).isActive = true
        }
        
        if size.height != 0{
            self.heightAnchor.constraint(equalToConstant: size.height).isActive = true
        }
    }
    
    func fillSuperView(){
        self.anchor(superview?.topAnchor, left: superview?.leftAnchor, bottom: superview?.bottomAnchor, right: superview?.rightAnchor)
    }
    
    func centerWithSuperView(size: CGSize = .zero) {
        translatesAutoresizingMaskIntoConstraints = false
        centerXAnchor.constraint(equalTo: (self.superview?.centerXAnchor)!).isActive = true
        centerYAnchor.constraint(equalTo: (self.superview?.centerYAnchor)!).isActive = true
        
        if size.width != 0{
            self.widthAnchor.constraint(equalToConstant: size.width).isActive = true
        }
        
        if size.height != 0{
            self.heightAnchor.constraint(equalToConstant: size.height).isActive = true
        }
    }
}
