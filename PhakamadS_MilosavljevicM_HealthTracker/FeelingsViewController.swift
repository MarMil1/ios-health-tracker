//
//  FeelingsViewController.swift
//  PhakamadS_MilosavljevicM_HealthTracker
//
//  Created by Marko Milosavljevic on 3/2/20.
//  Copyright © 2020 Marko Milosavljevic. All rights reserved.
//

import UIKit

class FeelingsViewController: UIViewController {

    
    @IBOutlet weak var feelingAwesome: UIButton!
    @IBOutlet weak var feelingGood: UIButton!
    @IBOutlet weak var feelingGreat: UIButton!
    @IBOutlet weak var feelingFunky: UIButton!
    @IBOutlet weak var feelingFine: UIButton!
    @IBOutlet weak var feelingYucky: UIButton!
    @IBOutlet weak var feelingDisplay: UILabel!
    @IBOutlet weak var targetBox: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.feelingAwesome.addGestureRecognizer(UIPanGestureRecognizer(target: self, action: #selector(self.panGestureHandler(panGesture:))))
        
        self.feelingGood.addGestureRecognizer(UIPanGestureRecognizer(target: self, action: #selector(self.panGestureHandler(panGesture2:))))
        
        self.feelingGreat.addGestureRecognizer(UIPanGestureRecognizer(target: self, action: #selector(self.panGestureHandler(panGesture3:))))
        
        self.feelingFunky.addGestureRecognizer(UIPanGestureRecognizer(target: self, action: #selector(self.panGestureHandler(panGesture4:))))
        
        self.feelingFine.addGestureRecognizer(UIPanGestureRecognizer(target: self, action: #selector(self.panGestureHandler(panGesture5:))))
        
        self.feelingYucky.addGestureRecognizer(UIPanGestureRecognizer(target: self, action: #selector(self.panGestureHandler(panGesture6:))))

        // Do any additional setup after loading the view.
    }
    
    @IBAction func feelingAwesomeButton(_ sender: UIButton) {
        feelingDisplay.text = "FEELING AWESOME!"
        feelingDisplay.textColor = UIColor.systemBlue
    }
    
    @objc func panGestureHandler(panGesture moveButton: UIPanGestureRecognizer) {

        let location = moveButton.location(in: view)
        feelingAwesome.center = location

    }
    
    @IBAction func feelingGoodButton(_ sender: UIButton) {
        feelingDisplay.text = "FEELING GOOD!"
        feelingDisplay.textColor = UIColor.systemBlue
    }
    
    @objc func panGestureHandler(panGesture2 moveButton: UIPanGestureRecognizer) {

        let location = moveButton.location(in: view)
        feelingGood.center = location

    }
    
    @IBAction func feelingGreatButton(_ sender: UIButton) {
        feelingDisplay.text = "FEELING GREAT!"
        feelingDisplay.textColor = UIColor.systemBlue
    }
    
    @objc func panGestureHandler(panGesture3 moveButton: UIPanGestureRecognizer) {

        let location = moveButton.location(in: view)
        feelingGreat.center = location

    }
    
    @IBAction func feelingFunkyButton(_ sender: UIButton) {
        feelingDisplay.text = "FEELING FUNKY!"
        feelingDisplay.textColor = UIColor.systemBlue
    }
    
    @objc func panGestureHandler(panGesture4 moveButton: UIPanGestureRecognizer) {

        let location = moveButton.location(in: view)
        feelingFunky.center = location

    }
    
    @IBAction func feelingFineButton(_ sender: UIButton) {
        feelingDisplay.text = "FEELING FINE!"
        feelingDisplay.textColor = UIColor.systemBlue
    }
    
    @objc func panGestureHandler(panGesture5 moveButton: UIPanGestureRecognizer) {

        let location = moveButton.location(in: view)
        feelingFine.center = location

    }
    
    @IBAction func feelingYuckyButton(_ sender: UIButton) {
        feelingDisplay.text = "FEELING YUCKY!"
        feelingDisplay.textColor = UIColor.systemBlue
    }
    
    @objc func panGestureHandler(panGesture6 moveButton: UIPanGestureRecognizer) {

        let location = moveButton.location(in: view)
        feelingYucky.center = location

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
