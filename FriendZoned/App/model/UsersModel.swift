//
//  UsersModel.swift
//  FriendZoned
//
//  Created by Ashish Dwivedi on 23/11/18.
//  Copyright © 2018 Ashish Dwivedi. All rights reserved.
//

import UIKit

struct UserModel{
    let name: String
    let userName: String
    let bio: String
    let profilePhoto: UIImage
}


class UsersToFollow: NSObject{
    var appusers: [UserModel] = []
    
    override init() {
        super.init()
        let ashishUser = UserModel(name: "Ashish", userName: "@ashish", bio: "Hi i am into mobile iOS apps since i was today years old. i work at Poshmark and i like watching movies in my free time more often", profilePhoto: #imageLiteral(resourceName: "profile_photo"))
        let someOtheruser = UserModel(name: "Rajesh", userName: "@rajesh", bio: "Hi I am some user and ceo at man smiling cause i smile so good. not much  to say about me. Thanks and good day!", profilePhoto: #imageLiteral(resourceName: "someOtherUser"))
        let userTest = UserModel(name: "Hyde chaurasia", userName: "@Hyde", bio: "Thanks and good day!", profilePhoto: #imageLiteral(resourceName: "u3"))
        [ashishUser, someOtheruser, userTest].forEach({
            appusers.append($0)
        })
    }
    
    func getAllUsers() -> [UserModel]{
        return appusers
    }
}
