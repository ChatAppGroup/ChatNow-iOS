//
//  SetupViewController.swift
//  ChatNow
//
//  Created by David on 12/7/21.
//

import UIKit
import FirebaseAuth
import Firebase

class SetupViewController: UIViewController {

    @IBOutlet weak var imageField: UIImageView!
    @IBOutlet weak var emailField: UITextField!
    @IBOutlet weak var passwordField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        title = "Create Account"
        view.backgroundColor = .white
       
        
        //Add subviews
        view.addSubview(imageField)
        
        let gesture = UITapGestureRecognizer(target: self, action: #selector(didTapChangeProfilePic))
        imageField.addGestureRecognizer(gesture)
    }
    
    @objc private func didTapChangeProfilePic(){
        presentPhotoActionSheet()
    }
    
    @IBAction func loginFromregister(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func signUpConfirm(_ sender: Any) {
        
        if emailField.text?.isEmpty == true {
            print("No text in email field")
            return
        }
        if passwordField.text?.isEmpty == true {
            print("No text in password field")
            return
        }
        else {
            
            let email = emailField.text!
            let password = passwordField.text!
            
            Auth.auth().createUser(withEmail: email, password: password) {
               [weak self] authResult, error in
                
                if error == nil{
                    
                        self?.performSegue(withIdentifier: "loginSegue", sender: self)
                }
                else{
                    print(error)
                    return
                }
                guard let strongSelf = self else
                {
                    return
                }
            }
        }
    }
}

extension SetupViewController: UIImagePickerControllerDelegate, UINavigationControllerDelegate{
    
    func presentPhotoActionSheet(){
        let actionSheet = UIAlertController(title: "Profile Picture", message: "How would you like ot select a picture", preferredStyle: .actionSheet)
        actionSheet.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: nil))
        actionSheet.addAction(UIAlertAction(title: "Take Photo", style: .default, handler: { _ in
            self.presentCamera()
        }))
        actionSheet.addAction(UIAlertAction(title: "Choose Photo", style: .default, handler: { _ in
            self.presentPhotoPicker()
        }))
        present(actionSheet, animated: true)
    }
    
    func presentCamera(){
        let vc = UIImagePickerController()
        vc.sourceType = .camera
        vc.delegate = self
        vc.allowsEditing = true
        present(vc, animated: true)
    }
    
    func presentPhotoPicker(){
        let vc = UIImagePickerController()
        vc.sourceType = .photoLibrary
        vc.delegate = self
        vc.allowsEditing = true
        present(vc, animated: true)
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
//        print(info)
        picker.dismiss(animated: true, completion: nil)
        
        guard let selectedImage = info[UIImagePickerController.InfoKey.editedImage] as? UIImage else {
            return
        }
        self.imageField.image = selectedImage
    }
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        picker.dismiss(animated: true, completion: nil)
    }
}
