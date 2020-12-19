//
//  UIViewController.swift
//  CommonExtension
//
//  Created by 김종권 on 2020/12/19.
//

import Foundation
import UIKit

public extension UIViewController {
    func showAlert(title: String? = "", message: String?, actionTitle: String = "OK", actionCallback: (() -> Void)? = nil) {
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alertController.addAction(UIAlertAction(title: actionTitle, style: .default, handler: { (_) in
            actionCallback?()
        }))
        present(alertController, animated: true, completion: nil)
    }
}

