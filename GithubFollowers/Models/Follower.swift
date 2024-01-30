//
//  Follower.swift
//  GithubFollowers
//
//  Created by Neddy Ksenia Gonzalez Siles on 11/1/24.
//

import Foundation

struct Follower: Codable, Hashable {
    var login: String
    var avatarUrl: String
}

// In case you only wanted to make Hashable one variable, you would have something like this:
//struct Follower: Codable, Hashable {
//    var login: String
//    var avatarUrl: String
//
//    func hash(into hasher: inout Hasher) {
//        hasher.combine(login)
//    }
//}
