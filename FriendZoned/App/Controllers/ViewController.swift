//
//  ViewController.swift
//  FriendZoned
//
//  Created by Ashish Dwivedi on 20/11/18.
//  Copyright © 2018 Ashish Dwivedi. All rights reserved.
//

import UIKit

class ViewController: UICollectionViewController, UICollectionViewDelegateFlowLayout {
    
    private enum ReusIdentifier{
        static let cellID = "someCellIHave"
        static let tweetCellID = "TweetCellId"
        static let headerCellID = "someHeaderCellID"
        static let footerCellID = "footerCellID"
    }

    private let users:[UserModel] = {
        let model = UsersToFollow()
        return model.getAllUsers()
    }()
    
    private let userFeeds: [FeedModel] = {
        let feeds = UserFeeds()
        return feeds.feed
    }()
    
    override init(collectionViewLayout layout: UICollectionViewLayout) {
        super.init(collectionViewLayout: layout)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Home"
        collectionView.contentInsetAdjustmentBehavior = .never
        self.edgesForExtendedLayout = UIRectEdge.all
        self.collectionView.contentInset = UIEdgeInsets(top: 0, left: 0, bottom: tabBarController?.tabBar.frame.height ?? 0, right: 0)
        
        navigationController?.navigationBar.isTranslucent = false
        
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(image: #imageLiteral(resourceName: "magnifying-glass"), style: .plain, target: self, action: #selector(handleSearchBar))
        navigationItem.leftBarButtonItem = UIBarButtonItem(barButtonSystemItem: .action, target: self, action: #selector(handleSearchBar))
        navigationItem.leftBarButtonItem?.tintColor = .black
        navigationItem.rightBarButtonItem?.tintColor = .black
        setupCollectionView()
    }
    
    @objc func handleSearchBar() {
        
    }
    
    func setupCollectionView() {
        collectionView.backgroundColor = UIColor.groupTableViewBackground
        collectionView.alwaysBounceVertical = true
        collectionView.register(MyFeedCell.self, forCellWithReuseIdentifier: ReusIdentifier.cellID)
        collectionView.register(TweetCell.self, forCellWithReuseIdentifier: ReusIdentifier.tweetCellID)
        collectionView.register(MyFeedHeaderCell.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: ReusIdentifier.headerCellID)
        collectionView.register(MyFeedFooterCell.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionFooter, withReuseIdentifier: ReusIdentifier.footerCellID)
        collectionView.reloadData()
    }
    // MARK: - UICollectionView delegate
    
    
    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 2
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if section == 0 {
            return users.count
        } else {
            return userFeeds.count
        }
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        if indexPath.section == 0 {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ReusIdentifier.cellID, for: indexPath) as! MyFeedCell
            let user = users[indexPath.item]
            
            cell.headingLabel.text = user.name
            cell.userNameLabel.text = user.userName
            cell.userBio.text = user.bio
            cell.userImageView.image = user.profilePhoto
            return cell
        } else if indexPath.section == 1 {
            let tweetCell = collectionView.dequeueReusableCell(withReuseIdentifier: ReusIdentifier.tweetCellID, for: indexPath) as! TweetCell
            let feed = userFeeds[indexPath.item]
            tweetCell.headingLabel.text = feed.name
            tweetCell.userNameLabel.text = feed.userName
            tweetCell.userImageView.image = feed.userImage
            tweetCell.feedImageview.image = feed.feedImage
            return tweetCell
        }
        
        return UICollectionViewCell()
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        var width: CGFloat = 0.0
        var height: CGFloat = 0.0
        
        if UIScreen.main.bounds.width > 560{
            width = 560
        } else {
            width = UIScreen.main.bounds.width
        }
        
        if indexPath.section == 0 {
            let userObject = users[indexPath.item]
            let nameHeight: CGFloat = 15.0
            let userNameHeight: CGFloat = 15.0
            let bioTextviewHeight = userObject.bio.height(constrainedToWidth: width - 50 - 30, font: .boldSystemFont(ofSize: 15.0))
            let totalHeight = nameHeight + userNameHeight + bioTextviewHeight + 26
            height = totalHeight
            return CGSize(width: width, height: height)
        } else if indexPath.section == 1 {
            return CGSize(width: width, height: 380)
        } else {
            return .zero
        }
        
    }
    
    override func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        switch kind {
        case UICollectionView.elementKindSectionHeader:
            let view = collectionView.dequeueReusableSupplementaryView(ofKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: ReusIdentifier.headerCellID, for: indexPath)
            return view
        case UICollectionView.elementKindSectionFooter:
            let view = collectionView.dequeueReusableSupplementaryView(ofKind: UICollectionView.elementKindSectionFooter, withReuseIdentifier: ReusIdentifier.footerCellID, for: indexPath)
            return view
        default:
            return UICollectionReusableView()
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        if section == 0 {
            return CGSize(width: UIScreen.main.bounds.width, height: 40)
        }
        return .zero
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForFooterInSection section: Int) -> CGSize {
        if section == 0 {
            return CGSize(width: UIScreen.main.bounds.width, height: 40)
        }
        
        return .zero
        
    }
    
    override func willTransition(to newCollection: UITraitCollection, with coordinator: UIViewControllerTransitionCoordinator) {
        self.collectionView.collectionViewLayout.invalidateLayout()
        DispatchQueue.main.async {
            self.collectionView.reloadData()
            self.collectionView.reloadInputViews()
        }
    }

}

