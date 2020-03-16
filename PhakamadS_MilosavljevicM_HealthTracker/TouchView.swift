//
//  TouchView.swift
//  PhakamadS_MilosavljevicM_HealthTracker
//
//  Created by Bright Phakamad on 3/15/20.
//  Copyright © 2020 Marko Milosavljevic. All rights reserved.
//

import UIKit

class TouchView: UIView {
    
    var timer : Timer?
    

    @IBOutlet weak var image1: UIImageView!
    @IBOutlet weak var image2: UIImageView!
    @IBOutlet weak var image3: UIImageView!
    @IBOutlet weak var image4: UIImageView!
    @IBOutlet weak var image5: UIImageView!
    @IBOutlet weak var image6: UIImageView!
    @IBOutlet weak var image7: UIImageView!
    @IBOutlet weak var image8: UIImageView!
    @IBOutlet weak var image9: UIImageView!
    
    @IBOutlet var imagesCollection: [UIImageView]!
    
    
    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        if let touch = touches.first {
            
            if touch.tapCount == 2 {
                let pointXY : CGPoint = touch.location(in: self)
                handleDoubleTap(pointXY)
            } else {
                timer = Timer.scheduledTimer(
                withTimeInterval: 0.3, repeats: false) {
                    _ in self.handleSingleTap() }
            }
        }
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        if let touch = touches.first {
            if touch.tapCount >= 2 {
                timer?.invalidate() }
        }
    }
    
    func handleSingleTap() {
        print("Single tap!")
        setNeedsDisplay()
    }
    
    func handleDoubleTap(_ pointXY : CGPoint) {
        print("Double tap!!")
        
        for i in 0..<imagesCollection.count {
            let imageView = imagesCollection[i]
            
            if imageView.frame.contains(pointXY) {
                
                if isFull(imageView) {
                    imageView.image = UIImage(named: "water-empty")
                    imageView.restorationIdentifier = "water-empty"
                    imagesId[i] = "water-empty"
                } else {
                    imageView.image = UIImage(named: "water-full")
                    imageView.restorationIdentifier = "water-full"
                    imagesId[i] = "water-full"
                }
                
            }
        }
//
//        if image1.frame.contains(point) {
//            if image1.restorationIdentifier == "water-empty" {
//                print("change image")
//                image1.image = UIImage(named: "water-full")
//                image1.restorationIdentifier = "water-full"
//            } else {
//                image1.image = UIImage(named: "water-empty")
//                image1.restorationIdentifier = "water-empty"
//            }
//        }
        setNeedsDisplay()
    }
    
    func isFull(_ imageView : UIImageView) -> Bool {
        let imageId = imageView.restorationIdentifier
        
        if imageId == "water-full" {
            return true
        } else {
            return false
        }
    }

}
