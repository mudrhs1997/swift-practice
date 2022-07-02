//
//  Stats.swift
//  MyTeamApp
//
//  Created by 정명곤 on 2022/06/15.
//

import Foundation

struct Stats: Codable {
    var team_id: Int
    var name: String
    var goals: Int
    var assists: Int
    var games: Int
    
}
