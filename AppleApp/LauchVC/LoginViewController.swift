//
//  LoginViewController.swift
//  AppleApp
//
//  Created by Thanh Nguyên Trần on 28/12/2021.
//

import UIKit

class LoginViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        
    }

    @IBAction func RegisterButtonDidTap(_ sender: Any) {
        let vc = RegisterViewController()
        navigationController?.pushViewController(vc, animated: true)
    }
    @IBAction func loginButtonDidTap(_ sender: Any) {
        let vc = LoginVCViewController()
        navigationController?.pushViewController(vc, animated: true)
    }
    
}
