//
//  Follower.swift
//  GitHub Followers
//
//  Created by Tomi Antoljak on 12/6/22.
//
// Codable = protocol that allows us to convert JSON data into structs

import Foundation

struct Follower: Codable, Hashable {
    
    var login: String
    
    var avatarUrl: String
    
}
