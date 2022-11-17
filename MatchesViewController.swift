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
        var array : [[String:String]]
        DatabaseManager.shared.database.child("users").observe(.value, with: { (snapshot) in
            print("PRINT")
            guard let array = (snapshot.value as? [[String:String]]) else { return}
            print(array)
            print(array.count)})
        
        for (user) in array
        {
            guard let thisEmail = (user["email"] as? String) else { return }
            //                let pos = thisEmail.firstIndex(of: "(")?
            print(thisEmail)
            
            
            var currUser : [String:String]
            var compareUser : [String:String]
            DatabaseManager.shared.database.child(thisEmail).observe(.value, with: { (snapshot) in
                
                compareUser = (snapshot.value as! [String:String])
                
            })
            
            var currUserEmail = UserDefaults.standard.value(forKey: "email") as! String
            DatabaseManager.shared.database.child(currUserEmail).observe(.value, with: { (snapshot) in
                
                currUser = (snapshot.value as! [String:String])
                
            })
            var allMatches: [String: Int]
            for (key,value) in currUser{
                if(key=="temp"){
                    if (Int(currUser[key]) - Int(compareUser[key]) < 5 || Int(currUser[key]) - Int(compareUser["temp"]) > -5){
                        allMatches[thisEmail]! += 10}
                    if(key == "year"){
                        if(currUser[key]) === compareUser[key]){
                            allMatches[thisEmail]! += 6
                        }
                    }
                    if(key == "First Preference"){
                        if(currUser[key] === compareUser[key]){
                            allMatches[thisEmail]! += 20
                        }
                    }
                    if(key == "Second Preference"){
                        if(currUser[key] === compareUser[key]){
                            allMatches[thisEmail]! += 10
                        }
                    }
                    if(key == "Gender"){
                        if(currUser[key] === compareUser[key]){
                            allMatches[thisEmail]! += 12
                        }
                    }
                    if(key == "Overnight"){
                        if(currUser[key] === compareUser[key]){
                            allMatches[thisEmail]! += 10
                        }
                    }
                    if(key == "Drugs and Drinks"){
                        if(currUser[key] === compareUser[key]){
                            allMatches[thisEmail]! += 6
                        }
                    }
                    if(key == "Clean or Messy"){
                        if(currUser[key] === compareUser[key]){
                            allMatches[thisEmail]! += 10
                        }
                    }
                    if(key == "party!"){
                        currUser[key].replacingOccurrences(of: "-", with: ".")
                        compareUser[key].replacingOccurences(of: "-", with: ".")
                        if((Float(currUser[key]) - Float(compareUser[key]).abs() < 0.1)){
                            allMatches[thisEmail]! += 6
                        }
                    }
                    if(key == "Room"){
                        if(currUser[key] === compareUser[key]){
                            allMatches[thisEmail]! += 10
                        }
                    }
                }
            }   // End of for (key, value) loop
        }
        
        
        
        print("END PRINT")
    }
    allMatches = allMatches.sorted(by:>)
    var topFive: [String:Int] = allMatches[0:5]
    
    
    
    
    // Do any additional setup after loading the view.
}


@IBAction func MessageMatch(_ sender: Any) {
    
}
@IBAction func switchView(_ sender: UISegmentedControl) {
    switch sender.selectedSegmentIndex{
    case 0:
        var topUserEmail = topFive[0].key //doubt this works
        var topUser: [String:String]
        DatabaseManager.shared.database.child(topUserEmail).observe(.value, with: { (snapshot) in
            
            topUser = (snapshot.value as! [String:String])
            
        })
        Name.text = topUser["first_name"]
        Year.text = topUser["Year"]
        FirstPref.text = topUser["First Preference"]
        SecondPref.text = topUser["Second Preference"]
        numRoom.text = topUser["Room"]
        Gender.text = topUser["Gender"]
        MornNight.text = topUser["Morning or Night"]
        CleanMess.text = topUser["Clean or Messy"]
        DrinkSmoke.text = topUser["Drugs and Drinks"]
        Guests.text = topUser["Overnight"]
        let home = topUser["home"].replacingOccurrences(of: "-", with: ".")
        homeScale.progress = Float(home)!
        let party = topUser["party!"].replacingOccurrences(of: "-", with: ".")
        PartyScale.progress = Float(party)!
        Temp.text = topUser["temp"]
        badHabit.text = topUser["worst"]
        dealBreaker.text = topUser["dealbreaker"]
        break;
        
    case 1:
        var topUserEmail = topFive[1].key //doubt this works
        var topUser: [String:String]
        DatabaseManager.shared.database.child(topUserEmail).observe(.value, with: { (snapshot) in
            
            topUser = (snapshot.value as! [String:String])
            
        })
        Name.text = topUser["first_name"]
        Year.text = topUser["Year"]
        FirstPref.text = topUser["First Preference"]
        SecondPref.text = topUser["Second Preference"]
        numRoom.text = topUser["Room"]
        Gender.text = topUser["Gender"]
        MornNight.text = topUser["Morning or Night"]
        CleanMess.text = topUser["Clean or Messy"]
        DrinkSmoke.text = topUser["Drugs and Drinks"]
        Guests.text = topUser["Overnight"]
        let home = topUser["home"].replacingOccurrences(of: "-", with: ".")
        homeScale.progress = Float(home)!
        let party = topUser["party!"].replacingOccurrences(of: "-", with: ".")
        PartyScale.progress = Float(party)!
        Temp.text = topUser["temp"]
        badHabit.text = topUser["worst"]
        dealBreaker.text = topUser["dealbreaker"]
        break;
    case 2:
        var topUserEmail = topFive[2].key //doubt this works
        var topUser: [String:String]
        DatabaseManager.shared.database.child(topUserEmail).observe(.value, with: { (snapshot) in
            
            topUser = (snapshot.value as! [String:String])
            
        })
        Name.text = topUser["first_name"]
        Year.text = topUser["Year"]
        FirstPref.text = topUser["First Preference"]
        SecondPref.text = topUser["Second Preference"]
        numRoom.text = topUser["Room"]
        Gender.text = topUser["Gender"]
        MornNight.text = topUser["Morning or Night"]
        CleanMess.text = topUser["Clean or Messy"]
        DrinkSmoke.text = topUser["Drugs and Drinks"]
        Guests.text = topUser["Overnight"]
        let home = topUser["home"].replacingOccurrences(of: "-", with: ".")
        homeScale.progress = Float(home)!
        let party = topUser["party!"].replacingOccurrences(of: "-", with: ".")
        PartyScale.progress = Float(party)!
        Temp.text = topUser["temp"]
        badHabit.text = topUser["worst"]
        dealBreaker.text = topUser["dealbreaker"]
        break;
    case 3:
        var topUserEmail = topFive[3].key //doubt this works
        var topUser: [String:String]
        DatabaseManager.shared.database.child(topUserEmail).observe(.value, with: { (snapshot) in
            
            topUser = (snapshot.value as! [String:String])
            
        })
        Name.text = topUser["first_name"]
        Year.text = topUser["Year"]
        FirstPref.text = topUser["First Preference"]
        SecondPref.text = topUser["Second Preference"]
        numRoom.text = topUser["Room"]
        Gender.text = topUser["Gender"]
        MornNight.text = topUser["Morning or Night"]
        CleanMess.text = topUser["Clean or Messy"]
        DrinkSmoke.text = topUser["Drugs and Drinks"]
        Guests.text = topUser["Overnight"]
        let home = topUser["home"].replacingOccurrences(of: "-", with: ".")
        homeScale.progress = Float(home)!
        let party = topUser["party!"].replacingOccurrences(of: "-", with: ".")
        PartyScale.progress = Float(party)!
        Temp.text = topUser["temp"]
        badHabit.text = topUser["worst"]
        dealBreaker.text = topUser["dealbreaker"]
        break;
    case 4:
        var topUserEmail = topFive[4].key //doubt this works
        var topUser: [String:String]
        DatabaseManager.shared.database.child(topUserEmail).observe(.value, with: { (snapshot) in
            
            topUser = (snapshot.value as! [String:String])
            
        })
        Name.text = topUser["first_name"]
        Year.text = topUser["Year"]
        FirstPref.text = topUser["First Preference"]
        SecondPref.text = topUser["Second Preference"]
        numRoom.text = topUser["Room"]
        Gender.text = topUser["Gender"]
        MornNight.text = topUser["Morning or Night"]
        CleanMess.text = topUser["Clean or Messy"]
        DrinkSmoke.text = topUser["Drugs and Drinks"]
        Guests.text = topUser["Overnight"]
        let home = topUser["home"].replacingOccurrences(of: "-", with: ".")
        homeScale.progress = Float(home)!
        let party = topUser["party!"].replacingOccurrences(of: "-", with: ".")
        PartyScale.progress = Float(party)!
        Temp.text = topUser["temp"]
        badHabit.text = topUser["worst"]
        dealBreaker.text = topUser["dealbreaker"]
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
