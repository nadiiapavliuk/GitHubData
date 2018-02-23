//
//  RepositoryStructure.swift
//  GitHubAccess
//
//  Created by Nadiia Pavliuk on 2/21/18.
//  Copyright © 2018 Nadiia Pavliuk. All rights reserved.
//

import Foundation


struct RepositoryStructure: Decodable {
    let name: String
    let description: String?
    let html_url: URL!
    let forks: Int
    let watchers: Int
    let contributors_url: URL!
    let tags_url: URL!
    
}

//struct RepositoryDetails: Decodable {
//    let login: String
//}

