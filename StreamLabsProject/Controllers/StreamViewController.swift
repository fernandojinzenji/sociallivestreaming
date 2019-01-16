//
//  StreamViewController.swift
//  StreamLabsProject
//
//  Created by Fernando Jinzenji on 2019-01-15.
//  Copyright © 2019 Fernando Jinzenji. All rights reserved.
//

import UIKit

class StreamViewController: UIViewController {

    var contentView: StreamView?
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    override func viewWillAppear(_ animated: Bool) {
        
        if contentView == nil {
            contentView = StreamView()
            
            // Setup UI
            self.view = contentView
            
            // Load videos
            contentView!.loadStream(videos: VideoService.returnHardcodedVideoList())
        }
        
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        self.contentView?.stopCurrentVideo()
        self.contentView = nil
    }
}
