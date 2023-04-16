//
//  ApplicationMenu.swift
//  KeyboardCleanMenu
//
//  Created by 이승기 on 2023/04/16.
//

import SwiftUI

class ApplicationMenu: NSObjectController {

  // MARK: - Properties
  
  private let menu = NSMenu()
  private var contentView: NSView?
  private let accessibilityAuthManager = AccessibilityAuthManager()
  
  
  // MARK: - Methods
  
  public func createMenu() -> NSMenu {

    // ContentView
    let lockKeyboardInputView = LockKeyboardInputView()
    let contentViewController = NSHostingController(rootView: lockKeyboardInputView)
    contentView = contentViewController.view
    
    let customMenuItems = NSMenuItem()
    customMenuItems.view = contentView
    customMenuItems.isHidden = true
    menu.addItem(customMenuItems)
    setupNotificationCenterObserver()
    
    // Separator
    menu.addItem(.separator())
    
    // Quit menu
    let quit = NSMenuItem(
      title: "menuItem.quit".localized(),
      action: #selector(NSApplication.terminate(_:)),
      keyEquivalent: "q")
    menu.addItem(quit)
    
    return menu
  }
  
  private func setupNotificationCenterObserver() {
    NotificationCenter.default.addObserver(self, selector: #selector(didUpdateFrame(_:)), name: .updateFrame, object: nil)
  }
  
  @objc
  private func didUpdateFrame(_ notification: Notification) {
    guard let frame = notification.object as? NSRect else { return }
    contentView?.frame = frame
  }
}
