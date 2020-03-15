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
        
        // add boderwidth and color
        cell.layer.borderColor = UIColor(red: 238/255, green: 238/255, blue: 238/255, alpha: 1.0).cgColor
        cell.layer.borderWidth = 6
        cell.clipsToBounds = true
        return cell
    }
    
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
