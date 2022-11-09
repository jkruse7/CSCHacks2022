//
//  SignUpStep1ViewController.swift
//  test2
//
//  Created by Julianne on 11/8/22.
//

import UIKit

class SignUpStep1ViewController: UIViewController {

    @IBOutlet weak var nameFieldLabel: UILabel!
    @IBOutlet weak var nameField: UITextField!
    @IBOutlet weak var nextButton: UIButton!
    
    var user: User?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.user=User()

        // Do any additional setup after loading the view.
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        self.user?.name = nameField.text
        let step2VC = segue.destination as! SignUpStep2ViewController
        step2VC.user = self.user
    }
    
    override func shouldPerformSegue(withIdentifier identifier: String, sender: Any?) -> Bool {
        if let name = nameField.text, name.count>=2{
            return true
        }
        let alertController = UIAlertController(title: "Wait a Minute!", message:"Please enter at least 2 characters for name", preferredStyle: .alert)
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
