//
//  ExerciseChildViewController.swift
//  PhakamadS_MilosavljevicM_HealthTracker
//
//  Created by Bright Phakamad on 3/14/20.
//  Copyright © 2020 Marko Milosavljevic. All rights reserved.
//

import UIKit
let selectionOfexercises = ["Badminton", "Baseball", "Baseketball", "Cycling", "Football", "Golf", "Hiking", "Pullups", "Pushups", "Running", "Skiing", "Squats", "Swimming", "Tennis", "Volleyball", "Walking", "Weightlifting", "Yoga"]

class ExerciseChildViewController: UIViewController, UIPickerViewDataSource, UIPickerViewDelegate {
    
    var action : String?
    var finishButtonLabel : String?
    var exercise = Exercise()
    var index : Int?
    var receivedExercises : [Exercise]?
    var MET = 5.0
    
    @IBOutlet weak var actionLabel: UILabel!
    
    @IBOutlet weak var exerciseTextField: UITextField!
    @IBOutlet weak var hoursTextField: UITextField!
    @IBOutlet weak var minutesTextField: UITextField!
    @IBOutlet weak var caloriesTextField: UITextField!
    
    @IBOutlet var textFields: [UITextField]!
    
    @IBOutlet weak var finishButton: UIButton!
    @IBOutlet weak var selectExerciseLabel: UILabel!
    @IBOutlet weak var cancelButton: UIButton!
    @IBOutlet weak var doneButton: UIButton!
    @IBOutlet weak var exercisePicker: UIPickerView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        finishButton.backgroundColor = UIColor(red: 242/255, green: 242/255, blue: 242/255, alpha: 1.0)
        cancelButton.backgroundColor = UIColor(red: 242/255, green: 242/255, blue: 242/255, alpha: 1.0)
        doneButton.backgroundColor = UIColor(red: 242/255, green: 242/255, blue: 242/255, alpha: 1.0)
        selectExerciseLabel.isHidden = true
        cancelButton.isHidden = true
        doneButton.isHidden = true
        exercisePicker.isHidden = true
        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
//        super.viewWillAppear(animated)
        if let action = action {
            actionLabel.text = action
        }
        
        if let finishButtonLabel = finishButtonLabel {
            finishButton.setTitle(finishButtonLabel, for: .normal)
        }
        
//        if let exercise = exercise {
           exerciseTextField.text = exercise.name
           hoursTextField.text = String(exercise.hours)
           minutesTextField.text = String(exercise.minutes)
           caloriesTextField.text = String(exercise.calories)
//        }

     }
    
    // method from datasource
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    // methond from datasource
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return selectionOfexercises.count
    }
    
    // method fron delegatie
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int,
    forComponent component: Int)
    -> String? {
        return selectionOfexercises[row]
    }
    
    @IBAction func keyboardOpened(_ sender: UITextField) {
        selectExerciseLabel.isHidden = true
        cancelButton.isHidden = true
        doneButton.isHidden = true
        exercisePicker.isHidden = true
        
        print("keyOpened")
    }
    
    @IBAction func keyboardClosed(_ sender: UITextField) {
        print("keyClosed")
        sender.resignFirstResponder()
    }
    
    @IBAction func backgroundTouched(_ sender: UIControl) {
        for field in textFields {
            field.resignFirstResponder()
        }
    }
    
    @IBAction func intensityChanged(_ sender: UISegmentedControl) {
        let picked = sender.selectedSegmentIndex

        switch picked {
            case 0:
                MET = 3.0
                self.executeCalcualtion()
            case 1:
                MET = 5.0
                self.executeCalcualtion()
            case 2:
                MET = 7.0
                self.executeCalcualtion()
            default:
                break
         }
        
    }
    
    @IBAction func calculateButton(_ sender: UIButton) {
        self.executeCalcualtion()
    }
    
    @IBAction func selectExerciseButton(_ sender: UIButton) {
        selectExerciseLabel.isHidden = false
        cancelButton.isHidden = false
        doneButton.isHidden = false
        exercisePicker.isHidden = false
        
        for field in textFields {
            field.resignFirstResponder()
        }
        
        self.setIndexPicker(exercise)
    }
    
    @IBAction func cancelButton(_ sender: UIButton) {
        selectExerciseLabel.isHidden = true
        cancelButton.isHidden = true
        doneButton.isHidden = true
        exercisePicker.isHidden = true
    }
    
    @IBAction func doneButton(_ sender: UIButton) {
        selectExerciseLabel.isHidden = true
        cancelButton.isHidden = true
        doneButton.isHidden = true
        exercisePicker.isHidden = true
        let row = exercisePicker.selectedRow(inComponent: 0)
        exerciseTextField.text = selectionOfexercises[row]
    }
    
    @IBAction func finishButton(_ sender: UIButton) {
        
        if let exerciseView = presentingViewController?.children[1].children[1] as? ExerciseViewController {
            let okAction = UIAlertAction(title: "OK", style: .default, handler: nil)
            
            if exerciseTextField.text!.count > 20 {
                self.alertWarning(message: "\"Exercise name\" length can't be more than \"20\"", action: okAction)
                
            } else if caloriesTextField.text!.contains(".") {
                self.alertWarning(message: "\"Calories\" Only NUMBER. Cannot contain decimal", action: okAction)
                    
            } else if hoursTextField.text!.isNumber == false
                || minutesTextField.text!.isNumber == false
                || caloriesTextField.text!.isNumber == false {
                self.alertWarning(message: "\"Hours/Minutes/Calories\" must be NUMBER!", action: okAction)
            
            } else if exerciseTextField.text! == "" || hoursTextField.text! == "" || minutesTextField.text! == "" || caloriesTextField.text! == "" {
               self.alertWarning(message: "Must fill out all 4 fields.", action: okAction)
            
            } else {
                exercise.name = exerciseTextField.text!
                exercise.hours = Int(hoursTextField.text!)!
                exercise.minutes = Int(minutesTextField.text!)!
                exercise.calories = Int(caloriesTextField.text!)!
                
                if finishButtonLabel == "Update" {
                    if let index = self.index {
                        print("Update existed exercise")
                        self.updateToCell(exercise, index)
                        self.updateMainExerciseList()
                        exerciseView.receivedExercises = self.receivedExercises
                        exerciseView.exerciseTableView.reloadData()
                    }
                } else if finishButtonLabel == "Add" {
                    print("Add new exercise")
                    self.addToCell(exercise)
                    self.updateMainExerciseList()
                    exerciseView.receivedExercises = self.receivedExercises
                    exerciseView.exerciseTableView.reloadData()
                }
                
                dismiss(animated: true, completion: nil)
            }
        }
    }
        
    func addToCell(_ newExercise: Exercise) -> Void {
        let index = 0
        self.receivedExercises?.insert(newExercise, at: index)
    }
    
    func updateToCell(_ newExercise: Exercise, _ index : Int) -> Void {
        self.receivedExercises![index] = newExercise
    }
    
    func alertWarning(message : String, action : UIAlertAction) -> Void {
        let alert = UIAlertController(title: "Warning", message: message, preferredStyle: .actionSheet)
        alert.addAction(action)
        self.present(alert, animated: true, completion: nil)
    }
    
    // update main exercise list in trackViewController
    func updateMainExerciseList() -> Void {
        exercises = self.receivedExercises!
    }
    
    func setIndexPicker(_ exercise : Exercise) {
        var index = 0
            for i in 0..<selectionOfexercises.count  {
                if selectionOfexercises[i].lowercased() == exercise.name.lowercased() {
                    index = i
                }
            }
            exercisePicker.selectRow(index, inComponent: 0, animated: true)
    }
    
    func calculateCals(_ pounds : Int, _ hrs : Int, _ mins : Int) {
        // Total calories burned = Duration (in minutes)*(MET*3.5*weight in kg)/200
        let duration = (hrs * 60) + mins
        let weight = Double(pounds) / 2.2
        var calBurned = Double(duration) * ( (MET * 0.0175) * weight)
        calBurned = calBurned.rounded()
        caloriesTextField.text = String(format: "%.0f", calBurned)
    }
    
    func executeCalcualtion() {
        if isValid() {
            if let home = presentingViewController?.children[0] as? HomeViewController {
                let pounds = home.user.weight
                self.calculateCals(pounds, Int(hoursTextField.text!)!, Int(minutesTextField.text!)!)
            }
            
        } else {
            let okAction = UIAlertAction(title: "OK", style: .default, handler: nil)
            self.alertWarning(message: "Please check if inputs are valid and not blank", action: okAction)
        }
    }
    
    func isValid() -> Bool {
        
        if exerciseTextField.text!.count > 20 || exerciseTextField.text! == "" {
            return false
        
        } else if hoursTextField.text!.isNumber == false
            || minutesTextField.text!.isNumber == false {
            return false
     
        } else if exerciseTextField.text! == "" || hoursTextField.text! == "" || minutesTextField.text! == "" {
            return false
            
        } else {
            return true
        }
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
