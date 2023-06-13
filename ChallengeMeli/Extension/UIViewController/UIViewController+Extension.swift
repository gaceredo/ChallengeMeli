//
//  UIViewController+Extension.swift
//  ChallengeMeli
//
//  Created by Gustavo Aceredo on 8/6/23.
//

import UIKit
import MBProgressHUD

extension UIViewController {
    
    func showHud() {
        MBProgressHUD.showAdded(to: view, animated: true)
    }

    func hideHud() {
        MBProgressHUD.hide(for: view, animated: true)
    }
}
