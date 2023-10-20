//
//  Constants.swift
//  MessengerTutorialApp
//
//  Created by luane Niejelski on 10/19/23.
//

import Foundation
import Firebase

struct FirestoreConstants {
  
 static let UserCollection = Firestore.firestore().collection("users")
 static  let MessagesCollection = Firestore.firestore().collection("messages")
  
}
