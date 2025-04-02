//
//  ChallengeModel.swift
//  Kaisen
//
//  Created by Davaughn Williams on 3/27/25.
//

import Foundation

struct Challenge: Identifiable, Codable {
    var id = UUID()
    var title: String
    var description: String
    var checkpoints: [String]
    var resources: [String]
}
