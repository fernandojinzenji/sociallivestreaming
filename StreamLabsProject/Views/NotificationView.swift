//
//  NotificationView.swift
//  StreamLabsProject
//
//  Created by Fernando Jinzenji on 2019-01-15.
//  Copyright © 2019 Fernando Jinzenji. All rights reserved.
//

import UIKit

class NotificationView: UIView {

    // UI elements
    var tableView = UITableView()
    var refreshControl = UIRefreshControl()
    
    // Data
    var notificationList = [Notification]()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = .white
        
        refreshControl.addTarget(self, action: #selector(endRefreshControl), for: .valueChanged)
        
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.register(NotificationCell.self, forCellReuseIdentifier: "cell")
        tableView.delegate = self
        tableView.dataSource = self
        tableView.refreshControl = refreshControl
        tableView.allowsSelection = false
        self.addSubview(tableView)
        tableView.topAnchor.constraint(equalTo: self.layoutMarginsGuide.topAnchor).isActive = true
        tableView.bottomAnchor.constraint(equalTo: self.layoutMarginsGuide.bottomAnchor).isActive = true
        tableView.leftAnchor.constraint(equalTo: self.layoutMarginsGuide.leftAnchor).isActive = true
        tableView.rightAnchor.constraint(equalTo: self.layoutMarginsGuide.rightAnchor).isActive = true
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    @objc func endRefreshControl() {
        
        refreshControl.endRefreshing()
    }
}

// Public methods available to controller
extension NotificationView {
    
    public func updateTableView(list: [Notification]) {
        
        self.notificationList = list
        
        tableView.reloadData()
    }
}

//
extension NotificationView: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return notificationList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! NotificationCell
        
        cell.setData(notification: notificationList[indexPath.row])
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 80.0
    }
}












// Custom Cell
class NotificationCell: UITableViewCell {

    // UI elements
    var avatarImageView = UIImageView()
    var descriptionLabel = UILabel()
    var watchButton = UIButton()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        avatarImageView.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(avatarImageView)
        avatarImageView.leadingAnchor.constraint(equalTo: self.leadingAnchor).isActive = true
        avatarImageView.heightAnchor.constraint(equalToConstant: 50.0).isActive = true
        avatarImageView.widthAnchor.constraint(equalToConstant: 50.0).isActive = true
        avatarImageView.centerYAnchor.constraint(equalTo: self.centerYAnchor).isActive = true
        
        watchButton.translatesAutoresizingMaskIntoConstraints = false
        watchButton.backgroundColor = UIColor.red
        watchButton.setTitle("Watch", for: .normal)
        watchButton.setTitleColor(UIColor.white, for: .normal)
        watchButton.titleLabel?.font = UIFont.systemFont(ofSize: 15.0)
        watchButton.layer.cornerRadius = 5.0
        self.addSubview(watchButton)
        watchButton.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -4.0).isActive = true
        watchButton.centerYAnchor.constraint(equalTo: self.centerYAnchor).isActive = true
        watchButton.widthAnchor.constraint(equalToConstant: 70.0).isActive = true
        
        descriptionLabel.translatesAutoresizingMaskIntoConstraints = false
        descriptionLabel.numberOfLines = 0
        self.addSubview(descriptionLabel)
        descriptionLabel.leadingAnchor.constraint(equalTo: avatarImageView.trailingAnchor, constant: 8.0).isActive = true
        descriptionLabel.centerYAnchor.constraint(equalTo: self.centerYAnchor).isActive = true
        descriptionLabel.topAnchor.constraint(equalTo: self.topAnchor, constant: 4.0).isActive = true
        descriptionLabel.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -4.0).isActive = true
        descriptionLabel.trailingAnchor.constraint(equalTo: watchButton.leadingAnchor, constant: -4.0).isActive = true
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    public func setData(notification: Notification) {
    
        avatarImageView.image = notification.avatar
        descriptionLabel.text = "\(notification.username) is LIVE\n\(notification.description)"
        
    }
}
