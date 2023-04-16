//
//  NotificationCenter+Name.swift
//  KeyboardCleanAssistance
//
//  Created by 이승기 on 2023/04/05.
//

import Foundation

extension Notification.Name {
  static var updateFrame: Self {
    return .init("statusbar.item.updateFrame")
  }
  
  static var updateStatusBarItemColor: Self {
    return .init("statusbar.item.updateColor")
  }
}
