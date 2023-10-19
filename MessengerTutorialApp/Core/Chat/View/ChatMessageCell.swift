//
//  ChatMessageCell.swift
//  MessengerTutorialApp
//
//  Created by luane Niejelski on 10/17/23.
//

import SwiftUI

struct ChatMessageCell: View {
  
  let isFromCurrentUser: Bool
  
    var body: some View {
      HStack {
        if isFromCurrentUser {
          Spacer()
          
          Text("Test Message, I'm going to make this message very long so we can see what happens.")
            .font(.subheadline)
            .padding(12)
            .background(Color(.systemBlue))
            .foregroundColor(.white)
            .clipShape(ChatBubble(isFromCurrentUser: isFromCurrentUser))
            .frame(maxWidth: UIScreen.main.bounds.width / 1.5, alignment: .trailing)
        } else {
          HStack(alignment: .bottom, spacing: 8) {
            CircularProfileImageView(user: User.MOCK_USER, size: .xxSmall)
            
            Text("Test Message, I'm going to make this message very long so we can see what happens.")
              .font(.subheadline)
              .padding(12)
              .background(Color(.systemGray5))
              .foregroundColor(.black)
              .clipShape(ChatBubble(isFromCurrentUser: isFromCurrentUser))
              .frame(maxWidth: UIScreen.main.bounds.width / 1.5, alignment: .leading)
            
            Spacer()
          }
        }
      }
      .padding(.horizontal, 8)
    }
}

struct ChatMessageCell_Previews: PreviewProvider {
    static var previews: some View {
      ChatMessageCell(isFromCurrentUser: true)
    }
}