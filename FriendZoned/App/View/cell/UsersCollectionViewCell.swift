//
//  UsersCollectionViewCell.swift
//  FriendZoned
//
//  Created by Ashish Dwivedi on 03/12/18.
//  Copyright © 2018 Ashish Dwivedi. All rights reserved.
//

import UIKit

class UsersCollectionViewCell: UICollectionViewCell {
    let userImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = #imageLiteral(resourceName: "profile_photo")
        imageView.contentMode = .scaleAspectFill
        imageView.layer.cornerRadius = 30
        imageView.clipsToBounds = true
        return imageView
    }()
    
    let userNameLabel: UILabel = {
        let nameLabel = UILabel()
        nameLabel.text = "Ashish Dwivedi"
        nameLabel.font = UIFont.boldSystemFont(ofSize: 16.0)
        return nameLabel
    }()
    
    let messageText: UITextView = {
        let msgs = UITextView()
        msgs.text = "Checkout if T-series is beating no of subscribers of Pewdipie wow"
        msgs.font = UIFont.systemFont(ofSize: 15)
        msgs.textColor = UIColor.darkGray
        msgs.isScrollEnabled = false
        msgs.isScrollEnabled = false
        msgs.backgroundColor = .clear
        return msgs
    }()
    
    let dateTimeLabel: UILabel = {
        let dateTimeAgo = UILabel()
        dateTimeAgo.text = "12 hours ago"
        dateTimeAgo.font = UIFont.systemFont(ofSize: 12.0)
        dateTimeAgo.textColor = UIColor.lightGray
        return dateTimeAgo
    }()
    
    let smallUserImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = #imageLiteral(resourceName: "profile_photo")
        imageView.contentMode = .scaleAspectFill
        imageView.layer.cornerRadius = 12
        imageView.clipsToBounds = true
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    
    let separatorView: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor.groupTableViewBackground
        return view
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
        addSubview(userImageView)
        addSubview(userNameLabel)
        addSubview(messageText)
        addSubview(dateTimeLabel)
        addSubview(smallUserImageView)
        addSubview(separatorView)
        
        userImageView.anchor(topAnchor, left: leftAnchor, bottom: nil, right: nil, padding: UIEdgeInsets(top: 8, left: 4, bottom: 1, right: 0), size: CGSize(width: 60, height: 60))
        
        userNameLabel.anchor(topAnchor, left: userImageView.rightAnchor, bottom: nil, right: dateTimeLabel.leftAnchor, padding: UIEdgeInsets(top: 4, left: 8, bottom: 0, right: 2), size: CGSize(width: 0, height: 0))

        messageText.anchor(userNameLabel.bottomAnchor, left: userNameLabel.leftAnchor, bottom: separatorView.topAnchor, right: smallUserImageView.leftAnchor, padding: UIEdgeInsets(top: -10, left: -4, bottom: 0, right: 12), size: CGSize(width: 0, height: 0))

        dateTimeLabel.anchor(userNameLabel.topAnchor, left: nil, bottom: nil, right: rightAnchor, padding: UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 12), size: CGSize(width: 0, height: 0))

        smallUserImageView.widthAnchor.constraint(equalToConstant: 24).isActive = true
        smallUserImageView.heightAnchor.constraint(equalToConstant: 24).isActive = true
        smallUserImageView.centerYAnchor.constraint(equalTo: messageText.centerYAnchor).isActive = true
        smallUserImageView.rightAnchor.constraint(equalTo: rightAnchor, constant: -12).isActive = true

        separatorView.anchor(messageText.bottomAnchor, left: messageText.leftAnchor, bottom: bottomAnchor, right: smallUserImageView.rightAnchor, padding: UIEdgeInsets(top: 0, left: 0, bottom: 2, right: 0), size: CGSize(width: 0, height: 1.0))
    }
    
}
