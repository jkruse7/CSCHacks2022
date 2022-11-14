//
//  User.swift
//  test2
//
//  Created by Julianne on 11/8/22.
//

import UIKit
import Foundation
import FirebaseDatabase

final class DatabaseAPI{
    static let shared = DatabaseAPI()
    private let database = Database.database(url: "https://cschacks-default-rtdb.firebaseio.com/").reference()
}

struct User {
    let name: String?
    let email: String
    //var password: String?
    
    var checkedEmail: String {
        var checkedEmail = email.replacingOccurrences(of: ".", with: "-")
        checkedEmail = checkedEmail.replacingOccurrences(of: "@", with: "-")
        return checkedEmail
    }

}

extension DatabaseAPI {
    public func checkIfEmailExists(with email: String, completion: @escaping ((Bool)->Void)){
        var checkedEmail = email.replacingOccurrences(of: ".", with: "-")
        checkedEmail = checkedEmail.replacingOccurrences(of: "@", with: "-")
        database.child(checkedEmail).observeSingleEvent(of: .value, with: {snapshot in guard snapshot.value as? String != nil else{
            completion(false)
            return}
            completion(true)
        })
    }
    public func postNewUser(with user: User, completion: @escaping ((Bool) -> Void)){
        database.child(user.checkedEmail).setValue(
            ["email": user.checkedEmail], withCompletionBlock: {error, _ in
                guard error == nil else{
                    print("Database write failed")
                    completion(false)
                    return
                }
                self.database.child("users").observeSingleEvent(of: .value, with: {snapshot in if var users = snapshot.value as? [[String: String]]{
                    let newElement = [
                        "email":user.checkedEmail]
                
                    users.append(newElement)
                    self.database.child("users").setValue(newElement, withCompletionBlock: {error, _ in
                        guard error == nil else{
                            completion(false)
                            return
                        }
                        completion(true)
                    })
                } else{
                    let newCollection : [String: String] = [
                        "email":user.checkedEmail]
                    self.database.child("users").setValue(newCollection, withCompletionBlock: {error, _ in
                        guard error == nil else{
                            completion(false)
                            return
                        }
                        completion(true)
                    })
                }
                    
                })
            }
        )
    }
}
