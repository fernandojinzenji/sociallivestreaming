//
//  ProfileViewController.swift
//  StreamLabsProject
//
//  Created by Fernando Jinzenji on 2019-01-15.
//  Copyright © 2019 Fernando Jinzenji. All rights reserved.
//

import UIKit

class ProfileViewController: UIViewController {

    let contentView = ProfileView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Set UI
        self.view = contentView

        self.navigationItem.rightBarButtonItem = UIBarButtonItem(title: "...", style: .plain, target: self, action: #selector(goToSettings))
    }
    
    @objc func goToSettings() {
        // TBD
    }
}
