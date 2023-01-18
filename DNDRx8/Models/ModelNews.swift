//
//  ModelNews.swift
//  DNDRx8
//
//  Created by Aaron Lee on 2023/01/18.
//

import Foundation

struct ModelNews {
  let title: String
  let summary: String
  let date: String
}

extension ModelNews {
  static func mock(completion: @escaping ((Array<ModelNews>) -> Void)) {
    DispatchQueue.main.asyncAfter(deadline: .now() + 3.0) {
      
      completion(Array(repeating: ModelNews(title: "Lorem Ipsum is simply dummy text of the printing and typesetting industry.",
                                            summary: "Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.",
                                            date: "2023-01-01"),
                            count: 20))
    }
  }
}
