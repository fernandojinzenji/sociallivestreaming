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
        contentView.delegate = self
        self.view = contentView
    
    }
}

extension SearchViewController: SearchViewDelegate {
 
    func searchBy(keyword: String) {
        
        // Harcoded url
        let player = AVPlayer(url: URL(string: "https://stream.livestreamfails.com/video/5c103d427afc4.mp4")!)
        let vc = AVPlayerViewController()
        vc.player = player
        
        present(vc, animated: true) {
            vc.player?.play()
        }
    }
    
}

