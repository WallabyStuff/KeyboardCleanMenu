//
//  NSImage+TintColor.swift
//  KeyboardCleanMenu
//
//  Created by 이승기 on 2023/04/17.
//

import Cocoa

extension NSImage {
  func image(with tintColor: NSColor) -> NSImage {
    if self.isTemplate == false {
      return self
    }
    
    let image = self.copy() as! NSImage
    image.lockFocus()
    
    tintColor.set()
    
    let imageRect = NSRect(origin: .zero, size: image.size)
    imageRect.fill(using: .sourceIn)
    
    image.unlockFocus()
    image.isTemplate = false
    
    return image
  }
}
