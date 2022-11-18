//
//  TinderView.swift
//  test2
//
//  Created by Julianne on 11/12/22.
//

import SwiftUI
import UIKit
struct TinderView: View {
    private var people: [String] = ["Mario", "Luigi", "Peach"]
    
    //Above will need to be changed with a list of each profile/profile id to display
    var body: some View {
        
        VStack{
            ZStack{
                //storyBoardView().edgesIgnoringSafeArea(.all)
                ForEach(allMatches, id: \.self){person in CardView(person:person) //goes through each string in list -- don't change
                }
                }
                    
                }
            }
        }

struct TinderView_Previews: PreviewProvider {
    static var previews: some View {
        TinderView()
    }
}
/*struct storyBoardView: UIViewControllerRepresentable{
    func makeUIViewController(context: Context) -> UIViewController {
        let storyBoard = UIStoryboard(name: "Main", bundle: Bundle.main)
        let controller = storyBoard.instantiateViewController(identifier: "matches")
        return controller
    }
    func updateUIViewController(_ uiViewController: UIViewController, context: Context) {
        
    }
}*/
struct CardView: View {
    
    var person: String
    @State private var offset = CGSize.zero
    @State private var color: Color = .white
    
    var body: some View {
        ZStack{
            Rectangle()
                .frame(width:350, height: 600)
                .border(.white, width: 6.0)
                .cornerRadius(4)
                .foregroundColor(color.opacity(0.9))
                .shadow(radius: 4)
            HStack{
                ScrollView {
                    var currUser: [String:String]
                    let currUserEmail = person.key // probably not work?
                    DatabaseManager.shared.database.child(currUserEmail).observe(.value, with: { (snapshot) in
                        
                        currUser = (snapshot.value as! [String:String])
                        
                    })
                    //person is user id/whatever we use to access user. will need to be like get user with that id's name
                    //insert image??
                    
                    Text("Year: " + currUser["Year"])
                    Text("First Preference: " + currUser["First Preference"])
                    Text("Second Preference: " + currUser["Second Preference"])
                    Text("Number of Roommates: " + currUser["Room"])
                    Text("Preferred roommmate gender: " + currUser["Gender"])
                    Text("Personality")
                        .font(.largeTitle)
                        .fontWeight(.bold)
                    Text(currUser["Morning or Night"])
                    Text(currUser["Clean or Messy"])
                    Text("Can my roommate drink or smoke? " + currUser["Drugs and Drinks"])
                    Text("Overnight Guests? " + currUser["Overnight"])
                    Text("How often they are home:")
                    let home = currUser["home"].replacingOccurrences(of: "-", with: ".")
                    //insert a progress scale here
                    ProgressView("", value: Float(home), total: 1)
                    let party = currUser["party!"].replacingOccurrences(of: "-", with: ".")
                    Text("How often they party:")
                    //insert a progress scale here
                    ProgressView("", value: Float(party), total: 1)
                    Text("Preferred room temperature" + person.temp)
                    Text("Worst Habit: " + currUser["worst"])
                    Text("Deal Breaker: " + currUser["dealbreaker"])
                    }
                .offset(y: 45)
                .frame(width: 345)
                .foregroundColor(.black)
                .font(.title)
                .multilineTextAlignment(.leading)
                }
            }
        .offset(x: offset.width, y: offset.height)
        .rotationEffect(.degrees(Double(offset.width/40)))
        .gesture(DragGesture().onChanged{gesture in
            offset = gesture.translation
            withAnimation{
            changeColor(width: offset.width)
        }}.onEnded{_ in withAnimation{
            swipeCard(width: offset.width)
            changeColor(width: offset.width)
        }})
    }
    func swipeCard(width: CGFloat){
        switch width{
        case -500...(-150):
            print("\(person) removed")
            offset = CGSize(width: -500, height: 0)
        case 150...500:
            print("\(person) added")
            offset = CGSize(width: 500, height: 0)
        default:
            offset = .zero
        }
    }
    func changeColor(width: CGFloat){
        switch width{
        case -500...(-130):
            color = .red
        case 130...500:
            color = .green
        default:
            color = .white
        }
        
    }
}
