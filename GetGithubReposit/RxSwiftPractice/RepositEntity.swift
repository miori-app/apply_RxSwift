//
//  RepositEntity.swift
//  RxSwiftPractice
//
//  Created by miori Lee on 2021/12/22.
//

import Foundation

struct RepositEntity : Decodable {
    let id : Int
    let name : String
    let description : String
    let stargazersCount : Int
    let language : String
    
    // snake -> camel
    enum CodingKeys : String, CodingKey {
        case id, name, description, language
        case stargazersCount = "stargazers_count"
    }

}
