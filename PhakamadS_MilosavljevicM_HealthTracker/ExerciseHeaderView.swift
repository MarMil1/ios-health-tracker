//
//  ExerciseHeaderView.swift
//  PhakamadS_MilosavljevicM_HealthTracker
//
//  Created by Bright Phakamad on 3/14/20.
//  Copyright © 2020 Marko Milosavljevic. All rights reserved.
//

import UIKit

class ExerciseHeaderView: UIView {

    
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
        let y: CGFloat = 50

        let myBezier = UIBezierPath()
        myBezier.move(to: CGPoint(x: 0, y: y))
        myBezier.addQuadCurve(to: CGPoint(x: rect.width, y: rect.height/2), controlPoint: CGPoint(x: rect.width / 2, y: 0))
        myBezier.addLine(to: CGPoint(x: rect.width, y: rect.height))
        myBezier.addLine(to: CGPoint(x: 0, y: rect.height))
        myBezier.close()
         let context = UIGraphicsGetCurrentContext()
        context!.setLineWidth(4.0)
        
//        UIColor.white.setFill()
        UIColor(red: 238/255, green: 238/255, blue: 238/255, alpha: 1.0).setFill()
         myBezier.fill()
    }

    

}
