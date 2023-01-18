//
//  MainViewController.swift
//  DNDRx8
//
//  Created by Aaron Lee on 2023/01/18.
//

import UIKit
import RxSwift

fileprivate let tableViewCellIdentifier = "newsCell"

class MainViewController: UIViewController {
  
  private let tableView = UITableView(frame: .zero, style: .plain)
  
  private let loadingView = LoadingView()
  
  private let viewModel = MainViewModel()
  
  var bag = DisposeBag()
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    configureViewController()
    configureTableView()
    configureLoadingView()
    
    bindViewModel()
  }
  
  override func viewDidAppear(_ animated: Bool) {
    super.viewDidAppear(animated)
    
    viewModel.loadNews()
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
  
  private func bindViewModel() {
    viewModel.isLoading
      .asDriver()
      .drive(onNext: { [weak self] isLoading in
        guard let self = self else { return }
        
        switch isLoading {
        case true:
          self.loadingView.startLoading()
        case false:
          self.loadingView.stopLoading()
          self.tableView.reloadData()
        }
      })
      .disposed(by: bag)
  }
  
}

// MARK: - UITableViewDelegate

extension MainViewController: UITableViewDelegate {
  func tableView(_ tableView: UITableView,
                 heightForRowAt indexPath: IndexPath) -> CGFloat {
    UITableView.automaticDimension
  }
  
  func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
    56.0
  }
}

// MARK: - UITableViewDataSource

extension MainViewController: UITableViewDataSource {
  func tableView(_ tableView: UITableView,
                 numberOfRowsInSection section: Int) -> Int {
    viewModel.news.value.count
  }
  
  func tableView(_ tableView: UITableView,
                 cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    guard let cell = tableView.dequeueReusableCell(withIdentifier: tableViewCellIdentifier,
                                                   for: indexPath) as? NewsTableViewCell,
          let news = viewModel.news.value[safe: indexPath.row] else {
      return UITableViewCell()
    }
    
    cell.configureCell(with: news)
    
    return cell
  }
}

// MARK: - DisposableObjectProvider

extension MainViewController: DisposableObjectProvider {}
