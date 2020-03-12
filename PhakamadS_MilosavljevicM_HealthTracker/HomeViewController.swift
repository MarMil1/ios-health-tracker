//
//  FirstViewController.swift
//  PhakamadS_MilosavljevicM_HealthTracker
//
//  Created by Marko Milosavljevic on 3/2/20.
//  Copyright © 2020 Marko Milosavljevic. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController {

    var user: User?
    
    @IBOutlet weak var nameOutlet: UILabel!
    @IBOutlet weak var genderOutlet: UILabel!
    @IBOutlet weak var ageOutlet: UILabel!
    @IBOutlet weak var heightOutlet: UILabel!
    @IBOutlet weak var weightOutlet: UILabel!
    @IBOutlet weak var bmiOutlet: UILabel!
    @IBOutlet weak var goalWeightOutlet: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
//        nameOutlet.text! = user?.name ?? "John Smith"
//        genderOutlet.text! = (user?.gender).map { $0.rawValue }  ?? "Male"
        
        if let userInfo = user {
            displayUserInfo(userInfo: userInfo)
        } else {
            user = user1
            displayUserInfo(userInfo: user!)
        }
    }
    
    // to display user info on home page
    func displayUserInfo(userInfo: User) {
        nameOutlet.text = userInfo.name
        genderOutlet.text = userInfo.gender.rawValue
        ageOutlet.text = String(userInfo.age)
        heightOutlet.text = "\(String(userInfo.heightFeet))' \(String(userInfo.heightInches))"
        bmiOutlet.text = String(userInfo.bmi)
        goalWeightOutlet.text = String(userInfo.goalWeight)
        
    }
    
    


}

