//
//  RegistrationView.swift
//  MessengerTutorialApp
//
//  Created by luane Niejelski on 10/17/23.
//

import SwiftUI

struct RegistrationView: View {
  
  @StateObject var viewModel = RegistrationViewModel()
  @Environment(\.dismiss) var dismiss
  
  var body: some View {
    VStack {
      Spacer()
      //logo image
      Image("MessengerLogo")
        .resizable()
        .scaledToFit()
        .frame(width: 150, height: 150)
        .padding()
      //text field
      VStack {
        TextField("Enter your email", text: $viewModel.email)
          .font(.subheadline)
          .padding(12)
          .background(Color(.systemGray6))
          .cornerRadius(10)
          .padding(.horizontal, 24)
        TextField("Enter your full name", text: $viewModel.fullName)
          .font(.subheadline)
          .padding(12)
          .background(Color(.systemGray6))
          .cornerRadius(10)
          .padding(.horizontal, 24)
        SecureField("Enter your password", text: $viewModel.password)
          .font(.subheadline)
          .padding(12)
          .background(Color(.systemGray6))
          .cornerRadius(10)
          .padding(.horizontal, 24)
      }
      
      Button {
        Task { try await viewModel.createUser()}
      } label: {
        Text("Sign Up")
          .font(.subheadline)
          .padding(12)
          .frame(maxWidth: .infinity)
          .background(Color(.systemBlue))
          .foregroundColor(.white)
          .cornerRadius(10)
          .padding(.horizontal, 24)
        
      }
      .padding(.vertical)
      Spacer()
      Divider()
      
      Button {
        dismiss()
      } label: {
        HStack(spacing: 3) {
          Text("Already have an account?")
          
          Text("Sign In")
            .fontWeight(.semibold)
        }
        .font(.footnote)
        .padding(.vertical)
      }
    }
  }
}

struct RegistrationView_Previews: PreviewProvider {
  static var previews: some View {
    RegistrationView()
  }
}
