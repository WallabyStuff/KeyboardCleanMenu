//
//  KeyboardInputSwitchView.swift
//  KeyboardCleanAssistance
//
//  Created by 이승기 on 2023/04/15.
//

import SwiftUI

struct KeyboardInputSwitchView: View {
  
  // MARK: - Constants
  
  enum Metric {
    static let iconSize: CGFloat = 16
    static let minHeight: CGFloat = 44
  }
  
  // MARK: - Properties
  
  @Binding var isKeyboardInputBlocked: Bool
  var keyboardInputInterrupter = KeyboardInputInterrupter()
  
  
  // MARK: - Views
  
  var body: some View {
    HStack {
      Image(systemName: isKeyboardInputBlocked ? "lock.fill" : "lock.open.fill")
        .resizable()
        .scaledToFit()
        .frame(width: Metric.iconSize,
               height: Metric.iconSize)
      
      Text(isKeyboardInputBlocked ? "menuItem.stop".localized() : "menuItem.startCleaningKeyboard".localized())
      
      Spacer()
      
      Toggle("", isOn: $isKeyboardInputBlocked)
        .toggleStyle(.switch)
        .onReceive([self.isKeyboardInputBlocked].publisher.first()) { isKeyInputAllowed in
          if isKeyInputAllowed {
            blockKeyboardInput()
          } else {
            stopBlockKeyboardInput()
          }
        }
    }
    .frame(maxWidth: .infinity, minHeight: Metric.minHeight)
    .buttonStyle(.borderless)
    .foregroundColor(.white)
  }
  
  
  // MARK: - Methods
  
  private func blockKeyboardInput() {
    keyboardInputInterrupter.startBlockingKeyboardInput()
    
    NotificationCenter.default.post(name: .updateStatusBarItemColor, object: NSColor.red)
  }
  
  private func stopBlockKeyboardInput() {
    keyboardInputInterrupter.stopBlockingKeyboardInput()
    
    NotificationCenter.default.post(name: .updateStatusBarItemColor, object: NSColor.white)
  }
}


// MARK: - Preview

struct KeyboardInputSwitchView_Previews: PreviewProvider {
  static var previews: some View {
    KeyboardInputSwitchView(isKeyboardInputBlocked: .constant(false))
      .frame(width: 220, height: 44)
  }
}
