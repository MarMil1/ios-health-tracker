//
//  Track.swift
//  PhakamadS_MilosavljevicM_HealthTracker
//
//  Created by Bright Phakamad on 3/10/20.
//  Copyright © 2020 Marko Milosavljevic. All rights reserved.
//

import Foundation

class Track {
    enum `TrackType` : String {
        case breakfast = "Breakfast"
        case lunch = "Lunch"
        case dinner = "Dinner"
        case water = "Water"
        case exercise = "Exercise"
    }
}

class Meal {
    enum `MealType` : String {
        case breakfast = "Breakfast"
        case lunch = "Lunch"
        case dinner = "Dinner"
    }
    
    var food: String
    var mealType: MealType
    var amount: Int
    var calories: Int
    
    init(food: String, mealType: MealType, amount: Int, calories: Int) {
        self.food = food
        self.mealType = mealType
        self.amount = amount
        self.calories = calories
    }
    
}

class Water {
    var glass: Int
    var type = "water"
    
    init(glass: Int) {
        self.glass = glass
    }
}

class Exercise {
    var exercise: String
    var hours: Int
    var calories: Int
    var type = "execise"
    
    init(exercise: String, hours: Int, calories: Int) {
        self.exercise = exercise
        self.hours = hours
        self.calories = calories
    }
}

let topics: [String] = [
    "People who eat breakfast as their largest meal lost 17.8 pounds in 3 months!",
    "One fast food burger can have meat from 100 different cows.",
    "Do you know that ketchup used to be used as a medicine?",
    "Up to 60% of the human adult body is water so let's not get dehydrated!",
    "Fun fact: More muscle mass = burning more fat while resting!"
]

