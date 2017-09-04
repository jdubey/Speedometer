//
//  SpeedView.swift
//  Speedometer
//
//  Created by Joshua Dubey on 14/08/2017.
//  Copyright © 2017 Joshua Dubey. All rights reserved.
//

import UIKit

@IBDesignable class SpeedView: UIView {
    
    lazy var renderer: UIGraphicsImageRenderer = {
       return UIGraphicsImageRenderer(size: CGSize(width: self.frame.width, height: self.frame.height + 20))
    }()
    
    @IBInspectable var arcColor: UIColor = .green {
        didSet {
            self.setNeedsDisplay()
        }
    }
    
    @IBInspectable var startAngle: CGFloat = 0 {
        didSet {
            self.setNeedsDisplay()
        }
    }
    
    @IBInspectable var endAngle: CGFloat = -180.0 {
        didSet {
            self.setNeedsDisplay()
        }
    }
    
    @IBInspectable var lineWidth: CGFloat = 5.0 {
        didSet {
            self.setNeedsDisplay()
        }
    }
    
    override func prepareForInterfaceBuilder() {
        super.prepareForInterfaceBuilder()
    }
    
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
        let path = UIBezierPath()
        let radius = bounds.height - lineWidth / 2
        path.addArc(withCenter: CGPoint(x: bounds.width / 2, y: bounds.height), radius: radius, startAngle: startAngle.inRadians, endAngle: endAngle.inRadians, clockwise: false)
        path.lineWidth = lineWidth
        arcColor.setStroke()
        path.stroke()
        
        for i in 0...50 {
            if i % 5 == 0 {
                drawMajorTic(CGFloat(i * 180/50), radius: bounds.height)
            }
            else {
                drawMinorTic(CGFloat(i * 180/50), radius: bounds.height)
            }
        }
    }
    
    
    private func drawMajorTic(_ angle: CGFloat, radius: CGFloat) {
        drawTic(angle, outerRadius: radius, length: 20, lineWidth: 3.0, withLabel: true)
    }
    
    private func drawMinorTic(_ angle: CGFloat, radius: CGFloat) {
        drawTic(angle, outerRadius: radius, length: 10, lineWidth: 1.0)
    }
    
    private func drawTic(_ angle: CGFloat, outerRadius: CGFloat, length: CGFloat, lineWidth: CGFloat, withLabel: Bool = false) {
        let path = UIBezierPath()
        let ticStartX = cos(angle.inRadians) * outerRadius
        let ticStartY = sin(angle.inRadians) * outerRadius
        path.move(to: CGPoint(x: outerRadius + ticStartX, y: bounds.height - ticStartY))
        
        let ticEndX = cos(angle.inRadians) * (outerRadius - length)
        let ticEndY = sin(angle.inRadians) * (outerRadius - length)
        
        
        path.addLine(to: CGPoint(x: outerRadius + ticEndX, y: bounds.height - ticEndY))
        path.lineWidth = lineWidth
        path.stroke()
                
        if floor(ticEndX) > 0 { x = ticEndX}
        if floor(ticEndX) < 0 { x = ticEndX + 10}

        if withLabel {
            let labelCtrX = cos(angle.inRadians) * (outerRadius - length - 20)
            let labelCtrY = sin(angle.inRadians) * (outerRadius - length - 20)
            
            let rect = CGRect(x: outerRadius - length + labelCtrX + 7.5, y: bounds.height - labelCtrY - 7.5, width: 30, height: 30)

            drawTicLabel("\(Int(angle))", rect: rect)
        }
    }
    
    private func drawTicLabel(_ text: String, rect: CGRect) {
        let img = renderer.image { ctx in
            let paragraphStyle = NSMutableParagraphStyle()
            paragraphStyle.alignment = .center
            
            let attrs = [NSFontAttributeName: UIFont(name: "HelveticaNeue-Thin", size: 12)!,
                         NSParagraphStyleAttributeName: paragraphStyle]
            
            let string = text
            string.draw(with:rect, options: .usesLineFragmentOrigin, attributes: attrs, context: nil)
        }
        
        let imageView = UIImageView(image: img)
        addSubview(imageView)

    }

}
