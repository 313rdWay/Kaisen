//
//  ChallengesViewModel.swift
//  Kaisen
//
//  Created by Davaughn Williams on 4/1/25.
//

import SwiftUI



class ChallengesViewModel: ObservableObject {
    @Published var challenges: [Challenge] = [] {
        didSet { saveChallenges() }
    }
    
    init() {
        loadChallenges()
    }
    
    func addChallenges(title: String, description: String, checkpoints: [String], resources: [String]) {
        let newChallenge = Challenge(title: title, description: description, checkpoints: checkpoints, resources: resources)
        challenges.append(newChallenge)
    }
    
    private func saveChallenges() {
        if let encoded = try? JSONEncoder().encode(challenges) {
            UserDefaults.standard.set(encoded, forKey: "challenges")
        }
    }
    
    private func loadChallenges() {
        if let savedData = UserDefaults.standard.data(forKey: "challenges"),
           let decoded = try? JSONDecoder().decode([Challenge].self, from: savedData) {
            challenges = decoded
        }
    }
}
