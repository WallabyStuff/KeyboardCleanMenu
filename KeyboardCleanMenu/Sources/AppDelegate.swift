//
//  AppDelegate.swift
//  KeyboardCleanMenu
//
//  Created by 이승기 on 2023/04/16.
//

import SwiftUI

class AppDelegate: NSObject, NSApplicationDelegate {
  
  // MARK: - Properties
  
  static private(set) var instance: AppDelegate!
  /// 이거 lazy 안 해주면 앱 터짐 ㅇㅋ?
  lazy var statusBarItem = NSStatusBar.system.statusItem(withLength: NSStatusItem.variableLength)
  private let menu = ApplicationMenu()
  
  
  // MARK: - LifeCycle
  
  func applicationDidFinishLaunching(_ notification: Notification) {
    AppDelegate.instance = self
    setup()
  }
  
  
  // MARK: - Setups
  
  private func setup() {
    setupStatusBarItem()
    setupNotifications()
  }
  
  private func setupStatusBarItem() {
    let image = NSImage(systemSymbolName: "keyboard.fill", accessibilityDescription: nil)?.image(with: .white)
    statusBarItem.button?.image = image
    statusBarItem.button?.imagePosition = .imageLeading
    statusBarItem.menu = menu.createMenu()
  }
  
  private func setupNotifications() {
    NotificationCenter.default.addObserver(self, selector: #selector(updateStatusBarItemColor(_:)), name: .updateStatusBarItemColor, object: nil)
  }
  
  
  // MARK: - Methods
  
  @objc
  private func updateStatusBarItemColor(_ notification: Notification) {
    guard let color = notification.object as? NSColor else { return }
    
    let image = NSImage(systemSymbolName: "keyboard.fill", accessibilityDescription: nil)?.image(with: color)
    statusBarItem.button?.image = image
  }
}
