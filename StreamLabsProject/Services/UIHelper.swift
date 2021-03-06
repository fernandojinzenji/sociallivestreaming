//
//  UIHelper.swift
//  StreamLabsProject
//
//  Created by Fernando Jinzenji on 2019-01-15.
//  Copyright © 2019 Fernando Jinzenji. All rights reserved.
//

import Foundation
import UIKit

public class UIHelper {
    
    public class func displayError(viewController: UIViewController) {
        
        let alert = UIAlertController(title: "Error", message: "Sorry, this feature is not working in this version.", preferredStyle: UIAlertController.Style.alert)
        alert.addAction(UIAlertAction(title: "Close", style: .default, handler: nil))
        viewController.present(alert, animated: true, completion: nil)
        
    }
    
    public class func getStreamLabsGreenColor() -> UIColor {
        return UIColor(red: 98/255, green: 192/255, blue: 164/255, alpha: 1.0)
    }
}
