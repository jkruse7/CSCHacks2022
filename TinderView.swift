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
                ForEach(people, id: \.self){person in CardView(person:person) //goes through each string in list -- don't change
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
                    Text(person)
                    //person is user id/whatever we use to access user. will need to be like get user with that id's name
                    //insert image??
                    
                    Text("Year: " + "Freshman")
                    Text("First Preference: " + "Building")
                    Text("Second Preference: " + "Build")
                    Text("Number of Roommates: " + "2")
                    Text("Preferred roommmate gender: " + "Girl")
                    Text("Personality")
                        .font(.largeTitle)
                        .fontWeight(.bold)
                    /*
                    Text(person.morning)
                    Text(person.clean)
                    Text("Can my roommate drink or smoke? " + person.drink)
                    Text("Overnight Guests? " + person.guests)
                    Text("How often they are home:")
                    //insert a progress scale here
                    ProgressView("", value: person.home, total: 1)
                    Text("How often they party:")
                    //insert a progress scale here
                    ProgressView("", value: person.party, total: 1)
                    Text("Preferred room temperature" + person.temp)
                    Text("Worst Habit:")
                    Text(person.habit)
                    Text("Deal Breaker: ")
                    Text(person.breaker)*/
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
