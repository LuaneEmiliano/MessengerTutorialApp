//
//  Message.swift
//  MessengerTutorialApp
//
//  Created by luane Niejelski on 10/18/23.
//

import Foundation
import Firebase
import FirebaseFirestoreSwift

//Message data object
struct Message: Identifiable, Codable, Hashable {
  @DocumentID var messageId: String?
  let fromId: String
  let toId: String
  let messageText: String
  let timestamp: Timestamp
  
  var user: User?
  
  var id: String {
    return messageId ?? NSUUID().uuidString
  }
  
  var chatPartnerId: String {
    return fromId == Auth.auth().currentUser?.uid ? toId : fromId
  }
  var isFromCurrentUser: Bool {
    return fromId == Auth.auth().currentUser?.uid
  }
  var timestampString: String {
    return timestamp.dateValue().timestampString()
  }
}
