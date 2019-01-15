//
//  MainViewController.swift
//  StreamLabsProject
//
//  Created by Fernando Jinzenji on 2019-01-15.
//  Copyright © 2019 Fernando Jinzenji. All rights reserved.
//

import UIKit

class MainViewController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()

        let streamViewController = generateNewViewController(controller: StreamViewController(), title: "", image: #imageLiteral(resourceName: "home"), tag: 0, embedNavigationController: false)
        let searchViewController = generateNewViewController(controller: SearchViewController(), title: "Search", image: #imageLiteral(resourceName: "search"), tag: 1, embedNavigationController: true)
        let uploadViewController = generateNewViewController(controller: UploadViewController(), title: "", image: #imageLiteral(resourceName: "plus"), tag: 2, embedNavigationController: false)
        let notificationViewController = generateNewViewController(controller: NotificationViewController(), title: "Notifications", image: #imageLiteral(resourceName: "list"), tag: 3, embedNavigationController: true)
        let profileViewController = generateNewViewController(controller: ProfileViewController(), title: "Profile", image: #imageLiteral(resourceName: "user_male"), tag: 4, embedNavigationController: true)
        
        self.viewControllers = [streamViewController, searchViewController, uploadViewController, notificationViewController, profileViewController]
        
    }
    

    private func generateNewViewController(controller: UIViewController, title: String, image: UIImage, tag: Int, embedNavigationController: Bool) -> UIViewController {
        
        // Set tab bar image and order
        controller.tabBarItem = UITabBarItem(title: "", image: image, tag: tag)
        controller.tabBarItem.imageInsets = UIEdgeInsets(top: 9, left: 0, bottom: -9, right: 0)
        
        // Embed navigation controller, if necessary
        if embedNavigationController {
            let navigationController = UINavigationController()
            navigationController.viewControllers.append(controller)
            controller.navigationItem.title = title
            return navigationController
        }
        else {
            return controller
        }
    }

}
