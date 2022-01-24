//
//  RepositListCell.swift
//  RxSwiftPractice
//
//  Created by miori Lee on 2021/12/21.
//

import UIKit
import SnapKit

class RepositListCell : UITableViewCell {
    var reposit : RepositEntity?
    
    let nameLabel = UILabel()
    let descriptionLabel = UILabel()
    let startImageView = UIImageView()
    let starLabel = UILabel()
    let languageLabel = UILabel()
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        setUI()

    }
    
    private func setUI() {
        //map vs foreach
        [
            nameLabel,descriptionLabel,startImageView,starLabel,languageLabel
        ].forEach {
            contentView.addSubview($0)
        }
        // 옵셔널 처리
        guard let reposit = reposit else {
            return
        }
        nameLabel.text = reposit.name
        nameLabel.font = .systemFont(ofSize: 15, weight: .bold)
        
        descriptionLabel.text = reposit.description
        descriptionLabel.font = .systemFont(ofSize: 15)
        descriptionLabel.numberOfLines = 2
        
        startImageView.image = UIImage(systemName: "star")
        
        starLabel.text = "\(reposit.stargazersCount)"
        starLabel.font = .systemFont(ofSize: 16)
        starLabel.textColor = .gray
        
        languageLabel.text = reposit.language
        languageLabel.font = .systemFont(ofSize: 16)
        languageLabel.textColor = .gray
        
        makeConstraints()
    }
    
    private func makeConstraints() {
        nameLabel.snp.makeConstraints {
            $0.top.leading.trailing.equalToSuperview().inset(18)
        }
        descriptionLabel.snp.makeConstraints {
            $0.top.equalTo(nameLabel.snp.bottom).offset(3)
            $0.leading.trailing.equalTo(nameLabel)
        }
        startImageView.snp.makeConstraints {
            $0.top.equalTo(descriptionLabel.snp.bottom).offset(8)
            $0.leading.equalTo(descriptionLabel)
            $0.width.height.equalTo(20)
            $0.bottom.equalToSuperview().inset(18)
        }
        starLabel.snp.makeConstraints {
            $0.centerY.equalTo(startImageView)
            $0.leading.equalTo(startImageView.snp.trailing).offset(5)
        }
        languageLabel.snp.makeConstraints {
            $0.centerY.equalTo(starLabel)
            $0.leading.equalTo(starLabel.snp.trailing).offset(12)
        }
    }
    
}
