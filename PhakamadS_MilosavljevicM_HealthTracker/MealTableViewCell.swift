//
//  MealTableViewCell.swift
//  PhakamadS_MilosavljevicM_HealthTracker
//
//  Created by Bright Phakamad on 3/12/20.
//  Copyright © 2020 Marko Milosavljevic. All rights reserved.
//

import UIKit

class MealTableViewCell: UITableViewCell {
    
    @IBOutlet weak var mealLabel: UILabel!
    @IBOutlet weak var quantityLabel: UILabel!
    @IBOutlet weak var caloriesLabel: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
