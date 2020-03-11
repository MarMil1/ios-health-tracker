//
//  TrackHeaderView.swift
//  PhakamadS_MilosavljevicM_HealthTracker
//
//  Created by Bright Phakamad on 3/10/20.
//  Copyright © 2020 Marko Milosavljevic. All rights reserved.
//

import UIKit

class TrackHeaderView: UIView {

    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
        //        if let context = UIGraphicsGetCurrentContext() {
        //            context.setStrokeColor(UIColor.white.cgColor)
        //            context.setLineWidth(2)
        //            context.move(to: CGPoint(x: 0, y: self.frame.size.height))
        //            context.addCurve(to: CGPoint(x: self.frame.size.width, y: self.frame.size.height / 2),
        //                             control1: CGPoint(x: self.frame.size.width / 2, y: self.frame.size.height - 20),
        //                                 control2: CGPoint(x: self.frame.size.width / 2, y: 100))
        //            context.setFillColor(UIColor.white.cgColor)
        //            context.strokePath()
        //
        //        }
        if let context = UIGraphicsGetCurrentContext() {
             context.setStrokeColor(UIColor.white.cgColor)
             context.setLineWidth(100)
             context.move(to: CGPoint(x: 0, y: self.frame.size.height ))
             context.addCurve(to: CGPoint(x: self.frame.size.width, y: self.frame.size.height / 2),
                              control1: CGPoint(x: self.frame.size.width / 0.8, y: self.frame.size.height - 50),
                              control2: CGPoint(x: self.frame.size.width / 0.6, y: 100))
             context.setFillColor(UIColor.white.cgColor)
             context.strokePath()
         
         }
    }

}
