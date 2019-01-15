//
//  ProfileView.swift
//  StreamLabsProject
//
//  Created by Fernando Jinzenji on 2019-01-15.
//  Copyright © 2019 Fernando Jinzenji. All rights reserved.
//

import UIKit

class ProfileView: UIView {

    // UI elements
    private var profileImageView = UIImageView()
    private var usernameLabel = UILabel()
    private var videoCounterLabel = UILabel()
    private var followingCounterLabel = UILabel()
    private var fansCounterLabel = UILabel()
    private var heartsCounterLabel = UILabel()
    private var editButton = UIButton()
    private var bioLabel = UILabel()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = .white
        
        profileImageView.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(profileImageView)
        profileImageView.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        profileImageView.topAnchor.constraint(equalTo: self.layoutMarginsGuide.topAnchor, constant: 24.0).isActive = true
        profileImageView.heightAnchor.constraint(equalToConstant: 100.0).isActive = true
        profileImageView.widthAnchor.constraint(equalToConstant: 100.0).isActive = true
        
        usernameLabel.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(usernameLabel)
        usernameLabel.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        usernameLabel.topAnchor.constraint(equalTo: profileImageView.bottomAnchor, constant: 8.0).isActive = true
        
        videoCounterLabel.translatesAutoresizingMaskIntoConstraints = false
        videoCounterLabel.textColor = .white
        videoCounterLabel.textAlignment = .center
        videoCounterLabel.font = UIFont.systemFont(ofSize: 14.0)
        videoCounterLabel.layer.backgroundColor = UIColor.lightGray.cgColor
        videoCounterLabel.layer.cornerRadius = 15.0
        self.addSubview(videoCounterLabel)
        videoCounterLabel.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        videoCounterLabel.topAnchor.constraint(equalTo: usernameLabel.bottomAnchor, constant: 16.0).isActive = true
        videoCounterLabel.widthAnchor.constraint(equalToConstant: 80.0).isActive = true
        videoCounterLabel.heightAnchor.constraint(equalToConstant: 30.0).isActive = true
        
        // following, fans and hearts
        let socialStackView = UIStackView()
        socialStackView.distribution = .fillEqually
        socialStackView.axis = .horizontal
        socialStackView.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(socialStackView)
        socialStackView.leftAnchor.constraint(equalTo: self.leftAnchor).isActive = true
        socialStackView.rightAnchor.constraint(equalTo: self.rightAnchor).isActive = true
        socialStackView.topAnchor.constraint(equalTo: videoCounterLabel.bottomAnchor, constant: 16.0).isActive = true
        socialStackView.heightAnchor.constraint(equalToConstant: 40.0).isActive = true
        
        // following stack view
        let followingStackView = UIStackView()
        followingStackView.axis = .vertical
        followingStackView.translatesAutoresizingMaskIntoConstraints = false
        socialStackView.addArrangedSubview(followingStackView)
        
        followingCounterLabel.font = UIFont.boldSystemFont(ofSize: 16.0)
        followingCounterLabel.textAlignment = .center
        followingStackView.addArrangedSubview(followingCounterLabel)
        
        let followingTitleLabel = UILabel()
        followingTitleLabel.text = "Following"
        followingTitleLabel.font = UIFont.systemFont(ofSize: 11.0)
        followingTitleLabel.textAlignment = .center
        followingTitleLabel.textColor = UIColor.gray
        followingStackView.addArrangedSubview(followingTitleLabel)
        
        // fans stack view
        let fansStackView = UIStackView()
        fansStackView.axis = .vertical
        fansStackView.translatesAutoresizingMaskIntoConstraints = false
        socialStackView.addArrangedSubview(fansStackView)
        
        fansCounterLabel.font = UIFont.boldSystemFont(ofSize: 16.0)
        fansCounterLabel.textAlignment = .center
        fansStackView.addArrangedSubview(fansCounterLabel)
        
        let fansTitleLabel = UILabel()
        fansTitleLabel.text = "Fans"
        fansTitleLabel.font = UIFont.systemFont(ofSize: 11.0)
        fansTitleLabel.textAlignment = .center
        fansTitleLabel.textColor = UIColor.gray
        fansStackView.addArrangedSubview(fansTitleLabel)
        
        // hearts stack view
        let heartsStackView = UIStackView()
        heartsStackView.axis = .vertical
        heartsStackView.translatesAutoresizingMaskIntoConstraints = false
        socialStackView.addArrangedSubview(heartsStackView)
        
        heartsCounterLabel.font = UIFont.boldSystemFont(ofSize: 16.0)
        heartsCounterLabel.textAlignment = .center
        heartsStackView.addArrangedSubview(heartsCounterLabel)
        
        let heartsTitleLabel = UILabel()
        heartsTitleLabel.text = "Hearts"
        heartsTitleLabel.font = UIFont.systemFont(ofSize: 11.0)
        heartsTitleLabel.textAlignment = .center
        heartsTitleLabel.textColor = UIColor.gray
        heartsStackView.addArrangedSubview(heartsTitleLabel)
        
        editButton.translatesAutoresizingMaskIntoConstraints = false
        editButton.setTitle("Edit Profile", for: .normal)
        editButton.setTitleColor(.white, for: .normal)
        editButton.titleLabel?.font = UIFont.systemFont(ofSize: 15.0)
        editButton.backgroundColor = .red
        self.addSubview(editButton)
        editButton.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        editButton.topAnchor.constraint(equalTo: socialStackView.bottomAnchor, constant: 16.0).isActive = true
        editButton.widthAnchor.constraint(equalToConstant: 100.0).isActive = true
        editButton.heightAnchor.constraint(equalToConstant: 40.0).isActive = true
        
        bioLabel.translatesAutoresizingMaskIntoConstraints = false
        bioLabel.numberOfLines = 0
        bioLabel.font = UIFont.systemFont(ofSize: 13.0)
        bioLabel.textColor = UIColor.gray
        self.addSubview(bioLabel)
        bioLabel.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        bioLabel.topAnchor.constraint(equalTo: editButton.bottomAnchor, constant: 16.0).isActive = true
        
        // grid video list, liked videos
        let topHorizontalLine = UIView()
        topHorizontalLine.translatesAutoresizingMaskIntoConstraints = false
        topHorizontalLine.backgroundColor = UIColor(red: 0.9, green: 0.9, blue: 0.9, alpha: 1.0)
        self.addSubview(topHorizontalLine)
        topHorizontalLine.leftAnchor.constraint(equalTo: self.leftAnchor).isActive = true
        topHorizontalLine.rightAnchor.constraint(equalTo: self.rightAnchor).isActive = true
        topHorizontalLine.topAnchor.constraint(equalTo: bioLabel.bottomAnchor, constant: 16.0).isActive = true
        topHorizontalLine.heightAnchor.constraint(equalToConstant: 1.0).isActive = true
        
        let contentStackView = UIStackView()
        contentStackView.distribution = .fillEqually
        contentStackView.axis = .horizontal
        contentStackView.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(contentStackView)
        contentStackView.leftAnchor.constraint(equalTo: self.leftAnchor).isActive = true
        contentStackView.rightAnchor.constraint(equalTo: self.rightAnchor).isActive = true
        contentStackView.topAnchor.constraint(equalTo: topHorizontalLine.bottomAnchor, constant: 4.0).isActive = true
        contentStackView.heightAnchor.constraint(equalToConstant: 30.0).isActive = true
        
        let bottomHorizontalLine = UIView()
        bottomHorizontalLine.translatesAutoresizingMaskIntoConstraints = false
        bottomHorizontalLine.backgroundColor = UIColor(red: 0.9, green: 0.9, blue: 0.9, alpha: 1.0)
        self.addSubview(bottomHorizontalLine)
        bottomHorizontalLine.leftAnchor.constraint(equalTo: self.leftAnchor).isActive = true
        bottomHorizontalLine.rightAnchor.constraint(equalTo: self.rightAnchor).isActive = true
        bottomHorizontalLine.topAnchor.constraint(equalTo: contentStackView.bottomAnchor, constant: 4.0).isActive = true
        bottomHorizontalLine.heightAnchor.constraint(equalToConstant: 1.0).isActive = true
        
        let gridListButton = UIButton()
        gridListButton.setImage(#imageLiteral(resourceName: "keypad"), for: .normal)
        contentStackView.addArrangedSubview(gridListButton)
        
        let likedListButton = UIButton()
        likedListButton.setImage(#imageLiteral(resourceName: "heart"), for: .normal)
        contentStackView.addArrangedSubview(likedListButton)
        
        let videoList = UILabel()
        videoList.translatesAutoresizingMaskIntoConstraints = false
        videoList.numberOfLines = 0
        videoList.text = "No content"
        videoList.font = UIFont.systemFont(ofSize: 13.0)
        videoList.textColor = UIColor.gray
        self.addSubview(videoList)
        videoList.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        videoList.topAnchor.constraint(equalTo: bottomHorizontalLine.bottomAnchor, constant: 16.0).isActive = true
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}

// Public methods available to controller
extension ProfileView {
    
    public func setProfileData(profile: Profile) {
        
        profileImageView.image = profile.image
        usernameLabel.text = profile.username
        videoCounterLabel.text = String(profile.videoCounter)
        followingCounterLabel.text = String(profile.following)
        fansCounterLabel.text = String(profile.fans)
        heartsCounterLabel.text = String(profile.hearts)
        bioLabel.text = profile.bio
    }
    
}
