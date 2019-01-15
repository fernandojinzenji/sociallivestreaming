//
//  NotificationViewController.swift
//  StreamLabsProject
//
//  Created by Fernando Jinzenji on 2019-01-15.
//  Copyright © 2019 Fernando Jinzenji. All rights reserved.
//

import UIKit

class NotificationViewController: UIViewController {

    let contentView = NotificationView()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Set UI
        self.view = contentView
        
        // Load notifications
        self.loadNotifications()
    }
    
    func loadNotifications() {
        
        // In a real project, this information should be grabbed from an API...
        let notifications = NotificationService.returnFakeNotifications()
        
        // Update UI
        self.contentView.updateTableView(list: notifications)
    }
}
