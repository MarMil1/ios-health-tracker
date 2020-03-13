//
//  MealsViewController.swift
//  PhakamadS_MilosavljevicM_HealthTracker
//
//  Created by Bright Phakamad on 3/9/20.
//  Copyright © 2020 Marko Milosavljevic. All rights reserved.
//

import UIKit

class MealViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    var receivedTopic: [String : String]?
    var receivedMeals: [Meal]?
    let cellReuseIdentifier = "mealCell"
    
    @IBOutlet weak var mealTableView: UITableView!
    
    @IBOutlet weak var topicDetail: UILabel!
    @IBOutlet weak var topicTitle: UILabel!
      
    override func viewDidLoad() {
        super.viewDidLoad()
        mealTableView.delegate = self
        mealTableView.dataSource = self
        mealTableView.rowHeight = UITableView.automaticDimension
        mealTableView.estimatedRowHeight = UITableView.automaticDimension
        
        mealTableView.tableFooterView = UIView(frame: .zero)
        mealTableView.backgroundColor = UIColor(red: 238/255, green: 238/255, blue: 238/255, alpha: 1.0)
        
          // Do any additional setup after loading the view.
    }
    
    @IBAction func addMeal(_ sender: UIButton) {
        let alert = UIAlertController(title: "Add New Meal", message: nil, preferredStyle: .alert)
        
        // food
        alert.addTextField { (text) in
            text.placeholder = "Enter food -> ex. waffles"
            text.font = UIFont(name: "Kohinoor Bangla", size: 14)
        }
        
        // quantity
        alert.addTextField{(text) in
            text.placeholder = "Enter quantity -> ex. 2 "
            text.keyboardType = .numberPad
            text.font = UIFont(name: "Kohinoor Bangla", size: 14)
        }
        
        // calories
        alert.addTextField{(text) in
            text.placeholder = "Enter calroies -> ex. 640"
            text.keyboardType = .numberPad
            text.font = UIFont(name: "Kohinoor Bangla", size: 14)
        }

        let cancel = UIAlertAction(title: "Cancel", style: .cancel, handler: { (action) -> Void in print("cancel")})

        let add = UIAlertAction(title: "Add", style: .destructive) { (_) -> Void in
            let food = alert.textFields![0].text!
            let amount = Int(alert.textFields![1].text!)!
            let calories = Int(alert.textFields![2].text!)!
            let mealType = self.getMealType()
            let newMeal = Meal(food: food, mealType: mealType, amount: amount, calories: calories)
            self.addToCell(newMeal)
            self.updateMainMealsList()
            
        }

        let actions: [UIAlertAction] = [cancel, add]
        for action in actions {
            alert.addAction(action)
        }
        present(alert, animated: true, completion: nil)
        
    }
    
    func addToCell(_ newMeal: Meal) -> Void {
        let index = 0
        self.receivedMeals?.insert(newMeal, at: index)

        let indexPath = IndexPath(row: index, section: 0)
        self.mealTableView.insertRows(at: [indexPath], with: .left
        )
    }
        
    
    
    // number of rows in table view
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return receivedMeals!.count
        
    }
    
    // create a cell for each table view row
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let meal = receivedMeals?[indexPath.row]
        let cell : MealTableViewCell = self.mealTableView.dequeueReusableCell(withIdentifier: cellReuseIdentifier) as! MealTableViewCell
        cell.mealLabel.text = meal!.food.capitalized as String
        cell.quantityLabel.text = String(meal!.amount)
        cell.caloriesLabel.text = String(meal!.calories)
        
        // add boderwidth and color
        cell.layer.borderColor = UIColor(red: 238/255, green: 238/255, blue: 238/255, alpha: 1.0).cgColor
        cell.layer.borderWidth = 6
        cell.clipsToBounds = true
        return cell
    }
    
    // delete table cell swipe to the left
    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        let deleteAction = UIContextualAction(style: .destructive, title: "Delete") { (action, view, handler) in
            self.receivedMeals?.remove(at: indexPath.row)
            self.updateMainMealsList()
            self.mealTableView.deleteRows(at: [indexPath], with: .fade)
            print("----- DONE: removed CELL")
        }
        deleteAction.backgroundColor = .red
        let configuration = UISwipeActionsConfiguration(actions: [deleteAction])
        configuration.performsFirstActionWithFullSwipe = false
        return configuration
    }
    
    // update main meals list in mealViewController
    func updateMainMealsList() -> Void {
        switch self.topicTitle.text {
            case "Breakfast" :
                breakfastMeals = self.receivedMeals!
            case "Lunch" :
                lunchMeals = self.receivedMeals!
            case "Dinner" :
                dinnerMeals = self.receivedMeals!
            case .none:
                print("none")
            case .some(_):
                print("some")
        }
    }
    
    // update main meals list in mealViewController
    func getMealType() -> Meal.MealType {
        var type = Meal.MealType(rawValue: "Breakfast")
        
        switch self.topicTitle.text {
            case "Breakfast" :
                type = Meal.MealType(rawValue: "Breakfast")
            case "Lunch" :
                type = Meal.MealType(rawValue: "Lunch")
            case "Dinner" :
               type = Meal.MealType(rawValue: "Dinner")
            default:
                print("default")
        }
        
        return type!
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        if let topic = receivedTopic {
            for (name, detail) in topic {
                // print(name)
                topicTitle.text = name
                topicDetail.text = detail
            }
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
