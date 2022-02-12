//
//  ProfileViewController.swift
//  AppleApp
//
//  Created by Thanh Nguyên Trần on 29/12/2021.
//

import UIKit
import Firebase
import ProgressHUD
import SDWebImage
import FirebaseAuth
import Toast_Swift

class ProfileViewController: UIViewController {

    @IBOutlet weak var headerView: UIView!
    @IBOutlet weak var addressTF: UITextField!
    @IBOutlet weak var paymentButton: UIButton!
    @IBOutlet weak var DateTF: UITextField!
    @IBOutlet weak var emailTF: UITextField!
    @IBOutlet weak var saveButton: UIButton!
    @IBOutlet weak var changepassButton: UIButton!
    @IBOutlet weak var nameTF: UITextField!
    @IBOutlet weak var imageAvatar: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()
        imageAvatar.backgroundColor = UIColor().mainColor()
        imageAvatar.layer.cornerRadius = imageAvatar.bounds.width / 2
        paymentButton.layer.borderWidth = 1
        saveButton.layer.borderWidth = 1
        paymentButton.layer.cornerRadius = 10
        saveButton.layer.cornerRadius = 10
        changepassButton.layer.borderWidth = 1
        changepassButton.tintColor = UIColor().mainColor()
        changepassButton.layer.cornerRadius = 10
        
        headerView.layer.borderWidth = 1
        headerView.layer.borderColor = CGColor.init(red: 0.87, green: 0.62, blue: 0.38, alpha: 1.00)
        changeImageAvatar()
        
        
        if let user = Auth.auth().currentUser {
            let db = Firestore.firestore()
            let collection = db.collection("User")
            let document = collection.document(user.uid)
            document.getDocument { (snapshot, err) in
                if let data = snapshot?.data() {
                    if let name = data["Display Name"]
                    {
                        self.nameTF.text = "\(name)"
                    }
                    if let date = data["Date"]
                    {
                        self.DateTF.text = "\(date)"
                    }
                    if let address = data["Address"]
                    {
                        self.addressTF.text = "\(address)"
                        
                    }
                    if let url = data["Avatar"] {
                        self.imageAvatar.sd_setImage(with: URL(string: url  as! String), completed: nil)
                    }
                        
                }
            }
            
           
            emailTF.text = user.email
            
        }
    }
    
    func changeImageAvatar(){
        let tapAvatar = UITapGestureRecognizer(target: self, action: #selector(DidTabChangeAvatar))
        imageAvatar.isUserInteractionEnabled = true
        imageAvatar.addGestureRecognizer(tapAvatar)
    }
    @objc func DidTabChangeAvatar(){
        
        let imagePicker = UIImagePickerController()
        let alert = UIAlertController(title: nil, message: "Choose options", preferredStyle: .actionSheet)
        let action1 = UIAlertAction(title: "Take a photo", style: .default) { action1 in
            imagePicker.sourceType = .camera
            self.present(imagePicker,animated: true,completion: nil)
        }
        let action2 = UIAlertAction(title: "Photo library", style: .default) { action2 in
            imagePicker.sourceType = .photoLibrary
            imagePicker.delegate = self
            self.present(imagePicker,animated: true,completion: nil)
            
        }
        let action3 = UIAlertAction(title: "Cancel", style:.cancel, handler: nil)
        alert.addAction(action1)
        alert.addAction(action2)
        alert.addAction(action3)
        present(alert, animated: true, completion: nil)
        
        
    }
    
    
    
    


    @IBAction func logoutButtonDidTap(_ sender: Any) {
        try? Auth.auth().signOut()
        let sceneDelegate =   self.view.window?.windowScene?.delegate as? SceneDelegate
        sceneDelegate?.setRootViewController()
    }
    
    @IBAction func changePasswordButtonDidTap(_ sender: Any) {
        let vc = ChangePasswordViewController()
        navigationController?.pushViewController(vc, animated: true)
    }
    
    @IBAction func paymentButtonDidTap(_ sender: Any) {
        let vc = PaymentViewController()
        navigationController?.pushViewController(vc, animated: true)
    }
    @IBAction func saveButtonDidTap(_ sender: Any) {
        ProgressHUD.show()
        let changeRequest = Auth.auth().currentUser?.createProfileChangeRequest()
        changeRequest?.commitChanges { error in
            // update display name
            guard let user = Auth.auth().currentUser else {return}
            ProgressHUD.dismiss()
//            let db = Firestore.firestore()
//            let collection = db.collection("User")
//            let document = collection.document(user.uid)
//            document.updateData(["Display Name": self.nameTF.text!, "Date": self.DateTF.text!, "Address": self.addressTF.text! ])
            
            
            let imageName = user.uid
            if let imageUpload = self.imageAvatar.image {
                if let imgData = imageUpload.jpegData(compressionQuality: 0.5){
                    
                    
                    //upload
                    let storageRef = Storage.storage().reference()
                    let uploadStorage = storageRef.child("Avatar").child(imageName)
                    uploadStorage.putData(imgData,metadata: nil){(meta,error) in
                        if error != nil{
                            self.view.makeToast(error?.localizedDescription)
                        }else{
                            //down anh ve sau khi update
                            uploadStorage.downloadURL { (url , error) in
                                if error != nil {
                                    self.view.makeToast(error?.localizedDescription)
                                }
                                else{
                                    guard let avatarUrl = url else {return}
                                    let db = Firestore.firestore()
                                    let collection = db.collection("User")
                                    let document = collection.document(user.uid)
                                    document.updateData(["Display Name": self.nameTF.text!, "Date": self.DateTF.text!, "Address": self.addressTF.text! ,"Avatar" : "\(avatarUrl)"])
                                    
                                }
                            }
                        }
                    }
                }

            }
        }
    
        
    }
}

extension ProfileViewController : UIImagePickerControllerDelegate & UINavigationControllerDelegate{
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        if let image = info[UIImagePickerController.InfoKey.originalImage] as? UIImage{
            imageAvatar.image = image
        }
        dismiss(animated: true, completion: nil)
    }
}
// upload anh

// clinet up anh
// fb luu anh , tra ve url anh
// clinet muoon hien thi anh  : download anh ve
      // clinet luu duong link anh o trong database
