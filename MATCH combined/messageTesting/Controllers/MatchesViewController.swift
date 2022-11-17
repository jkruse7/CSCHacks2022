//
//  MatchesViewController.swift
//  test2
//
//  Created by Julianne on 11/12/22.
//

import UIKit

class MatchesViewController: UIViewController {

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
    
    override func viewDidLoad() {
        super.viewDidLoad()
//        var num = 0
        var array : [[String:AnyObject]]
        DatabaseManager.shared.database.child("users").observe(.value, with: { (snapshot) in
            print("PRINT")
            guard let array = (snapshot.value as? [[String:AnyObject]]) else { return}
            print(array)
            print(array.count)})
        
            for (user) in array
            {
                guard let thisEmail = (user["email"] as? String) else { return }
//                let pos = thisEmail.firstIndex(of: "(")?
                print(thisEmail)
                
                
                var currUser : [String:AnyObject]
                var compareUser : [String:AnyObject]
                DatabaseManager.shared.database.child(thisEmail).observe(.value, with: { (snapshot) in

                  compareUser = (snapshot.value as! [String:AnyObject])

                        })
                
                var currUserEmail = UserDefaults.standard.value(forKey: "email") as! String
                DatabaseManager.shared.database.child(currUserEmail).observe(.value, with: { (snapshot) in

                            currUser = (snapshot.value as! [String:AnyObject])

                        })
                var allMatches: [String: Int]
                for (key,value) in currUser{
                if(key=="temp"){
                     if (Int(currUser[key]) - Int(compareUser["temp"]) < 5 || Int(currUser[key]) - Int(compareUser["temp"]) > -5){
                         allMatches[thisEmail]! += 10}
                 if(key == "year"){
                     if(currUser[key]) === compareUser["year"]){
                         allMatches[thisEmail]! += 6
                 }
            }
                    if(key == "firstPref"){
                        if(currUser[key] === compareUser[key]){
                            allMatches[thisEmail]! += 20
                        }
                    }
                    if(key == "secondPref"){
                        if(currUser[key] === compareUser[key]){
                            allMatches[thisEmail]! += 10
                        }
                    }
                    if(key == "gender"){
                        if(currUser[key] === compareUser[key]){
                            allMatches[thisEmail]! += 12
                        }
                    }
                    if(key == "guests"){
                        if(currUser[key] === compareUser[key]){
                            allMatches[thisEmail]! += 10
                        }
                    }
                    if(key == "drink"){
                        if(currUser[key] === compareUser[key]){
                            allMatches[thisEmail]! += 6
                        }
                    }
                    if(key == "clean"){
                        if(currUser[key] === compareUser[key]){
                            allMatches[thisEmail]! += 10
                        }
                    }
                    if(key == "party"){
                        if((Float(currUser[key]) - Float(compareUser[key]).abs() < 0.1)){
                            allMatches[thisEmail]! += 6
                        }
                    }
                    if(key == "room"){
                        if(currUser[key] === compareUser[key]){
                            allMatches[thisEmail]! += 10
                        }
                    }
                }
                }
            }
            
            
            
            print("END PRINT")
        }
        
     

        // Do any additional setup after loading the view.
    }

    
    @IBAction func MessageMatch(_ sender: Any) {
        
    }
    @IBAction func switchView(_ sender: UISegmentedControl) {
        switch sender.selectedSegmentIndex{
        case 1:
            Name.text = profiles[0]
            Year.text = profiles[1]
            FirstPref.text = profiles[2]
            SecondPref.text = profiles[3]
            numRoom.text = profiles[4]
            Gender.text = profiles[5]
            MornNight.text = profiles[6]
            CleanMess.text = profiles[7]
            DrinkSmoke.text = profiles[8]
            Guests.text = profiles[9]
            homeScale.progress = Float(profiles[10])!
            PartyScale.progress = Float(profiles[11])!
            Temp.text = profiles[12]
            badHabit.text = profiles[13]
            dealBreaker.text = profiles[14]
            break;
        default:
            print("No change")
            
        }
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
