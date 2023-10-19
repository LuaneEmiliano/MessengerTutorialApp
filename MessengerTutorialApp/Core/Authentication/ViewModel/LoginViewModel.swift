//
//  LoginViewModel.swift
//  MessengerTutorialApp
//
//  Created by luane Niejelski on 10/18/23.
//

import Foundation

class LoginViewModel: ObservableObject {
  
  @Published var email = ""
  @Published var password = ""
  
  func login() async throws {
    try await AuthService.shared.login(withEmail: email, password: password)
  }
}
