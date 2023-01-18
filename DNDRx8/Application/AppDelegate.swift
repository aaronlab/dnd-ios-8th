//
//  AppDelegate.swift
//  DNDRx8
//
//  Created by Aaron Lee on 2023/01/18.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
  
  var window: UIWindow?
  
  func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
    
    window = UIWindow()
    
    let mainViewController = MainViewController()
      .embedInNavigationViewController()
    
    window?.rootViewController = mainViewController
    
    window?.makeKeyAndVisible()
    
    return true
  }
  
}

