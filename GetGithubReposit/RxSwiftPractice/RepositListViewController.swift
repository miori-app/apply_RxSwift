//
//  RepositListViewController.swift
//  RxSwiftPractice
//
//  Created by miori Lee on 2021/12/21.
//

import UIKit
import RxSwift
import RxCocoa

class RepositListViewController : UITableViewController {
    private let organization = "miori-app"
    //네트워크 통신후 디코딩 된채로 넘어오는 내용
    private let repositories = BehaviorSubject<[RepositEntity]>(value: [])
    // 여러 개의 Disposable을 관리할 수 있는 도구가 바로 DisposeBag
    private let disposeBag = DisposeBag()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // navigation title
        title = organization + " Reposit"
        
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
        DispatchQueue.global(qos: .background).async { [weak self] in
            guard let self = self else {return}
            self.fetechRepositories(of: self.organization)
        }
    }
    
    func fetechRepositories(of organization: String) {
        //from 은 array 만 받을 수 있음
        Observable.from([organization])
            .map { organization -> URL in
                // map 오퍼레이션 활용해 string 들어오면 url 로 바꿔줘
                // Observerble에 의해 방출되는 아이템들에 대해 각각 함수를 적용하여 변환
                return URL(string: "https://api.github.com/orgs/\(organization)/repos")!
            }
            .map { url -> URLRequest in
                var request = URLRequest(url: url)
                request.httpMethod = "GET"
                return request
            }
            .flatMap { request -> Observable<(response: HTTPURLResponse, data: Data)> in
                //기본적인 인자 rx로 변환해주는 코드
                /***
                 - response 는 url request 받아서 observalbe 시퀀스로 반환
                 ***/
                return URLSession.shared.rx.response(request: request)
            }
            .filter { responds, _ in
                return 200..<300 ~= responds.statusCode
            }
            .map { _, data -> [[String:Any]] in
                guard let json = try? JSONSerialization.jsonObject(with: data, options: []),
                      let result = json as? [[String:Any]] else {
                          return []
                      }
                //print("dd :\(result)")
                return result
            }
            .filter { objects in
                return objects.count > 0
            }
            .map { objects in
                // compactMap : nil알아서 제거
                return objects.compactMap { dic -> RepositEntity? in
                    guard let id = dic["id"] as? Int,
                          let name = dic["name"] as? String,
                          let description = dic["description"] as? String,
                          let stargazersCount = dic["stargazers_count"] as? Int,
                          let language = dic["language"] as? String else {
                        return nil
                          }
                    return RepositEntity(id: id, name: name, description: description, stargazersCount: stargazersCount, language: language)
                }
            }
            //onNext : 데이터가 발생했을때
            .subscribe(onNext: { [weak self] newReposit in
                print("new : \(newReposit)")
                self?.repositories.onNext(newReposit)
                
                DispatchQueue.main.async {
                    self?.tableView.reloadData()
                    self?.refreshControl?.endRefreshing()
                }
            })
            .disposed(by: disposeBag)
            
    }
    
}

//UITableView DataSource Delegate
extension RepositListViewController {
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        do {
            return try repositories.value().count
        } catch {
            return 0
        }
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "RepositListCell", for: indexPath) as? RepositListCell else { return UITableViewCell()}
        
        var currentRepo : RepositEntity? {
            do {
                return try repositories.value()[indexPath.row]
            } catch {
                return nil
            }
        }
        
        cell.reposit = currentRepo
        return cell
    }
}
