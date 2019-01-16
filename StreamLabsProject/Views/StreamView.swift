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
    private var currentIndex: Int?
    private var nextIndex: Int?
    private var currentCell = StreamCell()

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
        
//        currentCell.stopVideo()
//
        // Display first video
        if currentIndex == nil {
            currentIndex = 0
            nextIndex = 0
            cell.loadVideo()
        }
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        return frame.height
    }
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        
//        self.currentIndex = self.nextIndex
//        self.nextIndex = indexPath.row
        
        let cell = cell as! StreamCell
        cell.loadVideo()
        
    }
    
    func tableView(_ tableView: UITableView, didEndDisplaying cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        
//        self.currentIndex =
        
    }
    
//    func tableView(_ tableView: UITableView, didEndDisplaying cell: UITableViewCell, forRowAt indexPath: IndexPath) {
//
//        if let visibleRows = tableView.indexPathsForVisibleRows, visibleRows.count > 0 {
//
//            // Even though each cell takes full screen, sometimes indexPathsForVisibleRows returns 2 values
//            if visibleRows.count > 1 {
//
//                if visibleRows[0].row == nextIndex {
//                    currentIndex = visibleRows[0].row
//                    nextIndex = visibleRows[1].row
//                }
//                else {
//                    currentIndex = visibleRows[1].row
//                    nextIndex = visibleRows[0].row
//                }
//
//            }
//            else {
//                currentIndex = visibleRows[0].row
//                nextIndex = visibleRows[0].row
//            }
//
//            if let currentIndex = self.currentIndex, let nextIndex = self.nextIndex, currentIndex != nextIndex {
//                // Stop current video
//                let inactiveCell = tableView.cellForRow(at: IndexPath(row: currentIndex, section: 0)) as! StreamCell
//                inactiveCell.stopVideo()
//
//                // Play next video
//                let activeCell = tableView.cellForRow(at: IndexPath(row: nextIndex, section: 0)) as! StreamCell
//                activeCell.loadVideo()
//            }
//        }
//    }
}

// Public methods available to controller
extension StreamView {
    
    public func loadStream(videos: [Video]) {
        
        self.videos = videos
        tableView.reloadData()
    }
    
}






// Custom cell
class StreamCell: UITableViewCell {
    
    private var player: AVPlayer?
    private var streamURL = ""
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.backgroundColor = .white
    }
    
    func setVideo(video: Video) {
        streamURL = video.streamURL
        
        let text = UILabel()
        text.text = video.hashtag
        text.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(text)
        text.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        text.centerYAnchor.constraint(equalTo: self.centerYAnchor).isActive = true
    }
    
    func loadVideo() {
        
        if let url = URL(string: streamURL) {
            
            player = AVPlayer(url: url)
            let playerLayer = AVPlayerLayer(player: player)
            self.layer.addSublayer(playerLayer)
            playerLayer.frame = UIApplication.shared.keyWindow!.frame
            player!.play()
        }
    }
    
    func stopVideo() {
        
        self.player = nil
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
