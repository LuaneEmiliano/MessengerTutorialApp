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
  @Published var recentMessages = [Message]()
  
  private var cancellables = Set<AnyCancellable>()
  private let service = InboxService()
  
  init() {
    setupSubscribers()
    service.observeRecentMessages()
  }
  
  private func setupSubscribers() {
    UserService.shared.$currentUser
      .receive(on: DispatchQueue.main).sink { [weak self] user in
        self?.currentUser = user
      }.store(in: &cancellables)
    
    service.$documentChanges.sink { [weak self] changes in
      self?.loadInitialMessages(fromChanges: changes)
    }.store(in: &cancellables)
  }
  
  private func loadInitialMessages(fromChanges changes: [DocumentChange]) {
    var messages = changes.compactMap ({ try? $0.document.data(as: Message.self)} )
    
    for i in 0 ..< messages.count {
      let message = messages[i]
      
      UserService.fetchUser(withUid: message.chatPartnerId) { user in
        messages[i].user = user
        self.recentMessages.append(messages[i])
      }
    }
  }
}
