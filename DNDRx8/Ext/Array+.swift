//
//  Array+.swift
//  DNDRx8
//
//  Created by Aaron Lee on 2023/01/18.
//

import Foundation

extension Collection {
  /// Returns the element at the specified index if it is within bounds, otherwise nil.
  subscript (safe index: Index) -> Element? {
    return indices.contains(index) ? self[index] : nil
  }
}
