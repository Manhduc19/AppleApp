//
//  ChangePasswordViewController.swift
//  AppleApp
//
//  Created by Thanh Nguyên Trần on 06/01/2022.
//

import UIKit
import Firebase
import ProgressHUD

class ChangePasswordViewController: UIViewController {

    @IBOutlet weak var saveButton: UIButton!
    @IBOutlet weak var errorLabel: UILabel!
    @IBOutlet weak var renewpasswordTF: UITextField!
    @IBOutlet weak var passwordTF: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        errorLabel.isHidden = true
        saveButton.layer.borderWidth = 1
        saveButton.layer.cornerRadius = 10
        
    }
    @IBAction func savePasswordButtonDidTap(_ sender: Any) {
        if passwordTF.text! != renewpasswordTF.text!
        {
            errorLabel.isHidden = false
            errorLabel.text = "Please confirm password"
        }else{
            ProgressHUD.show()
            Auth.auth().currentUser?.updatePassword(to: passwordTF.text!) { error in
              let vc = ProfileViewController()
                self.navigationController?.pushViewController(vc, animated: true)
            }
            ProgressHUD.dismiss()
        }
    }
}
