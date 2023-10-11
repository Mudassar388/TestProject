//
//  ViewController.swift
//  TestProject
//
//  Created by Developer on 11/10/2023.
//

import UIKit

class AuthViewController: UIViewController {
    
    // MARK: - Outlet
    @IBOutlet weak var tfPassword: UITextField!
    @IBOutlet weak var tfUserName: UITextField!
    
    // MARK: - Methods
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    // MARK: - Nav
    @IBAction func signInTapped(_ sender: Any) {
        if let username = tfUserName.text, !username.isEmpty, let password = tfPassword.text, !password.isEmpty {
            // store creds in UserDefaults
            UserDefaults.standard.set(username, forKey: "username")
            UserDefaults.standard.set(password, forKey: "password")
      
            self.push(Controllers.list, animated: true)
        } else {
            self.showAlert(title: "Validation Error", message: "Please enter both username and password.")
        }
    }
}
