//
//  SignUpStep2ViewController.swift
//  test2
//
//  Created by Julianne on 11/8/22.
//

import UIKit

class SignUpStep2ViewController: UIViewController {

    @IBOutlet weak var emailFieldLabel: UILabel!
    @IBOutlet weak var emailField: UITextField!
    @IBOutlet weak var nextButton: UIButton!
    
    var user: User?
    override func viewDidLoad() {
        super.viewDidLoad()
        self.emailFieldLabel.text = "Hi \(user!.name!). What's your school email?"

        // Do any additional setup after loading the view.
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        self.user?.email = emailField.text
        let profile = segue.destination as! ProfileViewController
        profile.user = self.user
    }
    
    override func shouldPerformSegue(withIdentifier identifier: String, sender: Any?) -> Bool {
        if let email = emailField.text, email.hasSuffix("pitt.edu"){
            return true
        }
        let alertController = UIAlertController(title: "Wait a Minute!", message:"You must register with your Pitt email", preferredStyle: .alert)
        let okAction = UIAlertAction(title:"OK", style: .default, handler: nil)
        alertController.addAction(okAction)
        self.present(alertController, animated: true, completion: nil)
        return false
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
