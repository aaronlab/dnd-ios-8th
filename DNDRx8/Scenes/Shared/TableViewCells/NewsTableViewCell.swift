//
//  NewsTableViewCell.swift
//  DNDRx8
//
//  Created by Aaron Lee on 2023/01/18.
//

import UIKit
import Then
import SnapKit

class NewsTableViewCell: UITableViewCell {
  
  var stackView = UIStackView()
    .then {
      $0.axis = .vertical
      $0.spacing = 8.0
      $0.alignment = .leading
      $0.distribution = .fill
    }
  
  var titleLabel = UILabel()
    .then {
      $0.font = .boldSystemFont(ofSize: 24.0)
      $0.numberOfLines = 1
    }
  
  var summaryLabel = UILabel()
    .then {
      $0.font = .systemFont(ofSize: 16.0)
      $0.numberOfLines = 3
    }
  
  var dateLabel = UILabel()
    .then {
      $0.font = .systemFont(ofSize: 8.0)
      $0.numberOfLines = 1
    }
  
  private var allLabels: Array<UILabel> {
    [titleLabel,
    summaryLabel,
    dateLabel]
  }
  
  private let divider = UIView()
    .then {
      $0.backgroundColor = .gray
    }
  
  override func prepareForReuse() {
    super.prepareForReuse()
    allLabels.forEach {
      $0.text = nil
    }
  }
  
  override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
    super.init(style: style, reuseIdentifier: reuseIdentifier)
    layoutCell()
  }
  
  required init?(coder: NSCoder) {
    super.init(coder: coder)
    layoutCell()
  }
  
  private func layoutCell() {
    contentView.addSubview(stackView)
    
    allLabels.forEach {
      stackView.addArrangedSubview($0)
    }
    
    stackView.snp.makeConstraints {
      $0.top.equalToSuperview().offset(4.0)
      $0.leading.equalToSuperview().offset(8.0)
      $0.bottom.equalToSuperview().offset(-4.0)
      $0.trailing.equalToSuperview().offset(-8.0)
    }
    
    stackView.addArrangedSubview(divider)
    divider.snp.makeConstraints {
      $0.height.equalTo(2)
    }
  }
  
  func configureCell(with news: ModelNews) {
    titleLabel.text = news.title
    summaryLabel.text = news.summary
    dateLabel.text = news.date
  }
  
}
