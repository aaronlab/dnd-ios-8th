//
//  Loadable.swift
//  DNDRx8
//
//  Created by Aaron Lee on 2023/01/18.
//

import Foundation
import RxCocoa

protocol Loadable: AnyObject {
  var isLoading: BehaviorRelay<Bool> { get }
}

extension Loadable {
  func startLoading() {
    DispatchQueue.main.async { [weak self] in
      guard let self = self else { return }
      self.isLoading.accept(true)
    }
  }
  
  func stopLoading() {
    DispatchQueue.main.async { [weak self] in
      guard let self = self else { return }
      self.isLoading.accept(false)
    }
  }
}
