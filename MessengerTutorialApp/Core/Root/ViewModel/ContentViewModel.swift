//
//  ContentViewModel.swift
//  MessengerTutorialApp
//
//  Created by luane Niejelski on 10/18/23.
//

import Firebase
import Combine

@MainActor
class ContentViewModel: ObservableObject {
  @Published var userSession: FirebaseAuth.User?
  
  private var cancellables = Set<AnyCancellable>()
  
  init() {
    setupSubscribers()
  }
  //This is how you listen for updates using combine
  private func setupSubscribers() {
    AuthService.shared.$userSession.sink { [weak self] userSessionFromAuthService in
      self?.userSession = userSessionFromAuthService
    }.store(in: &cancellables)
  }
}
