//
//  LockKeyboardInputView.swift
//  KeyboardCleanAssistance
//
//  Created by 이승기 on 2023/04/04.
//

import SwiftUI

struct LockKeyboardInputView: View {
  
  // MARK: - Constants
  
  enum Metric {
    static let keyboardInputSwitchViewFrame = NSRect(x: 0, y: 0, width: 220, height: 44)
    static let authRequestViewFrame = NSRect(x: 0, y: 0, width: 180, height: 160)
  }
  
  // MARK: - Properties
  
  @State var isAccessibilityPermitted = false
  @State var isKeyboardInputBlocked = false
  
  
  // MARK: - Views
  
  var body: some View {
    VStack() {
      if isAccessibilityPermitted {
        KeyboardInputSwitchView(isKeyboardInputBlocked: $isKeyboardInputBlocked)
      }
      else {
        AuthRequestView()
      }
    }
    .padding()
    .onAppear {
      isAccessibilityPermitted = AccessibilityAuthManager.isPermitted
      
      /// Update status bar content size through notification center
      NotificationCenter.default.post(
        name: .updateFrame,
        object: isAccessibilityPermitted ? Metric.keyboardInputSwitchViewFrame : Metric.authRequestViewFrame)
    }
  }
}


// MARK: - Preview

struct LockKeyboardInputView_Previews: PreviewProvider {
  static var previews: some View {
    LockKeyboardInputView()
      .frame(width: 220, height: 44)
  }
}
