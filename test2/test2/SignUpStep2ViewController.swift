//
//  SignUpStep2ViewController.swift
//  test2
//
//  Created by Julianne on 11/8/22.
//

import UIKit
import FirebaseAuth
import FirebaseDatabase
class SignUpStep2ViewController: UIViewController {

    @IBOutlet weak var emailFieldLabel: UILabel!
    @IBOutlet weak var emailField: UITextField!
    @IBOutlet weak var nextButton: UIButton!
    @IBOutlet weak var PasswordField: UITextField!
    
    var user: User = User(name: "", email: "")
    override func viewDidLoad() {
        super.viewDidLoad()
        //var user: User = self.user
        self.emailFieldLabel.text = "Hi \(user.name!). What's your school email?"

        // Do any additional setup after loading the view.
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let profile = segue.destination as! ProfileViewController
        profile.user = self.user
        
        
    }
    
    override func shouldPerformSegue(withIdentifier identifier: String, sender: Any?) -> Bool {
        if let email = emailField.text, email.hasSuffix("pitt.edu"){
            registerNewUser()
            return true
        }
        let alertController = UIAlertController(title: "Wait a Minute!", message:"You must register with your Pitt email", preferredStyle: .alert)
        let okAction = UIAlertAction(title:"OK", style: .default, handler: nil)
        alertController.addAction(okAction)
        self.present(alertController, animated: true, completion: nil)
        return false
    }
    func registerNewUser(){
        let email = emailField.text!
        let password = PasswordField.text!
        let name = self.user.name
        DatabaseAPI.shared.checkIfEmailExists(with: email,
            completion: {[weak self] exists in guard let strongSelf = self else{
            return
        }
            guard !exists else{
                strongSelf.error(message: "This email already exists. Please use another email address")
                return
            }
            FirebaseAuth.Auth.auth().createUser(withEmail: email, password: password, completion: {authResults, error in
                guard authResults != nil, error == nil
                else{
                    return
                    
                }
                DatabaseAPI.shared.postNewUser(with:User(name: name, email: email), completion: {success in let user = User(name: name, email: email)
                    print("New User is created!")
                })
            })
        })
    }
    func error(message: String){
        let alert = UIAlertController(title: "Error", message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .cancel, handler: nil))
        present(alert, animated: true)
    }
    
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
