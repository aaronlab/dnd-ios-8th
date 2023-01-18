//
//  LoadingView.swift
//  DNDRx8
//
//  Created by Aaron Lee on 2023/01/18.
//

import UIKit

class LoadingView: UIView {
  let indicator = UIActivityIndicatorView()
  
  override init(frame: CGRect) {
    super.init(frame: frame)
    configureView()
  }
  
  required init?(coder: NSCoder) {
    super.init(coder: coder)
    configureView()
  }
  
  private func configureView() {
    isHidden = true
    
    backgroundColor = .lightGray
    addSubview(indicator)
    
    indicator.snp.makeConstraints {
      $0.center.equalToSuperview()
    }
  }
  
  func startLoading() {
    DispatchQueue.main.async { [weak self] in
      guard let self = self else { return }
      self.isHidden = false
      self.indicator.startAnimating()
    }
  }
  
  func stopLoading() {
    DispatchQueue.main.async { [weak self] in
      guard let self = self else { return }
      self.indicator.stopAnimating()
      self.isHidden = true
    }
  }
}
