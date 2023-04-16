//
//  KeyboardInputBlocker.swift
//  KeyboardCleanTool
//
//  Created by 이승기 on 2023/04/04.
//

import Cocoa

class KeyboardInputInterrupter {
  
  // MARK: - Properties
  
  private var eventTap: CFMachPort?
  private let eventMask = CGEventMask(1 << CGEventType.keyDown.rawValue)
  
  
  // MARK: - Methods
  
  public func startBlockingKeyboardInput() {
    let eventTapCallback: CGEventTapCallBack = { _, _, _, _ in
      return nil
    }
    
    eventTap = CGEvent.tapCreate(
      tap: .cghidEventTap,
      place: .headInsertEventTap,
      options: .defaultTap,
      eventsOfInterest: eventMask,
      callback: eventTapCallback,
      userInfo: nil
    )
    
    // Enable event tap
    guard let eventTap = eventTap else {
      return
    }
    
    let runLoopSource = CFMachPortCreateRunLoopSource(kCFAllocatorDefault, eventTap, 0)
    CFRunLoopAddSource(CFRunLoopGetCurrent(), runLoopSource, .commonModes)
    CGEvent.tapEnable(tap: eventTap, enable: true)
  }
  
  public func stopBlockingKeyboardInput() {
    // Disable event tap
    guard let eventTap = eventTap else {
      return
    }
    
    CGEvent.tapEnable(tap: eventTap, enable: false)
  }
}
