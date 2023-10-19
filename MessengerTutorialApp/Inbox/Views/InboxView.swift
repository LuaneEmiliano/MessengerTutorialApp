//
//  InboxView.swift
//  MessengerTutorialApp
//
//  Created by luane Niejelski on 10/17/23.
//

import SwiftUI

struct InboxView: View {
  
  @State private var showNewMessageView = false
  @StateObject var viewModel = InboxViewModel()
  @State private var selectedUser: User?
  @State private var showChat = false
  
  private var user: User? {
    return viewModel.currentUser
  }
  
  var body: some View {
    NavigationStack {
      ScrollView {
        ActiveNowView()
        
        List {
          ForEach(0...10, id: \.self) { message in
            InboxRowView()
          }
        }
        .listStyle(PlainListStyle())
        .frame(height: UIScreen.main.bounds.height - 120)
      }
      .onChange(of: selectedUser, perform: { newValue in
        showChat = newValue != nil
      })
      .navigationDestination(for: User.self, destination: { user in
        ProfileView(user: user)
      })
      .navigationDestination(isPresented: $showChat, destination: {
        if let user = selectedUser {
          ChatView(user: user)
        }
      })
      .fullScreenCover(isPresented: $showNewMessageView, content: {
        NewMessageView(selectedUser: $selectedUser)
      })
      .navigationBarTitleDisplayMode(.inline)
      .toolbar {
        ToolbarItem(placement: .navigationBarLeading) {
          NavigationLink(value: user) {
            CircularProfileImageView(user: user, size: .xSmall)
          }
        }
        
        ToolbarItem(placement: .navigationBarTrailing) {
          Button {
            showNewMessageView.toggle()
          } label: {
            Image(systemName: "square.and.pencil.circle.fill")
              .resizable()
              .frame(width: 32, height: 32)
              .foregroundStyle(.black, Color(.systemGray5))
          }
        }
      }
    }
  }
}

struct InboxView_Previews: PreviewProvider {
  static var previews: some View {
    InboxView()
  }
}
