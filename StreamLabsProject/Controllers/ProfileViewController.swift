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
        
        // Setup UI
        self.view = contentView

        // Load user profile
        self.loadProfileData()
    }
    
    @objc func goToSettings() {
        // TBD
    }
    
    func loadProfileData() {
        
        // In a real project, this information should be grabbed from an API...
        let profile = ProfileService.returnFakeProfile()
        
        // Update UI
        self.contentView.setProfileData(profile: profile)
        
        self.navigationItem.title = profile.fullname
        
    }
}
