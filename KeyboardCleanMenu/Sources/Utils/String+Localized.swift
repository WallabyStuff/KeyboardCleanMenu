//
//  String+Localized.swift
//  KeyboardCleanAssistance
//
//  Created by 이승기 on 2023/04/05.
//

import Foundation

extension String {
  func localized(_ comment: String = "") -> String {
    return NSLocalizedString(self, comment: comment)
  }
}
