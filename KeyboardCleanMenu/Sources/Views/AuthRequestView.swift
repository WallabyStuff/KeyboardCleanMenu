//
//  AuthRequestView.swift
//  KeyboardCleanAssistance
//
//  Created by 이승기 on 2023/04/15.
//

import SwiftUI

struct AuthRequestView: View {
  
  enum Constants {
    static let accessibilityPath = "x-apple.systempreferences:com.apple.preference.security?Privacy_Accessibility"
  }
  
  // MARK: - Views
  
  var body: some View {
    VStack() {
      Text("auth.permissionNotice".localized())
        .multilineTextAlignment(.center)
      
      Button {
        openAccessibilitySetting()
      } label: {
        HStack {
          Image(systemName: "gear")
          Text("auth.goToSetting".localized())
        }
        .foregroundColor(.white)
      }
    }
  }
  
  
  // MARK: - Methods
  
  private func openAccessibilitySetting() {
    if let url = URL(string: Constants.accessibilityPath) {
      NSWorkspace.shared.open(url)
    }
  }
}


// MARK: - Preview

struct AuthRequestView_Previews: PreviewProvider {
  static var previews: some View {
    AuthRequestView()
      .frame(width: 220, height: 220)
  }
}
