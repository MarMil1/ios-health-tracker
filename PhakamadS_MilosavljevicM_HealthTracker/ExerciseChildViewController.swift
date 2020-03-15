//
//  ExerciseChildViewController.swift
//  PhakamadS_MilosavljevicM_HealthTracker
//
//  Created by Bright Phakamad on 3/14/20.
//  Copyright © 2020 Marko Milosavljevic. All rights reserved.
//

import UIKit
let exerciseList = ["Baseball", "Baseketball", "Cycling", "Football", "Golf", "Hiking", "Running", "Skiing", "Swimming", "Tennis", "Volleyball", "Walking", "Weightlifting", "Yoga"]

class ExerciseChildViewController: UIViewController, UIPickerViewDataSource, UIPickerViewDelegate {
    @IBOutlet weak var exerciseTextField: UITextField!
    @IBOutlet weak var hoursTextField: UITextField!
    @IBOutlet weak var minutesTextField: UITextField!
    
    @IBOutlet weak var exercisePicker: UIPickerView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("ExerciseChildViewController")
        // Do any additional setup after loading the view.
    }
    
    // method from datasource
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    // methond from datasource
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return exerciseList.count
    }
    
    // method fron delegatie
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int,
    forComponent component: Int)
    -> String? {
        return exerciseList[row]
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
