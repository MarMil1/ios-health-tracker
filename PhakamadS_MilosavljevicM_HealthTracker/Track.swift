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
    
    enum `image` : String {
        case baseball = "baseball.png"
        case basketball = "baseketball.png"
        case cycling = "cycling.png"
        case football = "football.png"
        case golf = "golf.png"
        case hiking = "hiking"
        case running = "running.png"
        case skiing = "skiing.png"
        case swimming = "swimming.png"
        case tennis = "tennis.png"
        case volleyball = "volleyball.png"
        case walking = "walking.png"
        case weightlifting = "eeightlifting.png"
        case yoga = "yoga.png"
    }
    
    var name: String
    var hours: Int
    var minutes: Int
    var calories: Int
    
    init() {
        self.name = ""
        self.hours = 0
        self.minutes = 0
        self.calories = 0
    }
    
    init(name: String, hours: Int, minutes: Int, calories: Int) {
        self.name = name
        self.hours = hours
        self.minutes = minutes
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

