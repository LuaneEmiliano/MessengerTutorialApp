//
//  RegistrationView.swift
//  MessengerTutorialApp
//
//  Created by luane Niejelski on 10/17/23.
//

import SwiftUI

struct RegistrationView: View {
  
  @State private var email = ""
  @State private var password = ""
  @State private var fullName = ""
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
        TextField("Enter your email", text: $email)
          .font(.subheadline)
          .padding(12)
          .background(Color(.systemGray6))
          .cornerRadius(10)
          .padding(.horizontal, 24)
        TextField("Enter your full name", text: $fullName)
          .font(.subheadline)
          .padding(12)
          .background(Color(.systemGray6))
          .cornerRadius(10)
          .padding(.horizontal, 24)
        SecureField("Enter your password", text: $password)
          .font(.subheadline)
          .padding(12)
          .background(Color(.systemGray6))
          .cornerRadius(10)
          .padding(.horizontal, 24)
      }
        
        Button {
          print("Handle login")
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
