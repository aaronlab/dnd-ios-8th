//
//  Loadable.swift
//  DNDRx8
//
//  Created by Aaron Lee on 2023/01/18.
//

import Foundation
import RxSwift

protocol Loadable {
  var isLoading: BehaviorSubject<Bool> { get }
}
