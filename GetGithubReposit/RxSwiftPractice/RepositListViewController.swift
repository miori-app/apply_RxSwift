//
//  RepositListViewController.swift
//  RxSwiftPractice
//
//  Created by miori Lee on 2021/12/21.
//

import UIKit

class RepositListViewController : UITableViewController {
    private let organization = "miori"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // navigation title
        title = organization + "Reposit"
        
        // 당겨서 새로고침
        self.refreshControl = UIRefreshControl()
        let refreshControl = self.refreshControl!
        refreshControl.backgroundColor = .white
        refreshControl.tintColor = .darkGray
        refreshControl.attributedTitle = NSAttributedString(string: "당겨서 새로고침")
        refreshControl.addTarget(self, action: #selector(refreshTable), for: .valueChanged)
        
        tableView.register(RepositListCell.self, forCellReuseIdentifier: "RepositListCell")
        tableView.rowHeight = 140
    }
    
    @objc func refreshTable() {
        
    }
    
}

//UITableView DataSource Delegate
extension RepositListViewController {
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 0
    }
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "RepositListCell", for: indexPath) as? RepositListCell else { return UITableViewCell()}
        
        return cell
    }
}
