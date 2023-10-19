//
//  AuthService.swift
//  MessengerTutorialApp
//
//  Created by luane Niejelski on 10/18/23.
//

import Foundation
import Firebase
import FirebaseFirestoreSwift

//Holds all the code responsible to do the communication with Firebase
@MainActor
class AuthService {
  
  @Published var userSession: FirebaseAuth.User?
  
  //AuthService contains userSession property LoginViewModel and RegistrationViewModel update this userSession property when authState changes. Since we utilize a shared instance of the AuthService both viewModels update the same userSession property via the shared AuthService. The contentView listens to updates on the userSession and routes the user to the correct view.
  static let shared = AuthService()
  
  init() {
    self.userSession = Auth.auth().currentUser
    loadCurrentUserData()
    print("Debug: User session id is \(userSession?.uid ?? "")")
  }
  
  func login(withEmail email: String, password: String) async throws {
    do {
      let result = try await Auth.auth().signIn(withEmail: email, password: password)
      self.userSession = result.user
      loadCurrentUserData()
    } catch {
      print("Debug: Failed to create user with error: \(error.localizedDescription)")
    }
  }
  
  func createUser(withEmail email: String, password: String, fullName: String) async throws {
    do {
      let result = try await Auth.auth().createUser(withEmail: email, password: password)
      self.userSession = result.user
      try await self.uploadUserData(email: email, fullName: fullName, id: result.user.uid)
      loadCurrentUserData()
    } catch {
      print("Debug: Failed to create user with error: \(error.localizedDescription)")
    }
  }
  
  func signOut() {
    do {
      try Auth.auth().signOut() // signs out on backend
      self.userSession = nil  // updates routing logic
      UserService.shared.currentUser = nil 
    } catch {
      print("Debug: Failed to sign out with error \(error.localizedDescription)")
    }
  }
  
  //Upload the users info to Firebase and keep it there.
  private func uploadUserData(email: String, fullName: String, id: String) async throws {
    let user = User(fullName: fullName, email: email, profileImageUrl: nil)
    guard let encodedUser = try? Firestore.Encoder().encode(user) else { return }
    try await Firestore.firestore().collection("users").document(id).setData(encodedUser)
  }
  
  private func loadCurrentUserData() {
    Task { try await UserService.shared.fetchCurrentUser() }
  }
}
