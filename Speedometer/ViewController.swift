//
//  ViewController.swift
//  Speedometer
//
//  Created by Joshua Dubey on 14/08/2017.
//  Copyright © 2017 Joshua Dubey. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var speedView: SpeedView!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        speedView.arcColor = .cyan
        speedView.setNeedsDisplay()
    }

    override func viewDidAppear(_ animated: Bool) {
        let needleLayer = speedView.needleLayer
        
        let animation = CABasicAnimation(keyPath: "transform.rotation.z")
        animation.fromValue = 0.0
        animation.toValue = Double.pi
        animation.beginTime = CACurrentMediaTime() + 0.33
        animation.timingFunction = CAMediaTimingFunction(name: kCAMediaTimingFunctionEaseIn)
        animation.fillMode = kCAFillModeForwards
        animation.isRemovedOnCompletion = false
        
        animation.setValue("up", forKey: "name")
        
        animation.duration = 2.0
        animation.delegate = self
        needleLayer.add(animation, forKey: nil)
        
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}

extension ViewController: CAAnimationDelegate {
    func animationDidStop(_ anim: CAAnimation, finished flag: Bool) {
        if anim.value(forKey: "name") as! String == "up" {
            let animation = CABasicAnimation(keyPath: "transform.rotation.z")
            animation.fromValue = Double.pi
            animation.toValue = 0.0
            animation.duration = 2.0
            animation.delegate = self
            animation.timingFunction = CAMediaTimingFunction(name: kCAMediaTimingFunctionEaseOut)
            animation.fillMode = kCAFillModeForwards
            animation.isRemovedOnCompletion = false
            animation.setValue("down", forKey: "name")
            self.speedView.needleLayer.add(animation, forKey: nil)
        }
        else {
            self.speedView.needleLayer.removeAllAnimations()
        }
    }
}

