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
    let language: String?
    let created_at: String?
    let updated_at: String?
    let pushed_at: String?

}

