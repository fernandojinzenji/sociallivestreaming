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
    
    func searchBy(keyword: String)
}

class SearchView: UIView {
    
    // Delegate property
    public weak var delegate: SearchViewDelegate?
    
    // UI elements
    private var searchTextField = UITextField()

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
    
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    @objc private func searchButtonTapped() {
        self.delegate?.searchBy(keyword: searchTextField.text ?? "")
    }
}

//// Public methods available to controller
//extension SearchView {
//    
//    public func playVideo(avPlayerController: AVPlayerViewController) {
//        
//        avPlayerController.present(vc, animated: true) {
//            vc.player?.play()
//        }
//    }    
//}
