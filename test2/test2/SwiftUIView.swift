//
//  SwiftUIView.swift
//  test2
//
//  Created by Julianne on 11/12/22.
//

import SwiftUI
import UIKit

struct SwiftUIView: View {
    var body: some View {
        storyBoardView().edgesIgnoringSafeArea(.all)
        VStack{
            Spacer()
            Button(action:{(print("this is a test"))}){
                Text("Hellooo")
            }
        }
    }
}

struct SwiftUIView_Previews: PreviewProvider {
    static var previews: some View {
        SwiftUIView()
    }
}
struct storyBoardView: UIViewControllerRepresentable{
    func makeUIViewController(context: Context) -> UIViewController {
        let storyBoard = UIStoryboard(name: "Main", bundle: Bundle.main)
        let controller = storyBoard.instantiateViewController(identifier: "matches")
        return controller
    }
    func updateUIViewController(_ uiViewController: UIViewController, context: Context) {
        
    }
}
