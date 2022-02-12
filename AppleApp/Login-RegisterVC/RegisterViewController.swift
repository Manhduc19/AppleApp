//
//  RegisterViewController.swift
//  AppleApp
//
//  Created by Thanh Nguyên Trần on 28/12/2021.
//

import UIKit
import FirebaseAuth
import ProgressHUD
import FirebaseFirestore


class RegisterViewController: UIViewController {

    @IBOutlet weak var repasswordTextField: UITextField!
    @IBOutlet weak var errorlabel: UILabel!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var emailTextField: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()

        errorlabel.isHidden = true
    }

    @IBAction func backButtonDidTap(_ sender: Any) {
        navigationController?.popViewController(animated: true)
    }
    
    @IBAction func registerButtonDidTap(_ sender: Any) {
        guard let email = emailTextField.text, let password = passwordTextField.text
        else { return  }
        
        if isValidInformantion(){
            ProgressHUD.show()
            Auth.auth().createUser(withEmail: email, password: password) { authResult, error in
                ProgressHUD.dismiss()
                if error != nil {
                    self.errorlabel.text = error?.localizedDescription
                    }
                else{
                    if let user = authResult?.user {
                        let vc = TabBarViewController()
                        self.navigationController?.pushViewController(vc, animated: true)
                        
                        self.addNewUserToFireStore(user: user)
     
                    }
                }
            }
        }
    }
    func addNewUserToFireStore(user: User) {
        let db = Firestore.firestore()
        let collection = db.collection("User")
        let document = collection.document(user.uid)
        document.setData(["UID" : user.uid ,"Display Name":"", "Email" : user.email ?? "","Date": "" , "Address": "", "Avatar" : ""  ])
    }
   
    private func isValidInformantion() -> Bool {
        if emailTextField.text!.isEmpty || passwordTextField.text!.isEmpty || repasswordTextField.text!.isEmpty {
            errorlabel.isHidden = false
            errorlabel.text = "Please type email & password"
            return false
        }
        else if passwordTextField.text != repasswordTextField.text
        {
            errorlabel.isHidden = false
            errorlabel.text = "Please confirm password"
            return false
        }
        return true
    }

}
