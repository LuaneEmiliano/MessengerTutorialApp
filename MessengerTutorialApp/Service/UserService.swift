//
//  UserService.swift
//  MessengerTutorialApp
//
//  Created by luane Niejelski on 10/18/23.
//

import Foundation
import Firebase
import FirebaseFirestoreSwift

//Responsible for fetching all the user info from Firebase

class UserService {
  
  @Published var currentUser: User?
  
  static let shared = UserService()
  
  @MainActor
  func fetchCurrentUser() async throws {
    guard let uid = Auth.auth().currentUser?.uid else { return }
    let snapshot = try await Firestore.firestore().collection("users").document(uid).getDocument()
    let user = try snapshot.data(as: User.self)
    self.currentUser = user
    
  }
  //fetching all the users in the app
  static func fetchAllUsers(limit: Int? = nil) async throws -> [User] {
    let query = FirestoreConstants.UserCollection
    if let limit { query.limit(to: limit) }
    let snapshot = try await query.getDocuments()
   return snapshot.documents.compactMap ({ try? $0.data(as: User.self)})
    
  }
  static func fetchUser(withUid uid: String, completion: @escaping(User) -> Void) {
    FirestoreConstants.UserCollection.document(uid).getDocument { snapshot, _ in
      guard var user = try? snapshot?.data(as: User.self) else { return }
      completion(user)
    }
  }
 }

