//
//  TextsCollectionViewController.swift
//  FriendZoned
//
//  Created by Ashish Dwivedi on 03/12/18.
//  Copyright © 2018 Ashish Dwivedi. All rights reserved.
//

import UIKit

private let reuseIdentifier = "Cell"

class TextsCollectionViewController: UICollectionViewController, UICollectionViewDelegateFlowLayout {

    override init(collectionViewLayout layout: UICollectionViewLayout) {
        super.init(collectionViewLayout: layout)
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = "Text"
        navigationController?.navigationBar.isTranslucent = false
        collectionView.backgroundColor = UIColor.groupTableViewBackground
        collectionView.contentInsetAdjustmentBehavior = .never
        collectionView.contentInset = UIEdgeInsets(top: 0, left: 0, bottom: tabBarController?.tabBar.frame.height ?? 0, right: 0)
        self.edgesForExtendedLayout = .all
        if let layout = collectionView.collectionViewLayout as? UICollectionViewFlowLayout {
            layout.scrollDirection = .vertical
        }
        self.collectionView!.register(UsersCollectionViewCell.self, forCellWithReuseIdentifier: reuseIdentifier)
    }

    // MARK: UICollectionViewDataSource

    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }


    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of items
        return 10
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath)
        return cell
    }
    
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print("Item select at indexPath \(indexPath)")
    }
    
    override func willTransition(to newCollection: UITraitCollection, with coordinator: UIViewControllerTransitionCoordinator) {
        self.collectionView.collectionViewLayout.invalidateLayout()
        DispatchQueue.main.async {
            self.collectionView.reloadData()
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        var width = UIScreen.main.bounds.width
        if width > 560 {
            width = 560
        }
        return CGSize(width: width, height: 100)
    }
    
}
