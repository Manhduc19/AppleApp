//
//  ForgotPasswordViewController.swift
//  AppleApp
//
//  Created by Thanh Nguyên Trần on 28/12/2021.
//

import UIKit
import Firebase
import ProgressHUD

class ForgotPasswordViewController: UIViewController {

    @IBOutlet weak var errorLabel: UILabel!
    @IBOutlet weak var emailTextfield: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()

        errorLabel.isHidden = true
    }


    
    @IBAction func resetpasswordButtonDidTap(_ sender: Any) {
        ProgressHUD.show()
        self.errorLabel.isHidden = false
        Auth.auth().sendPasswordReset(withEmail: emailTextfield.text!) { error in
            if error != nil{
                self.errorLabel.text = error?.localizedDescription
            }
            else {
                self.errorLabel.text = "Please check your email to reset password"
            }
        }
        ProgressHUD.dismiss()
    }
    
    @IBAction func backtologinButtonDidTap(_ sender: Any) {
        let vc = LoginVCViewController()
        navigationController?.pushViewController(vc, animated: true)
    }
    
}
