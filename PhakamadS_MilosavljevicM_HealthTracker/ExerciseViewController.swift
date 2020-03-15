//
//  ExerciseViewController.swift
//  PhakamadS_MilosavljevicM_HealthTracker
//
//  Created by Bright Phakamad on 3/11/20.
//  Copyright © 2020 Marko Milosavljevic. All rights reserved.
//

import UIKit

class ExerciseViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    var receivedTopic: [String : String]?
    var receivedExercises : [Exercise]?
    let cellReuseIdentifier = "cell"
    var editMode = false
    var indexToChild : Int?
    var defaultImages = ["sprint.png", "workout.png"]

    @IBOutlet weak var exerciseTableView: UITableView!
    @IBOutlet weak var topicDetail: UILabel!
    @IBOutlet weak var topicTitle: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        exerciseTableView.delegate = self
        exerciseTableView.dataSource = self
        exerciseTableView.rowHeight = UITableView.automaticDimension
        exerciseTableView.estimatedRowHeight = UITableView.automaticDimension
         
        exerciseTableView.tableFooterView = UIView(frame: .zero)
        exerciseTableView.backgroundColor = UIColor(red: 238/255, green: 238/255, blue: 238/255, alpha: 1.0)
        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
         if let topic = receivedTopic {
             for (name, detail) in topic {
                 topicTitle.text = name
                 topicDetail.text = detail
             }
            
         }
        print(receivedExercises!.count)

     }
     
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let exerciseChildView = segue.destination as? ExerciseChildViewController {
            
            if editMode {
                exerciseChildView.action = "Edit Exercise"
                exerciseChildView.finishButtonLabel = "Update"
                exerciseChildView.index = self.indexToChild!
                exerciseChildView.exercise = self.receivedExercises![self.indexToChild!]
                exerciseChildView.receivedExercises = self.receivedExercises
            } else {
                exerciseChildView.action = "Add New Exercise"
                exerciseChildView.finishButtonLabel = "Add"
                exerciseChildView.receivedExercises = receivedExercises
            }
        }
        
        self.editMode = false
     }
    
    func reloadCells() {
        print("Start reloading")
        if let exerciseTableView = exerciseTableView {
            print("reloading...")
            exerciseTableView.beginUpdates()
            exerciseTableView.reloadData()
            exerciseTableView.endUpdates()
        }

        print("End reloading")
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return receivedExercises!.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let exercise = receivedExercises?[indexPath.row]
        let cell : ExerciseTableViewCell = self.exerciseTableView.dequeueReusableCell(withIdentifier: cellReuseIdentifier) as! ExerciseTableViewCell
        cell.exerciseLabel.text = exercise!.name.capitalized as String
        cell.hoursLabel.text = String(exercise!.hours)
        cell.minutesLabel.text = String(exercise!.minutes)
        cell.caloriesLabel.text = String(exercise!.calories)
        cell.exerciseImageView.image = UIImage(named: exercise!.name.lowercased())
        if cell.exerciseImageView.image == nil {
            let randomImage = defaultImages.randomElement()!
            cell.exerciseImageView.image = UIImage(named: randomImage)
        }
        
        // add boderwidth and color
        cell.layer.borderColor = UIColor(red: 238/255, green: 238/255, blue: 238/255, alpha: 1.0).cgColor
        cell.layer.borderWidth = 6
        cell.clipsToBounds = true
        return cell
    }
    
    // delete table cell swipe to the left
    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        let deleteAction = UIContextualAction(style: .destructive, title: "Delete") { (action, view, handler) in
            self.receivedExercises?.remove(at: indexPath.row)
            self.updateMainExerciseList()
            self.exerciseTableView.deleteRows(at: [indexPath], with: .fade)
            print("----- DONE: removed CELL")
        }
        deleteAction.backgroundColor = .red
        deleteAction.image = UIImage(named: "trash.png")
        
        
        let editAction = UIContextualAction(style: .normal, title: "Edit") { (action, view, completion) in
            self.editMode = true
            self.editExercise(indexPath: indexPath)
            completion(true)
        }
        editAction.backgroundColor = .lightGray
        editAction.image = UIImage(named: "pencil.png")
        
        
        let configuration = UISwipeActionsConfiguration(actions: [editAction, deleteAction])
        configuration.performsFirstActionWithFullSwipe = false

        return configuration
    }
    
    func editExercise(indexPath: IndexPath) {
//        let storyBoard : UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
//        let exerciseChildView  = storyBoard.instantiateViewController(withIdentifier: "ExerciseChildViewController") as! ExerciseChildViewController
//        exerciseChildView.action = "Edit Exercise"
//        exerciseChildView.finishButtonLabel = "Update"
//        exerciseChildView.index = indexPath.row
//        exerciseChildView.exercise = self.receivedExercises![indexPath.row]
//        exerciseChildView.receivedExercises = self.receivedExercises
//        self.navigationController?.pushViewController(exerciseChildView, animated: true)
        self.indexToChild = indexPath.row
        self.performSegue(withIdentifier: "ExerciseSegue", sender: nil)
    }
    
    // update main exercise list in trackViewController
     func updateMainExerciseList() -> Void {
         exercises = self.receivedExercises!
     }

}
