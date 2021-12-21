//
//  RepositListCell.swift
//  RxSwiftPractice
//
//  Created by miori Lee on 2021/12/21.
//

import UIKit
import SnapKit

class RepositListCell : UITableViewCell {
    var reposit : String?
    
    let nameLabel = UILabel()
    let descriptionLabel = UILabel()
    let startImageView = UIImageView()
    let starLabel = UILabel()
    let languageLabel = UILabel()
    
    override func layoutSubviews() {
        super.layoutSubviews()
        //map vs foreach
        [
            nameLabel,descriptionLabel,startImageView,starLabel,languageLabel
        ].forEach {
            contentView.addSubview($0)
        }
    }
    
}
