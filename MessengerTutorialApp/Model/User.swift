//
//  User.swift
//  MessengerTutorialApp
//
//  Created by luane Niejelski on 10/17/23.
//

import Foundation
import FirebaseFirestoreSwift
import Firebase

struct User: Codable, Identifiable, Hashable {
  @DocumentID var uid: String?
  
  var fullName: String
  var email: String
  var profileImageUrl: String?
  
  var id: String {
    return uid ?? NSUUID().uuidString
  }
  
  var firstName: String {
    let formatter = PersonNameComponentsFormatter()
    let components = formatter.personNameComponents(from: fullName)
    return components?.givenName ?? fullName
  }
}

extension User {
  static let MOCK_USER = User(fullName: "Luna California", email: "lunacalifornia@gmail.com", profileImageUrl: "Luna")
}
