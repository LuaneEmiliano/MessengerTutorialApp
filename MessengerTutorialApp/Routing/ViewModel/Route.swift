//
//  Route.swift
//  MessengerTutorialApp
//
//  Created by luane Niejelski on 10/20/23.
//

import Foundation

enum Route: Hashable {
  case profile(User)
  case chatView(User)
}
