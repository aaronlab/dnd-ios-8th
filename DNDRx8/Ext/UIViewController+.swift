//
//  UIViewController+.swift
//  DNDRx8
//
//  Created by Aaron Lee on 2023/01/18.
//

import UIKit

extension UIViewController {
  /// Returns the parent navigation view controller after embed into it
  func embedInNavigationViewController() -> UINavigationController {
    let navigationViewController = UINavigationController(rootViewController: self)
    
    return navigationViewController
  }
}
