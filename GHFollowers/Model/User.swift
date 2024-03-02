//
//  User.swift
//  GHFollowers
//
//  Created by Matias Martinelli on 02/03/2024.
//

import Foundation

struct User: Codable {
    var login: String
    var avatarURl: String
    var name: String?
    var location: String?
    var public_repos: Int
    var public_gists: Int
    var htmlUrl: String
    var followers: Int
    var following: Int
    var createdAt: String
}
