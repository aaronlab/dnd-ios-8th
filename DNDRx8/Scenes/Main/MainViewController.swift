//
//  MainViewController.swift
//  DNDRx8
//
//  Created by Aaron Lee on 2023/01/18.
//

import UIKit

class MainViewController: UIViewController {
  
  let tableView = UITableView(frame: .zero, style: .grouped)
    .then {
      $0.rowHeight = 56.0
    }
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    title = "News"
    view.backgroundColor = .white
    
    configureTableView()
  }
  
  private func configureTableView() {
    view.addSubview(tableView)
    
    tableView.snp.makeConstraints {
      $0.top.leading.equalTo(view.safeAreaLayoutGuide).offset(8)
      $0.bottom.trailing.equalTo(view.safeAreaLayoutGuide).offset(-8)
    }
  }
  
}

