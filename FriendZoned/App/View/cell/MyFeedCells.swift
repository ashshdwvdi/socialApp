//
//  MyFeedCells.swift
//  FriendZoned
//
//  Created by Ashish Dwivedi on 21/11/18.
//  Copyright © 2018 Ashish Dwivedi. All rights reserved.


import UIKit

let appColorRed = UIColor(displayP3Red: 161/255, green: 31/255, blue: 147/255, alpha: 1)
let appColorGray = UIColor(displayP3Red: 130/255, green: 130/255, blue: 130/255, alpha: 0.1)

class MyFeedCell: UICollectionViewCell{
    let userImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = #imageLiteral(resourceName: "profile_photo")
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
    
    let followButton: UIButton = {
        let button = UIButton()
        button.setTitle("Follow", for: .normal)
        button.layer.cornerRadius = 5.0
        button.clipsToBounds = true
        button.layer.borderColor = appColorRed.cgColor
        button.titleLabel?.font = UIFont.monospacedDigitSystemFont(ofSize: 15, weight: .light)
        button.layer.borderWidth = 1.0
        button.setTitleColor(appColorRed, for: .normal)
        return button
    }()
    
    let userBio: UITextView = {
        let bioText = UITextView()
        bioText.textColor = .gray
        bioText.backgroundColor = .clear
        bioText.isScrollEnabled = false
        bioText.font = UIFont.systemFont(ofSize: 15)
        return bioText
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupUI(){
        self.backgroundColor = .white
        self.addSubview(userImageView)
        self.addSubview(headingLabel)
        self.addSubview(userNameLabel)
        self.addSubview(followButton)
        self.addSubview(userBio)
        
        userImageView.anchor(topAnchor, left: leftAnchor, bottom: nil, right: nil, padding: UIEdgeInsets(top: 12, left: 8, bottom: 0, right: 0), size: CGSize(width: 50, height: 50))
        headingLabel.anchor(userImageView.topAnchor, left: userImageView.rightAnchor, bottom: nil, right: followButton.leftAnchor, padding: UIEdgeInsets(top: 0, left: 8, bottom: 0, right: 12), size: CGSize(width: 0, height: 15))
        userNameLabel.anchor(headingLabel.bottomAnchor, left: headingLabel.leftAnchor, bottom: nil, right: headingLabel.rightAnchor, padding: UIEdgeInsets(top: 2, left: 0, bottom: 0, right: 0), size: CGSize(width: 0, height: 15))
        followButton.anchor(headingLabel.topAnchor, left: nil, bottom: nil, right: self.rightAnchor, padding: UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 12), size: CGSize(width: 80, height: 24))
        userBio.anchor(userNameLabel.bottomAnchor, left: userNameLabel.leftAnchor, bottom: self.bottomAnchor, right: followButton.rightAnchor, padding: UIEdgeInsets(top: -4, left: -4, bottom: 0, right: 0))
        layoutIfNeeded()
    }
}

class MyFeedHeaderCell: UICollectionViewCell{
    let headingLabel: UILabel = {
        let label = UILabel()
        label.text = " WHO TO FOLLOW ?"
        label.font = UIFont.monospacedDigitSystemFont(ofSize: 15, weight: .medium)
        label.textColor = .darkGray
        label.backgroundColor = .white
        return label
    }()
    
    let separatorView: UIView = {
        let lineView = UIView()
        lineView.backgroundColor = appColorGray
        return lineView
    }()
    
    var widthConstant: NSLayoutConstraint!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .clear
        addSubview(headingLabel)
        addSubview(separatorView)
    
        headingLabel.centerWithSuperView(size: CGSize(width: 0, height: 40))
        widthConstant = headingLabel.widthAnchor.constraint(equalToConstant: 0)
        widthConstant.isActive = true
        
        separatorView.anchor(headingLabel.bottomAnchor, left: headingLabel.leftAnchor, bottom: nil, right: headingLabel.rightAnchor, padding: UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0), size:  CGSize(width: 0, height: 1))
        
        layoutIfNeeded()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("some issue with rendering header")
    }
    
    override func layoutSubviews() {
        var width = UIScreen.main.bounds.width
        if UIScreen.main.bounds.width >= 560 {
            width = 560
        }
        widthConstant.constant = width
    }
}

class MyFeedFooterCell: UICollectionViewCell{
    
    let footerLabel: UILabel = {
        let label = UILabel()
        label.text = " show me more..."
        label.font = UIFont.systemFont(ofSize: 14.0)
        label.textColor = appColorRed
        label.backgroundColor = .white
        return label
    }()
    
    let separatorView: UIView = {
        let lineView = UIView()
        lineView.backgroundColor = appColorGray
        return lineView
    }()
    
    var widthConstant: NSLayoutConstraint!
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .clear
        addSubview(footerLabel)
        addSubview(separatorView)
    
        footerLabel.centerWithSuperView(size: CGSize(width: 0, height: 40))
        widthConstant = footerLabel.widthAnchor.constraint(equalToConstant: 0)
        widthConstant.isActive = true
        separatorView.anchor(footerLabel.bottomAnchor, left: footerLabel.leftAnchor, bottom: nil, right: footerLabel.rightAnchor, padding: UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0), size:  CGSize(width: 0, height: 1))
        
        layoutIfNeeded()
        
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("some issue with rendering header")
    }
    
    override func layoutSubviews() {
        var width = UIScreen.main.bounds.width
        if UIScreen.main.bounds.width >= 560 {
            width = 560
        }
        widthConstant.constant = width
    }

}

