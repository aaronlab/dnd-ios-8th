//
//  MainViewController.swift
//  DNDRx8
//
//  Created by Aaron Lee on 2023/01/18.
//

import UIKit

fileprivate let tableViewCellIdentifier = "newsCell"

class MainViewController: UIViewController {
  
  private let tableView = UITableView(frame: .zero, style: .plain)
  
  private let loadingView = LoadingView()
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    configureViewController()
    configureTableView()
    configureLoadingView()
  }
  
  private func configureViewController() {
    title = "News"
    view.backgroundColor = .white
  }
  
  private func configureTableView() {
    view.addSubview(tableView)
    
    tableView.snp.makeConstraints {
      $0.top.leading.equalTo(view.safeAreaLayoutGuide)
      $0.bottom.trailing.equalTo(view.safeAreaLayoutGuide)
    }
    
    tableView.register(NewsTableViewCell.self,
                       forCellReuseIdentifier: tableViewCellIdentifier)
    tableView.delegate = self
    tableView.dataSource = self
  }
  
  private func configureLoadingView() {
    view.addSubview(loadingView)
    
    loadingView.snp.makeConstraints {
      $0.edges.equalToSuperview()
    }
  }
  
}

// MARK: - UITableViewDelegate

extension MainViewController: UITableViewDelegate {
  func tableView(_ tableView: UITableView,
                 heightForRowAt indexPath: IndexPath) -> CGFloat {
    56.0
  }
}

// MARK: - UITableViewDataSource

extension MainViewController: UITableViewDataSource {
  func tableView(_ tableView: UITableView,
                 numberOfRowsInSection section: Int) -> Int {
    20
  }
  
  func tableView(_ tableView: UITableView,
                 cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    guard let cell = tableView.dequeueReusableCell(withIdentifier: tableViewCellIdentifier,
                                                   for: indexPath) as? NewsTableViewCell else {
      return UITableViewCell()
    }
    
    return cell
  }
}
