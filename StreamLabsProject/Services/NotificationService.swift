//
//  NotificationService.swift
//  StreamLabsProject
//
//  Created by Fernando Jinzenji on 2019-01-15.
//  Copyright © 2019 Fernando Jinzenji. All rights reserved.
//

import Foundation

public class NotificationService {
    
    public class func returnFakeNotifications() -> [Notification] {
        
        let notification1 = Notification(avatar: #imageLiteral(resourceName: "streamer"), username: "userX", description: "Come see me!", id: 1234)
        let notification2 = Notification(avatar: #imageLiteral(resourceName: "streamer"),username: "userY", description: "Come see me too!", id: 1235)
        let notification3 = Notification(avatar: #imageLiteral(resourceName: "streamer"),username: "userZ", description: "Come see me after them!", id: 1236)
        
        return [notification1, notification2, notification3]
    }
    
}
