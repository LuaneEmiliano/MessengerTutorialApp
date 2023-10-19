//
//  ContentView.swift
//  MessengerTutorialApp
//
//  Created by luane Niejelski on 10/17/23.
//

import SwiftUI

struct ContentView: View {
  
  @StateObject var viewModel = ContentViewModel()
  
  var body: some View {
    Group {
      if viewModel.userSession != nil {
        InboxView()
      } else {
        LoginView()
      }
    }
  }
}

struct ContentView_Previews: PreviewProvider {
  static var previews: some View {
    ContentView()
  }
}
