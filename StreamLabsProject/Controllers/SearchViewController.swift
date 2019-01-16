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
//        self.view = contentView
        
//        let smallView = UIView()
//        smallView.translatesAutoresizingMaskIntoConstraints = false
//        self.view.addSubview(smallView)
//        smallView.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
//        smallView.centerYAnchor.constraint(equalTo: self.view.centerYAnchor).isActive = true
//        smallView.heightAnchor.constraint(equalToConstant: 80.0).isActive = true
//        smallView.widthAnchor.constraint(equalToConstant: 120.0).isActive = true
        
//        let player = AVPlayer(url: URL(string: "https://stream.livestreamfails.com/video/5c103d427afc4.mp4")!)
//
////        let superLayer = smallView.layer
//        
//        let playerLayer = AVPlayerLayer(player: player)
//        
////        playerLayer.videoGravity = AVLayerVideoGravity.resizeAspectFill
//        view.layer.addSublayer(playerLayer)
//        playerLayer.frame = view.frame
//
////        player.seek(to: CMTime(seconds: 0, preferredTimescale: CMTimeScale(exactly: 0)!))
//        player.play()
//        
        
//        let vc = AVPlayerViewController()
//        vc.player = player
//
//        present(vc, animated: true) {
//            vc.player?.play()
//        }
    }
}
