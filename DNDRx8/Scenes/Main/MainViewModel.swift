//
//  MainViewModel.swift
//  DNDRx8
//
//  Created by Aaron Lee on 2023/01/18.
//

import Foundation
import RxCocoa

final class MainViewModel {
  var isLoading = BehaviorRelay(value: false)
  
  var news = BehaviorRelay<Array<ModelNews>>(value: [])
  
  func loadNews() {
    startLoading()
    
    ModelNews.mock { [weak self] news in
      guard let self = self else { return }
      
      DispatchQueue.main.async {
        self.news.accept(news)
        self.stopLoading()
      }
    }
  }
}

// MARK: - Loadable

extension MainViewModel: Loadable {}
