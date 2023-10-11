//
//  UIViewController.swift
//  TestProject
//
//  Created by Developer on 11/10/2023.
//

import UIKit

extension UIViewController {
    func push(_ viewControllerIdentifier: String, animated: Bool = true) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let viewController = storyboard.instantiateViewController(withIdentifier: viewControllerIdentifier)
        self.navigationController?.pushViewController(viewController, animated: animated)
    }

        func showAlert(title: String, message: String, completion: (() -> Void)? = nil) {
            let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "OK", style: .default, handler: { _ in
                completion?()
            }))
            self.present(alert, animated: true, completion: nil)
        }
    }

