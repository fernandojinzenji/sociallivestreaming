//
//  StreamViewController.swift
//  StreamLabsProject
//
//  Created by Fernando Jinzenji on 2019-01-15.
//  Copyright © 2019 Fernando Jinzenji. All rights reserved.
//

import UIKit

class StreamViewController: UIViewController {

    var contentView = StreamView()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Setup UI
        self.view = contentView
    }
}
