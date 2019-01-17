//
//  SearchViewController.swift
//  StreamLabsProject
//
//  Created by Fernando Jinzenji on 2019-01-15.
//  Copyright © 2019 Fernando Jinzenji. All rights reserved.
//

import UIKit
import AVFoundation
import AVKit

class SearchViewController: UIViewController {

    var contentView = SearchView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Setup UI
        self.contentView.delegate = self
        self.view = contentView
        
        // Load videos
        self.contentView.loadHashtagTopList(videos: VideoService.returnHardcodedVideoList())
    
    }
}

extension SearchViewController: SearchViewDelegate {
    
    func displayVideo(videoURL: String) {
        
        // Harcoded url
        let player = AVPlayer(url: URL(string: videoURL)!)
        let vc = AVPlayerViewController()
        vc.player = player

        present(vc, animated: true) {
            vc.player?.play()
        }
    }
    
}

