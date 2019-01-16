//
//  SearchView.swift
//  StreamLabsProject
//
//  Created by Fernando Jinzenji on 2019-01-15.
//  Copyright © 2019 Fernando Jinzenji. All rights reserved.
//

import UIKit

class SearchView: UIView {
    
    // UI elements
    private var searchTextField = UITextField()

    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = .white
        
        searchTextField.translatesAutoresizingMaskIntoConstraints = false
        searchTextField.placeholder = "Search by ID (livestreamfails.com)"
        searchTextField.backgroundColor = UIColor(red: 0.9, green: 0.9, blue: 0.9, alpha: 1.0)
        searchTextField.font = UIFont.systemFont(ofSize: 15.0)
        self.addSubview(searchTextField)
        searchTextField.topAnchor.constraint(equalTo: self.layoutMarginsGuide.topAnchor, constant: 12.0).isActive = true
        searchTextField.leftAnchor.constraint(equalTo: self.layoutMarginsGuide.leftAnchor, constant: 8.0).isActive = true
        searchTextField.rightAnchor.constraint(equalTo: self.layoutMarginsGuide.rightAnchor, constant: -8.0).isActive = true
        searchTextField.heightAnchor.constraint(equalToConstant: 40.0).isActive = true
        
        let loupe = UIImageView(frame: CGRect(x: 0, y: 0, width: 20, height: 20))
        loupe.image = #imageLiteral(resourceName: "search")
        loupe.tintColor = UIColor.lightGray
        searchTextField.leftView = loupe
        searchTextField.leftViewMode = .always
        

    
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}
