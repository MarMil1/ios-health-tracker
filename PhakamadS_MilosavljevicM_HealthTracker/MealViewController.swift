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
        
          // Do any additional setup after loading the view.
    }
    
    @IBAction func addMeal(_ sender: UIButton) {
        let alert = UIAlertController(title: "Add New Meal", message: nil, preferredStyle: .alert)
        alert.addTextField { (newMeal) in
            newMeal.placeholder = "Enter meal"
        }

        let cancel = UIAlertAction(title: "Cancel", style: .cancel, handler: { (action) -> Void in print("cancel")})

        let add = UIAlertAction(title: "Add", style: .destructive, handler: { (action) -> Void in print("add")})

        let actions: [UIAlertAction] = [cancel, add]
        for action in actions {
            alert.addAction(action)
        }
        present(alert, animated: true, completion: nil)
        
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
        mealTableView.tableFooterView = UIView(frame: .zero)
        mealTableView.backgroundColor = UIColor(red: 238/255, green: 238/255, blue: 238/255, alpha: 1.0)
        cell.layer.borderWidth = 6

        return cell
    }
    
    // delete table cell swipe to the left
    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        let deleteAction = UIContextualAction(style: .destructive, title: "Delete") { (action, view, handler) in
            //YOUR_CODE_HERE
            self.receivedMeals?.remove(at: indexPath.row)
            
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

            self.mealTableView.deleteRows(at: [indexPath], with: .fade)
            print("----- DONE: removed CELL")

        }
        deleteAction.backgroundColor = .red
        let configuration = UISwipeActionsConfiguration(actions: [deleteAction])
        configuration.performsFirstActionWithFullSwipe = false
        return configuration
    }
    
    
//     UITableViewAutomaticDimension calculates height of label contents/text
//    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
//        return UITableView.automaticDimension
//    }
    
    override func viewWillAppear(_ animated: Bool) {
        if let topic = receivedTopic {
            for (name, detail) in topic {
                print(name)
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
