//
//  MainViewModel.swift
//  DNDRx8
//
//  Created by Aaron Lee on 2023/01/18.
//

import Foundation
import RxSwift

final class MainViewModel {
  var isLoading = BehaviorSubject(value: false)
}

// MARK: - Loadable

extension MainViewModel: Loadable {}
