//
//  TinderView.swift
//  test2
//
//  Created by Julianne on 11/12/22.
//

import SwiftUI
import UIKit
struct TinderView: View {
    private var people: [String] = ["MArio", "Luigi", "Peach", "Toad"]
    var body: some View {
        
        VStack{
            ZStack{
                //storyBoardView().edgesIgnoringSafeArea(.all)
                ForEach(people, id: \.self){person in CardView(person:person)
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
    @State private var color: Color = .black
    
    var body: some View {
        ZStack{
            Rectangle()
                .frame(width:320, height: 420)
                .border(.white, width: 6.0)
                .cornerRadius(4)
                .foregroundColor(color.opacity(0.9))
                .shadow(radius: 4)
            HStack{
               Text(person)
                    .font(.largeTitle)
                    .foregroundColor(.white)
                    .bold()
                Image(systemName: "heart.fill")
                    .foregroundColor(.red)
                
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
            color = .black
        }
        
    }
}
