//
//  DisposableObjectProvider.swift
//  DNDRx8
//
//  Created by Aaron Lee on 2023/01/18.
//

import Foundation
import RxSwift

protocol DisposableObjectProvider: AnyObject {
  var bag: DisposeBag { get }
}
