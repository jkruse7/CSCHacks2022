//
//  QuestionsViewController.swift
//  test2
//
//  Created by Ruchi Hegde on 11/10/22.
//
//import DropDown
import UIKit
import SwiftUI
import PhotosUI
import FirebaseAuth
import FirebaseDatabase

class QuestionsViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    override func didReceiveMemoryWarning() {
            super.didReceiveMemoryWarning()
            // Dispose of any resources that can be recreated.
    }
    var count = 0
    let profile = RegisterViewController()
    @IBOutlet weak var temp: UITextField!
    @IBOutlet weak var deal: UITextField!
    @IBOutlet weak var party: UISlider!
    @IBOutlet weak var home: UISlider!
    @IBOutlet weak var habit: UITextField!
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return pickerData.count
    }
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String?{
        count = row
        return pickerData[row]
    }
    
    let scrollView = UIScrollView()
    let contentView = UIView()
    @IBOutlet weak var picker: UIPickerView!
    var pickerData: [String] = [String]()
    var refArtists: DatabaseReference!
//    var user: User?
    override func viewDidLoad() {
        super.viewDidLoad()
//        validateAuth()
        self.picker.delegate = self
        self.picker.dataSource = self
        pickerData = ["1", "2", "3", "4", "5", "6"]
        print("im here")
        refArtists = Database.database().reference()
        
    }

    
    private func validateAuth(){
        if FirebaseAuth.Auth.auth().currentUser == nil{
            print("not logged in")
            let vc = LoginViewController()
            let nav = UINavigationController(rootViewController: vc)
            nav.modalPresentationStyle = .fullScreen
            self.present(nav, animated: false)
        }
    }
        // Do any additional setup after loading the view.
    // MARK: - Navigation
    @IBOutlet weak var tapMeButton: UIButton!
    func configureTapMeButton(){
        tapMeButton.layer.borderColor = UIColor.lightGray.cgColor
        tapMeButton.layer.borderWidth = 2
        tapMeButton.layer.cornerRadius = 12
        tapMeButton.frame = (CGRect(x: 26, y: 125, width: 350, height: 40))

    }
    func configureTapMeButtonMenu() {
        let option1 = UIAction(title: "Freshman") { (action) in
            self.tapMeButton.setTitle("Freshman", for: .normal)
        }
        let option2 = UIAction(title: "Sophomore") { (action) in
            self.tapMeButton.setTitle("Sophomore", for: .normal)
        }
        let option3 = UIAction(title: "Junior") { (action) in
            self.tapMeButton.setTitle("Junior", for: .normal)
        }
        let option4 = UIAction(title: "Senior") { (action) in
            self.tapMeButton.setTitle("Senior", for: .normal)
        }
        let option5 = UIAction(title: "Graduate Student") { (action) in
            self.tapMeButton.setTitle("Graduate Student", for: .normal)
        }
        let menu = UIMenu(title: "Select your year", children: [option1, option2, option3, option4, option5])
        tapMeButton.menu = menu
    }
    
    @IBOutlet weak var FirstPref: UIButton!
    func configureFirstPrefButton(){
        FirstPref.layer.borderColor = UIColor.lightGray.cgColor
        FirstPref.layer.borderWidth = 2
        FirstPref.layer.cornerRadius = 12
        FirstPref.frame = (CGRect(x: 32, y: 253, width: 350, height: 40))

    }
    func configureFirstPreferenceButtonMenu() {
        let option1 = UIAction(title: "Amos Hall") { (action) in
            self.FirstPref.setTitle("Amos Hall", for: .normal)
        }
        let option2 = UIAction(title: "Bouquet Gardens") { (action) in
            self.FirstPref.setTitle("Bouquet Gardens", for: .normal)
        }
        let option3 = UIAction(title: "Brackenridge Hall") { (action) in
            self.FirstPref.setTitle("Brackenridge Hall", for: .normal)
        }
        let option4 = UIAction(title: "Bruce Hall") { (action) in
            self.FirstPref.setTitle("Bruce Hall", for: .normal)
        }
        let option5 = UIAction(title: "Centre Plaza Apartments") { (action) in
            self.FirstPref.setTitle("Centre Plaza Apartments", for: .normal)
        }
        let option6 = UIAction(title: "College Garden Apartments") { (action) in
            self.FirstPref.setTitle("College Garden Apartments", for: .normal)
        }
        let option7 = UIAction(title: "Darragh Street Apartments") { (action) in
            self.FirstPref.setTitle("Darragh Street Apartments", for: .normal)
        }
        let option8 = UIAction(title: "Forbes Hall") { (action) in
            self.FirstPref.setTitle("Forbes Hall", for: .normal)
        }
        let option9 = UIAction(title: "Forbes-Craig Hall") { (action) in
            self.FirstPref.setTitle("Forbes-Craig Hall", for: .normal)
        }
        let option10 = UIAction(title: "Frances Warde and Dougherty Halls") { (action) in
            self.FirstPref.setTitle("Frances Warde and Dougherty Halls", for: .normal)
        }
        let option11 = UIAction(title: "Fraternity Complex") { (action) in
            self.FirstPref.setTitle("Fraternity Complex", for: .normal)
        }
        let option12 = UIAction(title: "Holland Hall") { (action) in
            self.FirstPref.setTitle("Holland Hall", for: .normal)
        }
        let option13 = UIAction(title: "Hyacinth Place") { (action) in
            self.FirstPref.setTitle("Hyacinth Place", for: .normal)
        }
        let option14 = UIAction(title: "Irvis Hall") { (action) in
            self.FirstPref.setTitle("Irvis Hall", for: .normal)
        }
        let option15 = UIAction(title: "Litchfield Tower A") { (action) in
            self.FirstPref.setTitle("Litchfield Tower A", for: .normal)
        }
        let option16 = UIAction(title: "Litchfield Tower B") { (action) in
            self.FirstPref.setTitle("Litchfield Tower B", for: .normal)
        }
        let option17 = UIAction(title: "Litchfield Tower C") { (action) in
            self.FirstPref.setTitle("Litchfield Tower C", for: .normal)
        }
        let option18 = UIAction(title: "Lothrop Hall") { (action) in
            self.FirstPref.setTitle("Lothrop Hall", for: .normal)
        }
        let option19 = UIAction(title: "Mccormick Hall") { (action) in
            self.FirstPref.setTitle("Mccormick Hall", for: .normal)
        }
        let option20 = UIAction(title: "Nordenberg Hall") { (action) in
            self.FirstPref.setTitle("Nordenberg Hall", for: .normal)
        }
        let option21 = UIAction(title: "Oakwood Apartments") { (action) in
            self.FirstPref.setTitle("Oakwood Apartments", for: .normal)
        }
        let option22 = UIAction(title: "Panther Hall") { (action) in
            self.FirstPref.setTitle("Panther Hall", for: .normal)
        }
        let option23 = UIAction(title: "Residences on Bigelow") { (action) in
            self.FirstPref.setTitle("Residences on Bigelow", for: .normal)
        }
        let option24 = UIAction(title: "Ruskin Hall") { (action) in
            self.FirstPref.setTitle("Ruskin Hall", for: .normal)
        }
        let option25 = UIAction(title: "Sutherland Hall") { (action) in
            self.FirstPref.setTitle("Sutherland Hall", for: .normal)
        }
        let menu = UIMenu(title: "Select your first preference", children: [option1, option2, option3, option4, option5, option6, option7, option8, option9, option10, option11, option12, option13, option14, option15, option16, option17, option18, option19, option20, option21, option22, option23, option24, option25])
        FirstPref.menu = menu
    }
    
    @IBOutlet weak var SecondPref: UIButton!
    func configureSecondPrefButton(){
        SecondPref.layer.borderColor = UIColor.lightGray.cgColor
        SecondPref.layer.borderWidth = 2
        SecondPref.layer.cornerRadius = 12
        SecondPref.frame = (CGRect(x: 32, y: 331, width: 350, height: 40))

    }
    func configureSecondPreferenceButtonMenu() {
        let option1 = UIAction(title: "Amos Hall") { (action) in
            self.SecondPref.setTitle("Amos Hall", for: .normal)
        }
        let option2 = UIAction(title: "Bouquet Gardens") { (action) in
            self.SecondPref.setTitle("Bouquet Gardens", for: .normal)
        }
        let option3 = UIAction(title: "Brackenridge Hall") { (action) in
            self.SecondPref.setTitle("Brackenridge Hall", for: .normal)
        }
        let option4 = UIAction(title: "Bruce Hall") { (action) in
            self.SecondPref.setTitle("Bruce Hall", for: .normal)
        }
        let option5 = UIAction(title: "Centre Plaza Apartments") { (action) in
            self.SecondPref.setTitle("Centre Plaza Apartments", for: .normal)
        }
        let option6 = UIAction(title: "College Garden Apartments") { (action) in
            self.SecondPref.setTitle("College Garden Apartments", for: .normal)
        }
        let option7 = UIAction(title: "Darragh Street Apartments") { (action) in
            self.SecondPref.setTitle("Darragh Street Apartments", for: .normal)
        }
        let option8 = UIAction(title: "Forbes Hall") { (action) in
            self.SecondPref.setTitle("Forbes Hall", for: .normal)
        }
        let option9 = UIAction(title: "Forbes-Craig Hall") { (action) in
            self.SecondPref.setTitle("Forbes-Craig Hall", for: .normal)
        }
        let option10 = UIAction(title: "Frances Warde and Dougherty Halls") { (action) in
            self.SecondPref.setTitle("Frances Warde and Dougherty Halls", for: .normal)
        }
        let option11 = UIAction(title: "Fraternity Complex") { (action) in
            self.SecondPref.setTitle("Fraternity Complex", for: .normal)
        }
        let option12 = UIAction(title: "Holland Hall") { (action) in
            self.SecondPref.setTitle("Holland Hall", for: .normal)
        }
        let option13 = UIAction(title: "Hyacinth Place") { (action) in
            self.SecondPref.setTitle("Hyacinth Place", for: .normal)
        }
        let option14 = UIAction(title: "Irvis Hall") { (action) in
            self.SecondPref.setTitle("Irvis Hall", for: .normal)
        }
        let option15 = UIAction(title: "Litchfield Tower A") { (action) in
            self.SecondPref.setTitle("Litchfield Tower A", for: .normal)
        }
        let option16 = UIAction(title: "Litchfield Tower B") { (action) in
            self.SecondPref.setTitle("Litchfield Tower B", for: .normal)
        }
        let option17 = UIAction(title: "Litchfield Tower C") { (action) in
            self.SecondPref.setTitle("Litchfield Tower C", for: .normal)
        }
        let option18 = UIAction(title: "Lothrop Hall") { (action) in
            self.SecondPref.setTitle("Lothrop Hall", for: .normal)
        }
        let option19 = UIAction(title: "Mccormick Hall") { (action) in
            self.SecondPref.setTitle("Mccormick Hall", for: .normal)
        }
        let option20 = UIAction(title: "Nordenberg Hall") { (action) in
            self.SecondPref.setTitle("Nordenberg Hall", for: .normal)
        }
        let option21 = UIAction(title: "Oakwood Apartments") { (action) in
            self.SecondPref.setTitle("Oakwood Apartments", for: .normal)
        }
        let option22 = UIAction(title: "Panther Hall") { (action) in
            self.SecondPref.setTitle("Panther Hall", for: .normal)
        }
        let option23 = UIAction(title: "Residences on Bigelow") { (action) in
            self.SecondPref.setTitle("Residences on Bigelow", for: .normal)
        }
        let option24 = UIAction(title: "Ruskin Hall") { (action) in
            self.SecondPref.setTitle("Ruskin Hall", for: .normal)
        }
        let option25 = UIAction(title: "Sutherland Hall") { (action) in
            self.SecondPref.setTitle("Sutherland Hall", for: .normal)
        }
        let menu = UIMenu(title: "Select your second preference", children: [option1, option2, option3, option4, option5, option6, option7, option8, option9, option10, option11, option12, option13, option14, option15, option16, option17, option18, option19, option20, option21, option22, option23, option24, option25])
        SecondPref.menu = menu
    }
    @IBOutlet weak var gender: UIButton!
    func configureGenderButton(){
        gender.layer.borderColor = UIColor.lightGray.cgColor
        gender.layer.borderWidth = 2
        gender.layer.cornerRadius = 12
        gender.frame = (CGRect(x: 31, y: 561, width: 350, height: 40))
    }
    func configureGenderButtonMenu() {
        let option1 = UIAction(title: "Girl") { (action) in
            self.gender.setTitle("Girl", for: .normal)
        }
        let option2 = UIAction(title: "Boy") { (action) in
            self.gender.setTitle("Boy", for: .normal)
        }
        let option3 = UIAction(title: "No preference") { (action) in
            self.gender.setTitle("No preference", for: .normal)
        }
        let menu = UIMenu(title: "What is your gender preference?", children: [option1, option2, option3])
        gender.menu = menu
    }
    
    @IBOutlet weak var morning: UIButton!
    func configurePersonButton(){
        morning.layer.borderColor = UIColor.lightGray.cgColor
        morning.layer.borderWidth = 2
        morning.layer.cornerRadius = 12
        morning.frame = (CGRect(x: 31, y: 703, width: 350, height: 40))

    }
    func configurePersonButtonMenu() {
        let option1 = UIAction(title: "morning person") { (action) in
            self.morning.setTitle("morning person", for: .normal)
        }
        let option2 = UIAction(title: "night person") { (action) in
            self.morning.setTitle("night person", for: .normal)
        }
        let menu = UIMenu(title: "Are you a morning or night person?", children: [option1, option2])
        morning.menu = menu
    }
    
    
    @IBOutlet weak var drugs: UIButton!
    func configureDrugsButton(){
        drugs.layer.borderColor = UIColor.lightGray.cgColor
        drugs.layer.borderWidth = 2
        drugs.layer.cornerRadius = 12
        drugs.frame = (CGRect(x: 31, y: 772, width: 350, height: 40))
    }
    func configureDrugsButtonMenu() {
        let option1 = UIAction(title: "Yes") { (action) in
            self.drugs.setTitle("Yes", for: .normal)
        }
        let option2 = UIAction(title: "No") { (action) in
            self.drugs.setTitle("No", for: .normal)
        }
        let menu = UIMenu(title: "Do you have a drugs/alcohol preference?", children: [option1, option2])
        drugs.menu = menu
    }
    
    
    @IBOutlet weak var clean: UIButton!
    func configureCleanButton(){
        clean.layer.borderColor = UIColor.lightGray.cgColor
        clean.layer.borderWidth = 2
        clean.layer.cornerRadius = 12
        clean.frame = (CGRect(x: 29, y: 841, width: 350, height: 40))

    }
    func configureCleanButtonMenu() {
        let option1 = UIAction(title: "Clean") { (action) in
            self.clean.setTitle("Clean", for: .normal)
        }
        let option2 = UIAction(title: "Messy") { (action) in
            self.clean.setTitle("Messy", for: .normal)
        }
        let option3 = UIAction(title: "A bit in between") { (action) in
            self.clean.setTitle("A bit in between", for: .normal)
        }
        let menu = UIMenu(title: "Are you clean or messy?", children: [option1, option2, option3])
        clean.menu = menu
    }
    
    @IBOutlet weak var guest: UIButton!
    func configureGuestsButton(){
        guest.layer.borderColor = UIColor.lightGray.cgColor
        guest.layer.borderWidth = 2
        guest.layer.cornerRadius = 12
        guest.frame = (CGRect(x: 29, y: 907, width: 350, height: 40))

    }
    func configureGuestsButtonMenu() {
        let option1 = UIAction(title: "Yes") { (action) in
            self.guest.setTitle("Yes", for: .normal)
        }
        let option2 = UIAction(title: "No") { (action) in
            self.guest.setTitle("No", for: .normal)
        }
        let option3 = UIAction(title: "Need to get my approval first") { (action) in
            self.guest.setTitle("Need to get my approval first", for: .normal)
        }
        let menu = UIMenu(title: "How do you feel about overnight guests?", children: [option1, option2, option3])
        guest.menu = menu
    }
    
    override func viewWillAppear(_ animated: Bool) {
        configureTapMeButton()
        configureTapMeButtonMenu()
        configureFirstPrefButton()
        configureFirstPreferenceButtonMenu()
        configureSecondPrefButton()
        configureSecondPreferenceButtonMenu()
        configureGenderButton()
        configureGenderButtonMenu()
        configurePersonButton()
        configurePersonButtonMenu()
        configureDrugsButton()
        configureDrugsButtonMenu()
        configureCleanButton()
        configureCleanButtonMenu()
        configureGuestsButton()
        configureGuestsButtonMenu()
    }
    
    
    // Get a reference to the database service
    // In a storyboard-based application, you will often want to do a little preparation before navigation
    
    // do the code where u check if each input is not nil and then do it
    
    func updateProfile(year: String, firstPref: String, secondPref: String, Gender: String, morning: String, drink: String, clean: String, guests: String, room: String, p: String, house: String, t: String, worst: String, breaker: String){
        let user = [
            "first_name": profile.first,
            "last_name": profile.last,
            "First Preference": firstPref,
            "Second Preference": secondPref,
            "Gender": Gender,
            "Morning or Night": morning,
            "Drugs and Drinks": drink,
            "Clean or Messy": clean,
            "Overnight": guests,
            "Room": room,
            "party!": p,
            "house": house,
            "temp": t,
            "worst": worst,
            "dealbreakers": breaker,
            "year": year
        ] as [String : Any]
        let currentUser = Auth.auth().currentUser?.email
        let current = currentUser!.replacingOccurrences(of: ".", with: "-")
        let curr = current.replacingOccurrences(of: "@", with: "-")
        refArtists.child(curr).setValue(user)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let year =  tapMeButton.currentTitle
        let firstPref = FirstPref.currentTitle
        let secondPref = SecondPref.currentTitle
        let Gender = gender.currentTitle
        let day = morning.currentTitle
        let drink = drugs.currentTitle
        let cleaning = clean.currentTitle
        let overnight = guest.currentTitle
        let room = pickerData[count]
        let p = String(party.value).replacingOccurrences(of: ".", with: "-")
        let house = String(home.value).replacingOccurrences(of: ".", with: "-")
        let t = temp.text
        let worst = habit.text
        let breaker = deal.text

        updateProfile(year: year!, firstPref: firstPref!, secondPref: secondPref!, Gender: Gender!, morning: day!, drink: drink!, clean: cleaning!, guests: overnight!, room: room, p: p, house: house, t: t!, worst: worst!, breaker: breaker!)
        
    }

}
