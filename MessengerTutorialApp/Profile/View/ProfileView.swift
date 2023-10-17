//
//  ProfileView.swift
//  MessengerTutorialApp
//
//  Created by luane Niejelski on 10/17/23.
//

import SwiftUI
import PhotosUI

struct ProfileView: View {
  
  @StateObject var viewModel = ProfileViewModel()
  
   var body: some View {
    VStack {
      // Header
      VStack {
        PhotosPicker(selection: $viewModel.selectedItem) {
          if let profileImage = viewModel.profileImage {
            profileImage
              .resizable()
              .scaledToFill()
              .frame(width: 80, height: 80)
              .clipShape(Circle())
          } else {
            Image(systemName: "person.circle.fill")
              .resizable()
              .frame(width: 80, height: 80)
              .foregroundColor(Color(.systemGray4))
          }
        }
        
        Text("Luna California")
          .font(.title2)
          .fontWeight(.semibold)
      }
      
      //List
      List {
        Section {
          ForEach(SettingsOptionsViewModel.allCases) { option in
            HStack {
              Image(systemName: option.imageName)
                .resizable()
                .frame(width: 24, height: 24)
                .foregroundColor(option.imageBackgroundColor)
              
              Text(option.title)
                .font(.subheadline)
            }
          }
        }
        Section {
          Button("Log Out") {
          }
          Button("Delete Account") {
          }
        }
        .foregroundColor(.red)
      }
    }
  }
}
struct ProfileView_Previews: PreviewProvider {
  static var previews: some View {
    ProfileView()
  }
}