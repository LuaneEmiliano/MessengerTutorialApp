//
//  InboxViewModel.swift
//  MessengerTutorialApp
//
//  Created by luane Niejelski on 10/18/23.
//

import Foundation
import Combine
import Firebase

@MainActor
class InboxViewModel: ObservableObject {
  @Published var currentUser: User?
  
  private var cancellables = Set<AnyCancellable>()
  
  init() {
    setupSubscribers()
  }
  
  private func setupSubscribers() {
     UserService.shared.$currentUser
       .receive(on: DispatchQueue.main) // Ensure updates are on the main thread
       .sink { [weak self] user in
         self?.currentUser = user
       }
       .store(in: &cancellables)
   }
}
