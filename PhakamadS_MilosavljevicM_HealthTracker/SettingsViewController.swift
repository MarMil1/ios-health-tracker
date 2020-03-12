//
//  SettingsViewController.swift
//  PhakamadS_MilosavljevicM_HealthTracker
//
//  Created by Marko Milosavljevic on 3/8/20.
//  Copyright © 2020 Marko Milosavljevic. All rights reserved.
//

import UIKit

let ages = ["1", "2", "3", "4", "5",
            "6", "7", "8", "9", "10",
            "11", "12", "13", "14", "15",
            "16", "17", "18", "19", "20",
            "21", "22", "23", "24", "25",
            "26", "27", "28", "29", "30",
            "31", "32", "33", "34", "35",
            "36", "37", "38", "39", "40",
            "41", "42", "43", "44", "45",
            "46", "47", "48", "49", "50",
            "51", "51", "52", "53", "54",
            "55", "56", "57", "58", "59",
            "60", "61", "62", "63", "64",
            "65", "66", "67", "68", "69",
            "70", "71", "72", "73", "74",
            "75", "76", "77", "78", "79",
            "80", "81", "82", "83", "84",
            "85", "86", "87", "88", "89",
            "90", "91", "92", "93", "94",
            "95", "96", "97", "98", "99",
            "100"]


class SettingsViewController: UIViewController, UIPickerViewDataSource, UIPickerViewDelegate {
    
    
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return ages.count
    }
    
     func pickerView(_ pickerView: UIPickerView, titleForRow row: Int,
    forComponent component: Int)
    -> String? { return ages[row]
    }
    
    
    var user: User?
    
    @IBOutlet var textFields: [UITextField]!
    @IBOutlet weak var genderOutlet: UISegmentedControl!
    @IBOutlet weak var inchesOutlet: UITextField!
    @IBOutlet weak var feetOutlet: UITextField!
    
    @IBOutlet weak var weightOutlet: UITextField!
    @IBOutlet weak var goalWeightOutlet: UITextField!
    @IBOutlet weak var bmiResult: UILabel!
    
    
    
        override func viewDidLoad() {        super.viewDidLoad()
        // Do any additional setup after loading the view.
            
    }
    
    
    @IBAction func backToHomeButto(_ sender: UIBarButtonItem) {
     //   dismiss(animated: true, completion: nil)
        let actionSheetController = UIAlertController(title: "WARNING", message:"No changes will be saved", preferredStyle: .actionSheet)
        let cancelAction =
            UIAlertAction(title: "Stay",
                style: .cancel,
                handler: nil)
        let okayAction =
            UIAlertAction(title: "Switch back to home",
                style: .default) {
                    _ in self.dismiss(animated: true, completion: nil)
                }
        
        actionSheetController.addAction(okayAction)
        actionSheetController.addAction(cancelAction)
        present(actionSheetController, animated: true, completion: nil)
        
    }
    
    @IBAction func nameInput(_ sender: UITextField) {
        print(sender.text!)
        user?.name = sender.text!
    }
    
    
    @IBAction func genderAction(_ sender: UISegmentedControl) {
        print(sender.selectedSegmentIndex)
        switch sender.selectedSegmentIndex {
        case 0:
            user?.gender = .male
        case 1:
            user?.gender = .female
            print(user?.gender.rawValue as Any)
        default:
            break
        }
    }
    
//    @IBAction func feetInput(_ sender: UITextField) {
//        let feet = feetAndInchesOutlet[0].text!
//
//        let cancelAction = UIAlertAction(title: "OK", style: .cancel, handler: nil)
//
//        if (Int(feet) == nil) {
//        let alert = UIAlertController(title: "Wrong input",
//        message: "Feet must be a number.",
//        preferredStyle: .alert)
//        alert.addAction(cancelAction)
//        present(alert, animated: true, completion: nil)
//        }
//    }
    
    @IBAction func inchesInput(_ sender: UITextField) {
        let inches = inchesOutlet.text!

        let cancelAction = UIAlertAction(title: "OK", style: .cancel, handler: nil)

        if (Double(inches) == nil) {
        let alert = UIAlertController(title: "Wrong input",
        message: "Inches must be a number.",
        preferredStyle: .alert)
        alert.addAction(cancelAction)
        present(alert, animated: true, completion: nil)
        }
    }
    
    
    @IBAction func weightInput(_ sender: UITextField) {
        let weight = weightOutlet.text!

        let cancelAction = UIAlertAction(title: "OK", style: .cancel, handler: nil)

        if (Double(weight) == nil) {
        let alert = UIAlertController(title: "Wrong input",
        message: "Weight must be a number.",
        preferredStyle: .alert)
        alert.addAction(cancelAction)
        present(alert, animated: true, completion: nil)
        }
    }
    
    @IBAction func goalWeightInput(_ sender: UITextField) {
        let goalWeight = goalWeightOutlet.text!

        let cancelAction = UIAlertAction(title: "OK", style: .cancel, handler: nil)

        if (Double(goalWeight) == nil) {
        let alert = UIAlertController(title: "Wrong input",
        message: "Goal weight must be a number.",
        preferredStyle: .alert)
        alert.addAction(cancelAction)
        present(alert, animated: true, completion: nil)
        }
    }
    
    @IBAction func backgroundTouched(_ sender: UIControl) {
        
        for txtField in textFields {
            txtField.resignFirstResponder()
        }
    }
    
    @IBAction func calculateBmi(_ sender: UIButton) {
        var result: Double = Double(bmiResult.text!)!
        let weight: Double = Double(weightOutlet.text!)!
        let feet: Double = Double(feetOutlet.text!)!
        var height: Double = Double(inchesOutlet.text!)!
        
        height = (feet * 12) + height
        print("This is height with feet and inches: \(height)")
        
        result = 703 * (weight / (height * height))
        bmiResult.text! = String(format: "%.1f", result)
        
        
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
