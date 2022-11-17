//
//  MyProfileViewController.swift
//  messageTesting
//
//  Created by Ruchi Hegde on 11/16/22.
//

import UIKit

class MyProfileViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
        var profiles : [String] = ["Judy", "Freshman", "Benedum", "Thaw", "2", "No", "Morning Person", "Clean Person", "Drinking/Smoking Okay", "No ovenright guests", "0.8", "0.5", "26", "I snore", "My roommate cannot cry inf ront of me."]
        
        @IBOutlet weak var Name: UILabel!
        @IBOutlet weak var Year: UILabel!
        @IBOutlet weak var FirstPref: UILabel!
        @IBOutlet weak var SecondPref: UILabel!
        @IBOutlet weak var numRoom: UILabel!
        @IBOutlet weak var Gender: UILabel!
        @IBOutlet weak var MornNight: UILabel!
        @IBOutlet weak var CleanMess: UILabel!
        @IBOutlet weak var DrinkSmoke: UILabel!
        @IBOutlet weak var Guests: UILabel!
        @IBOutlet weak var PartyScale: UIProgressView!
        @IBOutlet weak var homeScale: UIProgressView!
        @IBOutlet weak var Temp: UILabel!
        @IBOutlet weak var badHabit: UILabel!
        @IBOutlet weak var dealBreaker: UILabel!
        @IBOutlet weak var SegmentControl: UISegmentedControl!
        @IBOutlet weak var photo: UIImageView!
        
        override func viewDidAppear(_ animated: Bool) {
            self.modalPresentationStyle = .fullScreen
        }
        
    private func profileSetUp(){
        
    }
        
        
        /*
        // MARK: - Navigation

        // In a storyboard-based application, you will often want to do a little preparation before navigation
        override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
            // Get the new view controller using segue.destination.
            // Pass the selected object to the new view controller.
        }
        */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
