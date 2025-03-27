//
//  MissionDetails.swift
//  Kaisen
//
//  Created by Davaughn Williams on 3/26/25.
//

import Foundation

struct MissionDetail: Identifiable {
    var id = UUID()
    var title: String
    var description: String
    
}

let missions: [MissionDetail] = [
    MissionDetail(title: "New Mission", description: "Your mission is to summon the mentors! – Share your project with two people to unlock wisdom from the sages."),
    MissionDetail(title: "Your mission is to forge your first blade", description: "Create a small 3D model as your first artifact."),
    MissionDetail(title: "Your mission is to decipher the Code Review Scrolls.", description: "Share your code with a fellow hacker to gain insight and wisdom."),
    MissionDetail(title: "Your mission is to defeat the Debug Demon!Find and fix one bug to cleanse the code realm", description: """
                 python
                 
                 def divide_numners(a,b)"
                 return a/ b
                 
                 print(divide_numbers(10.0))# Uh oh, what's wrong here?
                 """),
    MissionDetail(title: "Your mission is to master the art of style shift jutsu!", description: "Recreate a 3D asset in three different artistic styles."),
    MissionDetail(title: "Your mission is to make a grand announcement!", description: "Post a progress update on LinkedIn and let the world witness your evolution."),
    
]


