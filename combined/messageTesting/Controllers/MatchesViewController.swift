//
//  MatchesViewController.swift
//  test2
//
//  Created by Julianne on 11/12/22.
//
import UIKit

class MatchesViewController: UIViewController {
    
    /*static var first : String = ""
    static var second: String = ""
    static var third: String = ""
    static var fourth: String = ""
    static var fifth: String = ""*/
    var profiles1 : [String] = ["Judy", "Freshman", "Panther Hall", "Centre Plaza Apartments", "2", "No", "Morning Person", "Clean Person", "Drinking/Smoking Not Okay", "No overnight guests", "1.0", "0.4", "60", "I am super selfish", "My roommate cannot be selfish."]
    var profiles2 : [String] = ["Stella", "Freshman", "Ruskin Hall", "Bouquet Gardens", "1", "Yes", "Morning Person", "Messy Person", "Drinking/Smoking Okay", "No overnight guests", "0.8", "0.2", "70", "I suck at cleaning", "My roommate cannot be mean."]
    var profiles3 : [String] = ["Julianne", "Freshman", "Litchfield Tower C", "Ruskin Hall", "5", "Yes", "Night Person", "Clean Person", "Drinking/Smoking Not Okay", "No overnight guests", "0.4", "0.7", "72", "I eat a lot", "My roommate cannot be in my face."]
    var profiles4 : [String] = ["Ruchi", "Freshman", "Bouquet Gardens", "Panther Hall", "4", "No", "Morning Person", "Messy Person", "Drinking/Smoking Not Okay", "No overnight guests", "0.2", "0.8", "68", "I suck at cooking", "My roommate cannot bring her partner over."]
    var profiles5 : [String] = ["Steve", "Freshman", "Irvis Hall", "Residences on Bigelow", "3", "No", "Night Person", "Messy Person", "Drinking/Smoking Okay", "No overnight guests", "0.8", "0.4", "58", "I snore", "My roommate cannot cry in front of me."]
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
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    @IBAction func MessageMatch(_ sender: Any) {
           
    }
    @IBAction func switchView(_ sender: UISegmentedControl) {
        switch sender.selectedSegmentIndex{
        case 0:
            photo.image = UIImage(named: "Image 3")
            Name.text = profiles1[0]
            Year.text = profiles1[1]
            FirstPref.text = profiles1[2]
            SecondPref.text = profiles1[3]
            numRoom.text = profiles1[4]
            Gender.text = profiles1[5]
            MornNight.text = profiles1[6]
            CleanMess.text = profiles1[7]
            DrinkSmoke.text = profiles1[8]
            Guests.text = profiles1[9]
            homeScale.progress = Float(profiles1[10])!
            PartyScale.progress = Float(profiles1[11])!
            Temp.text = profiles1[12]
            badHabit.text = profiles1[13]
            dealBreaker.text = profiles1[14]
            break;
        case 1:
            photo.image = UIImage(named: "Image 1")
            Name.text = profiles2[0]
            Year.text = profiles2[1]
            FirstPref.text = profiles2[2]
            SecondPref.text = profiles2[3]
            numRoom.text = profiles2[4]
            Gender.text = profiles2[5]
            MornNight.text = profiles2[6]
            CleanMess.text = profiles2[7]
            DrinkSmoke.text = profiles2[8]
            Guests.text = profiles2[9]
            homeScale.progress = Float(profiles2[10])!
            PartyScale.progress = Float(profiles2[11])!
            Temp.text = profiles2[12]
            badHabit.text = profiles2[13]
            dealBreaker.text = profiles2[14]
            break;
        case 2:
            photo.image = UIImage(named: "Image")
            Name.text = profiles3[0]
            Year.text = profiles3[1]
            FirstPref.text = profiles3[2]
            SecondPref.text = profiles3[3]
            numRoom.text = profiles3[4]
            Gender.text = profiles3[5]
            MornNight.text = profiles3[6]
            CleanMess.text = profiles3[7]
            DrinkSmoke.text = profiles3[8]
            Guests.text = profiles3[9]
            homeScale.progress = Float(profiles3[10])!
            PartyScale.progress = Float(profiles3[11])!
            Temp.text = profiles3[12]
            badHabit.text = profiles3[13]
            dealBreaker.text = profiles3[14]
            break;
        case 3:
            photo.image = UIImage(named: "Image 2")
            Name.text = profiles4[0]
            Year.text = profiles4[1]
            FirstPref.text = profiles4[2]
            SecondPref.text = profiles4[3]
            numRoom.text = profiles4[4]
            Gender.text = profiles4[5]
            MornNight.text = profiles4[6]
            CleanMess.text = profiles4[7]
            DrinkSmoke.text = profiles4[8]
            Guests.text = profiles4[9]
            homeScale.progress = Float(profiles4[10])!
            PartyScale.progress = Float(profiles4[11])!
            Temp.text = profiles4[12]
            badHabit.text = profiles4[13]
            dealBreaker.text = profiles4[14]
            break;
        case 4:
            photo.image = UIImage(named: "boy")
            Name.text = profiles5[0]
            Year.text = profiles5[1]
            FirstPref.text = profiles5[2]
            SecondPref.text = profiles5[3]
            numRoom.text = profiles5[4]
            Gender.text = profiles5[5]
            MornNight.text = profiles5[6]
            CleanMess.text = profiles5[7]
            DrinkSmoke.text = profiles5[8]
            Guests.text = profiles5[9]
            homeScale.progress = Float(profiles5[10])!
            PartyScale.progress = Float(profiles5[11])!
            Temp.text = profiles5[12]
            badHabit.text = profiles5[13]
            dealBreaker.text = profiles5[14]
            break;
        default:
            print("no change")
        }
    }
    /*
     override func viewDidAppear(_ animated: Bool) {
     self.modalPresentationStyle = .fullScreen
     }
     
     override func viewDidLoad() {
     super.viewDidLoad()
     //        var num = 0
     /*
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
      var intIndex = 0
      case 0:
      let index = topFive.index(topFive.startIndex, offsetBy: intIndex)
      var topUserEmail = topFive.keys[index] //doubt this works
      var topUser: [String:String]
      DatabaseManager.shared.database.child(topUserEmail).observe(.value, with: { (snapshot) in
      
      topUser = (snapshot.value as! [String:String])
      
      })
      Name.text = (topUser["first_name"] +" " +  topUser["last_name"])
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
      intIndex += 1
      let index = topFive.index(topFive.startIndex, offsetBy: intIndex)
      var topUserEmail = topFive.keys[index]
      //var topUserEmail = topFive[1].key //doubt this works
      var topUser: [String:String]
      DatabaseManager.shared.database.child(topUserEmail).observe(.value, with: { (snapshot) in
      
      topUser = (snapshot.value as! [String:String])
      
      })
      Name.text = (topUser["first_name"] +" " +  topUser["last_name"])
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
      intIndex += 1
      let index = topFive.index(topFive.startIndex, offsetBy: intIndex)
      var topUserEmail = topFive.keys[index]
      //var topUserEmail = topFive[2].key //doubt this works
      var topUser: [String:String]
      DatabaseManager.shared.database.child(topUserEmail).observe(.value, with: { (snapshot) in
      
      topUser = (snapshot.value as! [String:String])
      
      })
      Name.text = (topUser["first_name"] +" " +  topUser["last_name"])
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
      intIndex += 1
      let index = topFive.index(topFive.startIndex, offsetBy: intIndex)
      var topUserEmail = topFive.keys[index]
      //var topUserEmail = topFive[3].key //doubt this works
      var topUser: [String:String]
      DatabaseManager.shared.database.child(topUserEmail).observe(.value, with: { (snapshot) in
      
      topUser = (snapshot.value as! [String:String])
      
      })
      Name.text = (topUser["first_name"] +" " +  topUser["last_name"])
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
      intIndex += 1
      let index = topFive.index(topFive.startIndex, offsetBy: intIndex)
      var topUserEmail = topFive.keys[index]
      //var topUserEmail = topFive[4].key //doubt this works
      var topUser: [String:String]
      DatabaseManager.shared.database.child(topUserEmail).observe(.value, with: { (snapshot) in
      
      topUser = (snapshot.value as! [String:String])
      
      })
      Name.text = (topUser["first_name"] +" " +  topUser["last_name"])
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
      
      */
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
     
     var array : [[String:String]] = [["":""]]
     DatabaseManager.shared.database.child("users").observe(.value, with: { (snapshot) in
     print("PRINT")
     guard let array = (snapshot.value as? [[String:String]]) else { return}
     print(array)
     print(array.count)
     
     for user in array
     {
     print("going in ")
     var allMatches : [String:Int] = ["":0]
     guard let thisEmail = (user["email"]) else { return }
     //                let pos = thisEmail.firstIndex(of: "(")?
     print(thisEmail)
     
     
     var currUser : [String:String] = ["":""]
     var compareUser : [String:String] = ["":""]
     DatabaseManager.shared.database.child(thisEmail).observe(.value, with: { (snapshot) in
     
     compareUser = (snapshot.value as! [String:String])
     
     })
     
     var currUserEmail = UserDefaults.standard.value(forKey: "email") as! String
     DatabaseManager.shared.database.child(currUserEmail).observe(.value, with: { (snapshot) in
     
     currUser = (snapshot.value as! [String:String])
     
     })
     for (key, value) in currUser{
     if(key=="temp"){
     if (Int(currUser[key]!)! - Int(compareUser[key]!)! < 5 || Int(currUser[key]!)! - Int(compareUser["temp"]!)! > -5){
     allMatches[thisEmail]! += 10}
     if(key == "year"){
     if(currUser[key] == compareUser[key]){
     allMatches[thisEmail]! += 6
     }
     }
     if(key == "First Preference"){
     if(currUser[key] == compareUser[key]){
     allMatches[thisEmail]! += 20
     }
     }
     if(key == "Second Preference"){
     if(currUser[key] == compareUser[key]){
     allMatches[thisEmail]! += 10
     }
     }
     if(key == "Gender"){
     if(currUser[key] == compareUser[key]){
     allMatches[thisEmail]! += 12
     }
     }
     if(key == "Overnight"){
     if(currUser[key] == compareUser[key]){
     allMatches[thisEmail]! += 10
     }
     }
     if(key == "Drugs and Drinks"){
     if(currUser[key] == compareUser[key]){
     allMatches[thisEmail]! += 6
     }
     }
     if(key == "Clean or Messy"){
     if(currUser[key] == compareUser[key]){
     allMatches[thisEmail]! += 10
     }
     }
     if(key == "party!"){
     let partycurr = currUser[key]!.replacingOccurrences(of: "-", with: ".")
     let partycompare = compareUser[key]!.replacingOccurrences(of: "-", with: ".")
     if(((Float(partycurr))! - Float(partycompare)! < 0.1) || ((Float(partycurr))! - Float(partycompare)! <  -0.1)){
     allMatches[thisEmail]! += 6
     }
     }
     if(key == "Room"){
     if(currUser[key] == compareUser[key]){
     allMatches[thisEmail]! += 10
     }
     }
     }
     }  // End of for (key, value) loop
     var sortedMatches = allMatches.sorted(by:>)
     MatchesViewController.first = Array(sortedMatches)[0].key
     MatchesViewController.second = Array(sortedMatches)[1].key
     MatchesViewController.third = Array(sortedMatches)[2].key
     MatchesViewController.fourth = Array(sortedMatches)[3].key
     MatchesViewController.fifth = Array(sortedMatches)[4].key
     
     
     }})
     
     
     
     print("END PRINT")
     
     }
     
     
     
     
     
     
     // Do any additional setup after loading the view.
     
     
     
     func MessageMatch(_ sender: Any) {
     
     }
     @IBAction func chnageProfile(_ sender: Any) {
     switch (sender as AnyObject).selectedSegmentIndex{
     case 0:
     var topUserEmail = MatchesViewController.first //doubt this works
     var topUser: [String:String] = ["":""]
     DatabaseManager.shared.database.child(topUserEmail).observe(.value, with: { (snapshot) in
     
     topUser = (snapshot.value as! [String:String])
     
     })
     let firstname = topUser["first_name"]!
     let lastname = topUser["last_name"]
     Name.text = ("\(firstname) \(String(describing: lastname))")
     Year.text = topUser["Year"]
     FirstPref.text = topUser["First Preference"]
     SecondPref.text = topUser["Second Preference"]
     numRoom.text = topUser["Room"]
     Gender.text = topUser["Gender"]
     MornNight.text = topUser["Morning or Night"]
     CleanMess.text = topUser["Clean or Messy"]
     DrinkSmoke.text = topUser["Drugs and Drinks"]
     Guests.text = topUser["Overnight"]
     let home = topUser["home"]!.replacingOccurrences(of: "-", with: ".")
     homeScale.progress = Float(home)!
     let party = topUser["party!"]!.replacingOccurrences(of: "-", with: ".")
     PartyScale.progress = Float(party)!
     Temp.text = topUser["temp"]
     badHabit.text = topUser["worst"]
     dealBreaker.text = topUser["dealbreaker"]
     break;
     
     case 1:
     var topUserEmail = MatchesViewController.second
     //var topUserEmail = topFive[1].key //doubt this works
     var topUser: [String:String] = ["":""]
     DatabaseManager.shared.database.child(topUserEmail).observe(.value, with: { (snapshot) in
     
     topUser = (snapshot.value as! [String:String])
     
     })
     let firstname = topUser["first_name"]!
     let lastname = topUser["last_name"]
     Name.text = ("\(firstname) \(String(describing: lastname))")
     Year.text = topUser["Year"]
     FirstPref.text = topUser["First Preference"]
     SecondPref.text = topUser["Second Preference"]
     numRoom.text = topUser["Room"]
     Gender.text = topUser["Gender"]
     MornNight.text = topUser["Morning or Night"]
     CleanMess.text = topUser["Clean or Messy"]
     DrinkSmoke.text = topUser["Drugs and Drinks"]
     Guests.text = topUser["Overnight"]
     let home = topUser["home"]!.replacingOccurrences(of: "-", with: ".")
     homeScale.progress = Float(home)!
     let party = topUser["party!"]!.replacingOccurrences(of: "-", with: ".")
     PartyScale.progress = Float(party)!
     Temp.text = topUser["temp"]
     badHabit.text = topUser["worst"]
     dealBreaker.text = topUser["dealbreaker"]
     break;
     case 2:
     var topUserEmail = MatchesViewController.third
     //var topUserEmail = topFive[2].key //doubt this works
     var topUser: [String:String] = ["":""]
     DatabaseManager.shared.database.child(topUserEmail).observe(.value, with: { (snapshot) in
     
     topUser = (snapshot.value as! [String:String])
     
     })
     let firstname = topUser["first_name"]!
     let lastname = topUser["last_name"]
     Name.text = ("\(firstname) \(String(describing: lastname))")
     Year.text = topUser["Year"]
     FirstPref.text = topUser["First Preference"]
     SecondPref.text = topUser["Second Preference"]
     numRoom.text = topUser["Room"]
     Gender.text = topUser["Gender"]
     MornNight.text = topUser["Morning or Night"]
     CleanMess.text = topUser["Clean or Messy"]
     DrinkSmoke.text = topUser["Drugs and Drinks"]
     Guests.text = topUser["Overnight"]
     let home = topUser["home"]!.replacingOccurrences(of: "-", with: ".")
     homeScale.progress = Float(home)!
     let party = topUser["party!"]!.replacingOccurrences(of: "-", with: ".")
     PartyScale.progress = Float(party)!
     Temp.text = topUser["temp"]
     badHabit.text = topUser["worst"]
     dealBreaker.text = topUser["dealbreaker"]
     break;
     case 3:
     var topUserEmail = MatchesViewController.fourth
     //var topUserEmail = topFive[3].key //doubt this works
     var topUser: [String:String] = ["":""]
     DatabaseManager.shared.database.child(topUserEmail).observe(.value, with: { (snapshot) in
     
     topUser = (snapshot.value as! [String:String])
     
     })
     let firstname = topUser["first_name"]!
     let lastname = topUser["last_name"]
     Name.text = ("\(firstname) \(String(describing: lastname))")
     Year.text = topUser["Year"]
     FirstPref.text = topUser["First Preference"]
     SecondPref.text = topUser["Second Preference"]
     numRoom.text = topUser["Room"]
     Gender.text = topUser["Gender"]
     MornNight.text = topUser["Morning or Night"]
     CleanMess.text = topUser["Clean or Messy"]
     DrinkSmoke.text = topUser["Drugs and Drinks"]
     Guests.text = topUser["Overnight"]
     let home = topUser["home"]!.replacingOccurrences(of: "-", with: ".")
     homeScale.progress = Float(home)!
     let party = topUser["party!"]!.replacingOccurrences(of: "-", with: ".")
     PartyScale.progress = Float(party)!
     Temp.text = topUser["temp"]
     badHabit.text = topUser["worst"]
     dealBreaker.text = topUser["dealbreaker"]
     break;
     case 4:
     var topUserEmail = MatchesViewController.fifth
     //var topUserEmail = topFive[4].key //doubt this works
     var topUser: [String:String] = ["":""]
     DatabaseManager.shared.database.child(topUserEmail).observe(.value, with: { (snapshot) in
     
     topUser = (snapshot.value as! [String:String])
     
     })
     let firstname = topUser["first_name"]!
     let lastname = topUser["last_name"]
     Name.text = ("\(firstname) \(String(describing: lastname))")
     Year.text = topUser["Year"]
     FirstPref.text = topUser["First Preference"]
     SecondPref.text = topUser["Second Preference"]
     numRoom.text = topUser["Room"]
     Gender.text = topUser["Gender"]
     MornNight.text = topUser["Morning or Night"]
     CleanMess.text = topUser["Clean or Messy"]
     DrinkSmoke.text = topUser["Drugs and Drinks"]
     Guests.text = topUser["Overnight"]
     let home = topUser["home"]!.replacingOccurrences(of: "-", with: ".")
     homeScale.progress = Float(home)!
     let party = topUser["party!"]!.replacingOccurrences(of: "-", with: ".")
     PartyScale.progress = Float(party)!
     Temp.text = topUser["temp"]
     badHabit.text = topUser["worst"]
     dealBreaker.text = topUser["dealbreaker"]
     break;
     default:
     print("No change")
     
     }
     }
     
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
