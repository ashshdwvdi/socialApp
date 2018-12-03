//
//  TweetCell.swift
//  FriendZoned
//
//  Created by Ashish Dwivedi on 26/11/18.
//  Copyright © 2018 Ashish Dwivedi. All rights reserved.
//

import UIKit

class TweetCell: UICollectionViewCell {
    
    let userImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.layer.cornerRadius = 5.0
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        return imageView
    }()
    
    let headingLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 16.0)
        return label
    }()
    
    let userNameLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 14.0)
        label.textColor = UIColor.lightGray
        return label
    }()

    let feedImageview: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        return imageView
    }()
    
    let feedActionStackView: UIView = {
        let containerView: UIView = UIView()
        
        let editbutton = UIButton()
        let likeButton = UIButton()
        let shareButton = UIButton()
        
        editbutton.setImage(#imageLiteral(resourceName: "edit"), for: .normal)
        likeButton.setImage(#imageLiteral(resourceName: "heart"), for: .normal)
        shareButton.setImage(#imageLiteral(resourceName: "next"), for: .normal)
    
        let buttonsArray = [editbutton, likeButton, shareButton]
        
        buttonsArray.forEach({
            $0.imageView?.contentMode = .scaleAspectFit
            $0.imageView?.layer.transform = CATransform3DScale(CATransform3DIdentity, 0.5, 0.5, 0)
        })
        
        
        let stackview = UIStackView(arrangedSubviews: buttonsArray)
        stackview.axis = .horizontal
        stackview.distribution = .fillEqually
        
        containerView.addSubview(stackview)
        stackview.anchor(containerView.topAnchor, left: containerView.leftAnchor, bottom: containerView.bottomAnchor, right: containerView.rightAnchor)
        
        return containerView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupUI() {
        backgroundColor = .white
        self.addSubview(userImageView)
        self.addSubview(headingLabel)
        self.addSubview(userNameLabel)
        self.addSubview(feedImageview)
        self.addSubview(feedActionStackView)

        userImageView.anchor(topAnchor, left: leftAnchor, bottom: nil, right: nil, padding: UIEdgeInsets(top: 12, left: 8, bottom: 0, right: 0), size: CGSize(width: 50, height: 50))
        headingLabel.anchor(userImageView.topAnchor, left: userImageView.rightAnchor, bottom: nil, right: rightAnchor, padding: UIEdgeInsets(top: 4, left: 8, bottom: 0, right: 12), size: CGSize(width: 0, height: 15))
        userNameLabel.anchor(headingLabel.bottomAnchor, left: headingLabel.leftAnchor, bottom: nil, right: headingLabel.rightAnchor, padding: UIEdgeInsets(top: 8, left: 0, bottom: 0, right: 0), size: CGSize(width: 0, height: 15))
        feedImageview.anchor(userImageView.bottomAnchor, left: userImageView.leftAnchor, bottom: nil, right: userNameLabel.rightAnchor, padding:  UIEdgeInsets(top: 4, left: 0, bottom: 8, right: 0))
        feedActionStackView.anchor(feedImageview.bottomAnchor, left: feedImageview.leftAnchor, bottom: bottomAnchor, right: feedImageview.rightAnchor, padding: UIEdgeInsets(top: 8, left: 0, bottom: 8, right: 0), size: CGSize(width: 0, height: 36))
        
        self.layoutIfNeeded()
    }
}
