//
//  AccessibilityAuthManager.swift
//  KeyboardCleanTool
//
//  Created by 이승기 on 2023/04/04.
//

import Cocoa

class AccessibilityAuthManager {
  
  static var isPermitted: Bool {
    let options = [kAXTrustedCheckOptionPrompt.takeUnretainedValue() as NSString: true]
    let accessibilityEnabled = AXIsProcessTrustedWithOptions(options as CFDictionary)
    if !accessibilityEnabled {
      return false
    } else {
      return true
    }
  }
}
