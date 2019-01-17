//
//  SearchView.swift
//  StreamLabsProject
//
//  Created by Fernando Jinzenji on 2019-01-15.
//  Copyright © 2019 Fernando Jinzenji. All rights reserved.
//

import UIKit
import AVFoundation
import AVKit

protocol SearchViewDelegate: class {
    
    func displayVideo(videoURL: String)
}

class SearchView: UIView {
    
    // Delegate property
    public weak var delegate: SearchViewDelegate?
    
    // UI elements
    private var searchTextField = UITextField()
    private var collectionView: UICollectionView!
    
    // Data
    private var hashtagTopList = [Video]()
//    private var hashtagMiddleList = [Video]()
//    private var hashtagBottomList = [Video]()

    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = UIHelper.getStreamLabsGreenColor()
        
        let searchButton = UIButton()
        searchButton.translatesAutoresizingMaskIntoConstraints = false
        searchButton.setTitle("Go", for: .normal)
        searchButton.setTitleColor(.black, for: .normal)
        self.addSubview(searchButton)
        searchButton.topAnchor.constraint(equalTo: self.layoutMarginsGuide.topAnchor, constant: 8.0).isActive = true
        searchButton.rightAnchor.constraint(equalTo: self.layoutMarginsGuide.rightAnchor, constant: -4.0).isActive = true
        searchButton.heightAnchor.constraint(equalToConstant: 30.0).isActive = true
        searchButton.widthAnchor.constraint(equalToConstant: 30.0).isActive = true
        
        searchTextField.translatesAutoresizingMaskIntoConstraints = false
        searchTextField.placeholder = "Search by ID (livestreamfails.com)"
        searchTextField.backgroundColor = UIColor(red: 0.9, green: 0.9, blue: 0.9, alpha: 1.0)
        searchTextField.font = UIFont.systemFont(ofSize: 15.0)
        self.addSubview(searchTextField)
        searchTextField.topAnchor.constraint(equalTo: searchButton.topAnchor).isActive = true
        searchTextField.leftAnchor.constraint(equalTo: self.layoutMarginsGuide.leftAnchor, constant: 8.0).isActive = true
        searchTextField.rightAnchor.constraint(equalTo: searchButton.leftAnchor, constant: -4.0).isActive = true
        searchTextField.bottomAnchor.constraint(equalTo: searchButton.bottomAnchor).isActive = true
        
        searchButton.addTarget(self, action: #selector(searchButtonTapped), for: .touchUpInside)
        
        let loupe = UIImageView(frame: CGRect(x: 0, y: 0, width: 20, height: 20))
        loupe.image = #imageLiteral(resourceName: "search")
        loupe.tintColor = UIColor.lightGray
        searchTextField.leftView = loupe
        searchTextField.leftViewMode = .always
        
        // Sample Collection View (could be nested in a table view to display multiple sections)
        let titleLabel = UILabel()
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.text = "#fortnite"
        titleLabel.font = UIFont.boldSystemFont(ofSize: 18.0)
        self.addSubview(titleLabel)
        titleLabel.topAnchor.constraint(equalTo: searchTextField.bottomAnchor, constant: 32.0).isActive = true
        titleLabel.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 4.0).isActive = true
        
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        collectionView = UICollectionView(frame: CGRect.zero, collectionViewLayout: layout)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.register(HashtagCell.self, forCellWithReuseIdentifier: "cell")
        collectionView.backgroundColor = UIHelper.getStreamLabsGreenColor()
        collectionView.delegate = self
        collectionView.dataSource = self
        self.addSubview(collectionView)
        collectionView.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 4.0).isActive = true
        collectionView.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 4.0).isActive = true
        collectionView.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -4.0).isActive = true
        collectionView.heightAnchor.constraint(equalToConstant: 100.0).isActive = true
    
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    @objc private func searchButtonTapped() {
        self.delegate?.displayVideo(videoURL: "https://stream.livestreamfails.com/video/5c103d427afc4.mp4")
    }
}

// Public methods available to controller
extension SearchView {
    
    public func loadHashtagTopList(videos: [Video]) {
        
        hashtagTopList = videos
        collectionView.reloadData()
    }
}

// CollectionView protocols - UICollectionViewDelegateFlowLayout, UICollectionViewDataSource
extension SearchView: UICollectionViewDelegateFlowLayout, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return hashtagTopList.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! HashtagCell
        
        let video = hashtagTopList[indexPath.item]
        cell.setVideo(video: video)
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 160, height: 90)
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let video = hashtagTopList[indexPath.item]
        self.delegate?.displayVideo(videoURL: video.streamURL)
    }
}








class HashtagCell: UICollectionViewCell {
    
    // UI elements
    private var coverImageView = UIImageView()
    
    // Data
    private var video: Video!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.backgroundColor = .white
        
        coverImageView.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(coverImageView)
        coverImageView.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
        coverImageView.bottomAnchor.constraint(equalTo: self.bottomAnchor).isActive = true
        coverImageView.leftAnchor.constraint(equalTo: self.leftAnchor).isActive = true
        coverImageView.rightAnchor.constraint(equalTo: self.rightAnchor).isActive = true
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    public func setVideo(video: Video) {
        self.video = video
        coverImageView.load(url: URL(string: video.coverImage)!)
    }
}

extension UIImageView {
    func load(url: URL) {
        DispatchQueue.global().async { [weak self] in
            if let data = try? Data(contentsOf: url) {
                if let image = UIImage(data: data) {
                    DispatchQueue.main.async {
                        self?.image = image
                    }
                }
            }
        }
    }
}
