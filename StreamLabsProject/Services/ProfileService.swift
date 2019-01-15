//
//  ProfileService.swift
//  StreamLabsProject
//
//  Created by Fernando Jinzenji on 2019-01-15.
//  Copyright © 2019 Fernando Jinzenji. All rights reserved.
//

import Foundation

public class ProfileService {
    
    public class func returnFakeProfile() -> Profile {

        return Profile(image: #imageLiteral(resourceName: "me"), fullname: "Fernando Jinzenji", username: "@fernandojinzenji", videoCounter: 0, following: 0, fans: 0, hearts: 0, bio: "No bio yet")        
        
    }
    
}
