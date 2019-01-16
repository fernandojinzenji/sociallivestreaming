//
//  StreamView.swift
//  StreamLabsProject
//
//  Created by Fernando Jinzenji on 2019-01-15.
//  Copyright © 2019 Fernando Jinzenji. All rights reserved.
//

import UIKit
import AVFoundation

class StreamView: UIView {
    
    // UI elements
    private var tableView = UITableView()
    
    // Data
    private var cellHeight = 0
    private var videos = [Video]()
    private var currentCell: StreamCell?
    private var initialLoad = true

    override init(frame: CGRect) {
        super.init(frame: frame)
        
        tableView.isPagingEnabled = true
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.register(StreamCell.self, forCellReuseIdentifier: "cell")
        tableView.backgroundColor = .black
        tableView.delegate = self
        tableView.dataSource = self
        tableView.contentInsetAdjustmentBehavior = .never
        self.addSubview(tableView)
        tableView.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
        tableView.bottomAnchor.constraint(equalTo: self.bottomAnchor).isActive = true
        tableView.leftAnchor.constraint(equalTo: self.leftAnchor).isActive = true
        tableView.rightAnchor.constraint(equalTo: self.rightAnchor).isActive = true
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    

}

extension StreamView: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return videos.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = StreamCell(frame: CGRect(x: 0, y: 0, width: tableView.frame.width, height: tableView.frame.height))
        
        let video = videos[indexPath.row]
        cell.setVideo(video: video)
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        return frame.height
    }
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {

        let cell = cell as! StreamCell
        
        if initialLoad { // first loop on the tableview
            if indexPath.row == 0 {
                cell.loadVideo()
                currentCell = cell
            }
            else if indexPath.row == videos.count - 1 {
                initialLoad = false
            }
        }
        else {
            currentCell = cell
            currentCell?.loadVideo()
        }
    }
    
    func tableView(_ tableView: UITableView, didEndDisplaying cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        
        let cell = cell as! StreamCell
        cell.stopVideo()
        
    }
}

// Public methods available to controller
extension StreamView {
    
    public func loadStream(videos: [Video]) {
        
        self.videos = videos
        tableView.reloadData()
    }
    
    public func stopCurrentVideo() {
        
        self.currentCell?.stopVideo()
    }
}






// Custom cell
class StreamCell: UITableViewCell {
    
    private var player: AVPlayer?
    private var streamURL = ""
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.backgroundColor = UIHelper.getStreamLabsGreenColor()
    }
    
    func setVideo(video: Video) {
        streamURL = video.streamURL
        
        let activityIndicator = UIActivityIndicatorView()
        activityIndicator.translatesAutoresizingMaskIntoConstraints = false
        activityIndicator.isHidden = false
        self.addSubview(activityIndicator)
        activityIndicator.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        activityIndicator.centerYAnchor.constraint(equalTo: self.centerYAnchor).isActive = true
        activityIndicator.startAnimating()
        
    }
    
    func loadVideo() {
        
        if let url = URL(string: streamURL) {
            
            player = AVPlayer(url: url)
            let playerLayer = AVPlayerLayer(player: player)
            self.layer.addSublayer(playerLayer)
            playerLayer.frame = UIApplication.shared.keyWindow!.frame
            player!.play()
            
            NotificationCenter.default.addObserver(forName: .AVPlayerItemDidPlayToEndTime, object: self.player!.currentItem, queue: .main) { [weak self] _ in
                self?.player?.seek(to: CMTime.zero)
                self?.player?.play()
            }
        }
    }
    
    func stopVideo() {

        self.player?.pause()
        self.player = nil
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
