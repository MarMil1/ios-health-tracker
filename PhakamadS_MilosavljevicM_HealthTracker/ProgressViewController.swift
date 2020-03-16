//
//  ProgressViewController.swift
//  PhakamadS_MilosavljevicM_HealthTracker
//
//  Created by Marko Milosavljevic on 3/2/20.
//  Copyright © 2020 Marko Milosavljevic. All rights reserved.
//

import UIKit

class ProgressViewController: UIViewController {
    var totalBreakfastCal = 0
    var totalLunchCal = 0
    var totalDinnerCal = 0
    var totalExerciseCal = 0
    var totalWater = 0
    
    @IBOutlet weak var breakfastOutlet: UILabel!
    @IBOutlet weak var lunchOutlet: UILabel!
    @IBOutlet weak var dinnerOutlet: UILabel!
    @IBOutlet weak var waterOutlet: UILabel!
    @IBOutlet weak var exerciseOutlet: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        totalBreakfastCal = self.getTotalMeals(breakfastMeals!)
        totalLunchCal = self.getTotalMeals(lunchMeals!)
        totalDinnerCal = self.getTotalMeals(dinnerMeals!)
        totalExerciseCal = self.getTotalExerise(exercises!)
        totalWater = self.getTotalWater(waterImagesId)
        
        self.displayResults()
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
       viewDidLoad()

    }
    
    func displayResults() {
        breakfastOutlet.text = String(totalBreakfastCal)
        lunchOutlet.text = String(totalLunchCal)
        dinnerOutlet.text = String(totalDinnerCal)
        exerciseOutlet.text = String(totalExerciseCal)
        waterOutlet.text = String(totalWater)
    }
    
    func getTotalMeals(_ meals : [Meal]) -> Int {
        var total = 0
        for meal in meals {
            total += meal.calories
        }
        return total
    }
    
    func getTotalExerise(_ exercises : [Exercise]) -> Int {
        var total = 0
        for exercise in exercises {
            total += exercise.calories
        }
        return total
    }
    
    func getTotalWater(_ glasses : [String]) -> Int {
        var total = 0
        for water in glasses {
            if water == "water-full" {
                total += 1
            }
        }
        return total
            
    }
        
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
