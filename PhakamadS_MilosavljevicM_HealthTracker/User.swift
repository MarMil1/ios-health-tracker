//
//  User.swift
//  PhakamadS_MilosavljevicM_HealthTracker
//
//  Created by Marko Milosavljevic on 3/10/20.
//  Copyright © 2020 Marko Milosavljevic. All rights reserved.
//

import Foundation

class User {
    enum `Gender` : String {
        case male = "Male"
        case female = "Female"
    }
    
    var name : String
    var gender : Gender
    var age : Int
    var heightFeet: Int
    var heightInches: Int
    var weight: Int
    var goalWeight: Int
    var bmi: Double
    
    init(name: String, gender:Gender, age: Int, heightFeet: Int, heightInches: Int, weight: Int, goalWeight: Int, bmi: Double ) {
        self.name = name
        self.gender = gender
        self.age = age
        self.heightFeet = heightFeet
        self.heightInches = heightInches
        self.weight = weight
        self.goalWeight = goalWeight
        self.bmi = bmi
        
    }
}

let user1 = User(name: "John Doe", gender: .male, age: 25, heightFeet: 6, heightInches: 1, weight: 190, goalWeight: 200, bmi: 20.1)
