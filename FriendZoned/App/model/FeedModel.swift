//
//  FeedModel.swift
//  FriendZoned
//
//  Created by Ashish Dwivedi on 26/11/18.
//  Copyright © 2018 Ashish Dwivedi. All rights reserved.
//

import UIKit

struct FeedModel {
    let name: String
    let userName: String
    let feedImage: UIImage
    let userImage: UIImage
}

class UserFeeds {
    var feed: [FeedModel] = []
    
    init() {
        getAllFeeds()
    }
    
    func getAllFeeds() {
        let feed1 = FeedModel(name: "Hyde Chaurasia", userName: "@hyde", feedImage: #imageLiteral(resourceName: "feed3"), userImage: #imageLiteral(resourceName: "u3"))
        let feed2 = FeedModel(name: "Lady Handball", userName: "@handball", feedImage: #imageLiteral(resourceName: "feed1"), userImage: #imageLiteral(resourceName: "u2"))
        let feed3 = FeedModel(name: "Yogi", userName: "@YoYo", feedImage: #imageLiteral(resourceName: "feed3"), userImage: #imageLiteral(resourceName: "u4"))
        
        [feed1, feed2, feed3].forEach({
            feed.append($0)
        })
    }
}
