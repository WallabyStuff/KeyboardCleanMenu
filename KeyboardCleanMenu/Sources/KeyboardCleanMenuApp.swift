//
//  KeyboardCleanMenuApp.swift
//  KeyboardCleanMenu
//
//  Created by 이승기 on 2023/04/16.
//

import SwiftUI

@main
struct KeyboardCleanMenuApp: App {
  
  // MARK: - Properties
  
  @NSApplicationDelegateAdaptor(AppDelegate.self) var appDelegate
  
  
  // MARK: - Views
  
  var body: some Scene {
    Settings {
      EmptyView()
    }
    
    /// Menubar extra가 아닌 AppDelegate를 통해서 NSHostingViewController를 통해서
    /// 뷰를 그려주는 이유는 Menubar Extra 에서는 매번 View의 onAppear가 호출되지 않기 때문임.
  }
}
