//
//  MealsViewController.swift
//  PhakamadS_MilosavljevicM_HealthTracker
//
//  Created by Bright Phakamad on 3/9/20.
//  Copyright © 2020 Marko Milosavljevic. All rights reserved.
//

import UIKit

class MealViewController: UIViewController {
    var receivedTopic: [String : String]?

    @IBOutlet weak var topicDetail: UILabel!
    @IBOutlet weak var topicTitle: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
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
