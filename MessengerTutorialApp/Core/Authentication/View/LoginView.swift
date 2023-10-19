//
//  LoginView.swift
//  MessengerTutorialApp
//
//  Created by luane Niejelski on 10/17/23.
//

import SwiftUI

struct LoginView: View {
  
  @StateObject var viewModel = LoginViewModel()
  
  var body: some View {
    NavigationStack {
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
          SecureField("Enter your password", text: $viewModel.password)
            .font(.subheadline)
            .padding(12)
            .background(Color(.systemGray6))
            .cornerRadius(10)
            .padding(.horizontal, 24)
        }
        //forgot password
        Button {
          print("Forgot password")
        } label: {
          Text("Forgot password?")
            .font(.footnote)
            .fontWeight(.semibold)
            .padding(.top)
            .padding(.trailing, 28)
        }
        .frame(maxWidth: .infinity, alignment: .trailing)
        
        // login button
        Button {
          Task { try await viewModel.login()}
        } label: {
          Text("Login")
            .font(.subheadline)
            .padding(12)
            .frame(maxWidth: .infinity)
            .background(Color(.systemBlue))
            .foregroundColor(.white)
            .cornerRadius(10)
            .padding(.horizontal, 24)
        }
        .padding(.vertical)
        //facebook login
        HStack {
          Rectangle()
            .frame(width: (UIScreen.main.bounds.width / 2) - 40, height: 0.5)
          
          Text("OR")
            .font(.footnote)
            .fontWeight(.semibold)
          
          Rectangle()
            .frame(width: (UIScreen.main.bounds.width / 2) - 40, height: 0.5)
        }
        .foregroundColor(.gray)
        
        HStack {
          Image("FacebookLogo")
            .resizable()
            .frame(width: 90, height: 50)
          
          Text("Continue with Facebook")
            .font(.footnote)
            .fontWeight(.semibold)
            .foregroundColor(Color(.systemBlue))
        }
        .padding(.top, 8)
        
        Spacer()
        
        Divider()
        
        NavigationLink {
          RegistrationView()
            .navigationBarBackButtonHidden()
        } label: {
          HStack(spacing: 3) {
            Text("Don't have an account?")
            
            Text("Sign Up")
              .fontWeight(.semibold)
          }
          .font(.footnote)
        }
        .padding(.vertical)
      }
    }
  }
}


struct LoginView_Previews: PreviewProvider {
  static var previews: some View {
    LoginView()
  }
}
