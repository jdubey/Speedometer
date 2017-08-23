//
//  SpeedView.swift
//  Speedometer
//
//  Created by Joshua Dubey on 14/08/2017.
//  Copyright © 2017 Joshua Dubey. All rights reserved.
//

import UIKit

@IBDesignable class SpeedView: UIView {

    @IBInspectable var arcColor: UIColor = .green {
        didSet {
            self.setNeedsDisplay()
        }
    }
    
    @IBInspectable var startAngle: CGFloat = .pi {
        didSet {
            self.setNeedsDisplay()
        }
    }
    
    @IBInspectable var endAngle: CGFloat = 0.0 {
        didSet {
            self.setNeedsDisplay()
        }
    }


    
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
                let path = UIBezierPath()
//        path.move(to: CGPoint(x: 0.0, y: bounds.height))
        
        path.addArc(withCenter: CGPoint(x: center.x, y: bounds.height), radius: bounds.height, startAngle: startAngle, endAngle: endAngle, clockwise: true)
        path.lineWidth = 5
       arcColor.setStroke()
       path.stroke()
       
//       path.move(to: CGPoint(x: bounds.width/2, y: 0))
//        path.addLine(to: CGPoint(x: bounds.width/2, y:20))
//        path.stroke()
        
            let radius = bounds.height
            let x = sin(45.0.inRadians) * radius
            let y = cos(45.0.inRadians) * radius
        path.move(to: CGPoint(x: radius + x, y: bounds.height - y))
        let innerRadius = bounds.height - 20
        
        let x1 = sin(45.0.inRadians) * innerRadius
        let y1 = cos(45.0.inRadians) * innerRadius
        
        path.addLine(to: CGPoint(x: radius + x1, y: bounds.height - y1))
        path.stroke()
        
        drawTic(30, radius: bounds.height)
        drawTic(40, radius: bounds.height)
        drawTic(50, radius: bounds.height)
        drawTic(90, radius: bounds.height)
        drawTic(-80, radius: bounds.height)
        drawTic(0, radius: bounds.height)
    }

    func drawTic(_ angle: Double, radius: CGFloat) {
        let path = UIBezierPath()
        let x = sin(angle.inRadians) * radius
        let y = cos(angle.inRadians) * radius
        path.move(to: CGPoint(x: radius + x, y: bounds.height - y))
        let innerRadius = bounds.height - 20
        
        let x1 = sin(angle.inRadians) * innerRadius
        let y1 = cos(angle.inRadians) * innerRadius
        
        path.addLine(to: CGPoint(x: radius + x1, y: bounds.height - y1))
        path.stroke()

    }
}
