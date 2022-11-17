//
//  LoginViewController.swift
//  messageTesting
//
//  Created by Stella Bailey on 11/12/22.
//

import UIKit
import FirebaseAuth
import JGProgressHUD

class LoginViewController: UIViewController {
    
    private let spinner = JGProgressHUD(style: .dark)
    
    private let scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.clipsToBounds = true
        return scrollView
    }()
    
    private let imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "logo")
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    private let emailField: UITextField = {
        let field = UITextField()
        field.autocapitalizationType = .none
        field.autocorrectionType = .no
        field.returnKeyType = .continue
        field.layer.cornerRadius = 12
        field.layer.borderWidth = 1
        field.layer.borderColor = UIColor.lightGray.cgColor
        field.placeholder = "Email address.... "
        
        field.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 5, height: 0))
        field.leftViewMode = .always
        field.backgroundColor = .white
        return field
    }()
    
    private let passwordField: UITextField = {
        let field = UITextField()
        field.autocapitalizationType = .none
        field.autocorrectionType = .no
        field.returnKeyType = .done
        field.layer.cornerRadius = 12
        field.layer.borderWidth = 1
        field.layer.borderColor = UIColor.lightGray.cgColor
        field.placeholder = "Password.... "
        
        field.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 5, height: 0))
        field.leftViewMode = .always
        field.backgroundColor = .white
        field.isSecureTextEntry = true
        return field
    }()
    
    
    @IBOutlet weak var loginButton: UIButton!
    private func configureButton(){
        loginButton.setTitle("Log In", for: .normal)
        loginButton.backgroundColor = .link
        loginButton.setTitleColor(.white, for: .normal)
        loginButton.layer.cornerRadius = 12
        loginButton.layer.masksToBounds = true
        loginButton.titleLabel?.font = .systemFont(ofSize: 20, weight: .bold)
    }
    
    @IBOutlet weak var register: UIButton!
    private func configureRegister(){
        register.setTitle("Register New User", for: .normal)
        register.backgroundColor = .red
        register.setTitleColor(.white, for: .normal)
        register.layer.cornerRadius = 12
        register.layer.masksToBounds = true
        register.titleLabel?.font = .systemFont(ofSize: 20, weight: .bold)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureButton()
        configureRegister()
        title = "Log in"
        view.backgroundColor = .white
        loginButton.addTarget(self, action: #selector(loginButtonTapped), for: .touchUpInside)
        
        emailField.delegate = self
        passwordField.delegate = self
        
        // Ad subviews
        view.addSubview(scrollView)
        scrollView.addSubview(imageView)
        scrollView.addSubview(emailField)
        scrollView.addSubview(passwordField)
        scrollView.addSubview(loginButton)
        scrollView.addSubview(register)
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        scrollView.frame = view.bounds
        
        let size = view.width/3
        imageView.frame = CGRect(x: (view.width-size)/2, y: 100, width: size, height: size)
        
        emailField.frame = CGRect(x: 30, y:  imageView.bottom+10, width: scrollView.width-60, height: 52)
        
        passwordField.frame = CGRect(x: 30, y:  emailField.bottom+10, width: scrollView.width-60, height: 52)
        
        loginButton.frame = CGRect(x: 30, y:  passwordField.bottom+10, width: scrollView.width-60, height: 52)
        
        register.frame = CGRect(x: 30, y: loginButton.bottom+1, width: scrollView.width-60, height: 52)
        
    }
    
    @objc private func loginButtonTapped() {
        emailField.resignFirstResponder()
        passwordField.resignFirstResponder()
        
        guard let email = emailField.text, let password = passwordField.text, !email.isEmpty, !password.isEmpty, password.count >= 6 else{
            alertUserLoginError()
            return
        }
        
        spinner.show(in: view)
        
        //Firebase login
        FirebaseAuth.Auth.auth().signIn(withEmail: email, password: password, completion: {[weak self] authResult, error in
            
            guard let strongSelf = self else {
                return
            }
            DispatchQueue.main.async{
                strongSelf.spinner.dismiss()
            }
            guard let result = authResult, error == nil else{
                print("failed to log in user with email")
                //should not move to next page
                return
            }
            
            let user = result.user
            
            let safeEmail = DatabaseManager.safeEmail(emailAddress: email)
            DatabaseManager.shared.getDataFor(path: safeEmail, completion: {result in
                switch result {
                case .success(let data):
                    guard let userData = data as? [String: Any],
                          let firstName = userData["first_name"] as? String,
                          let lastName = userData["last_name"] as? String else {
                        return
                    }
                    UserDefaults.standard.set("\(firstName) \(lastName)", forKey: "name")
                    
                case .failure(let error):
                    print("failed to read data with error \(error)")
                }
            })
            
            UserDefaults.standard.set(email, forKey: "email")   // saves the user's email
            
            print("Logged in user: \(user)")
            strongSelf.navigationController?.dismiss(animated: true, completion: nil)
        })
    }
    
    func alertUserLoginError(){
        let alert = UIAlertController(title: "Woops", message: "Please enter all information to log in", preferredStyle: .alert)
        
        alert.addAction(UIAlertAction(title:"Dismiss", style: .cancel, handler: nil))
        
        present(alert, animated: true)
    }
    
    
}

extension LoginViewController: UITextFieldDelegate{
    func textFieldShouldReturn(_ textField: UITextField) ->Bool{
        if textField == emailField{
            passwordField.becomeFirstResponder()
        }
        else if textField == passwordField{
            loginButtonTapped()
        }
        
        return true
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        loginButtonTapped()
    }
}
