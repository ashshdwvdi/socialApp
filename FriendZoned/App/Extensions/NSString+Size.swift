//
//  NSString+Size.swift
//  FriendZoned
//
//  Created by Ashish Dwivedi on 23/11/18.
//  Copyright © 2018 Ashish Dwivedi. All rights reserved.
//

import UIKit

extension String{
    func height(constrainedToWidth: CGFloat, font: UIFont) -> CGFloat{
        let boundingRect = CGSize(width: constrainedToWidth, height: .greatestFiniteMagnitude)
        let height = self.boundingRect(with: boundingRect, options: [.usesLineFragmentOrigin, .usesFontLeading], attributes: [NSAttributedString.Key.font: font], context: nil).height
        return height
    }
}
