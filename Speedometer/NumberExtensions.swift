//
//  NumberExtensions.swift
//  Speedometer
//
//  Created by Joshua Dubey on 15/08/2017.
//  Copyright © 2017 Joshua Dubey. All rights reserved.
//

import Foundation
import UIKit

extension Double {
    
    var inRadians: Double {
        return Double(self * .pi / 180)
    }
    
    var inDegrees: Double {
        return Double(self * 180 / .pi)
    }
    
    func radiansToDegrees() -> Double {
        return self * 180 / .pi
    }
    
    func degreesToRadians() -> Double {
        return self * .pi / 180
    }
}

extension CGFloat {
    var inRadians: CGFloat {
        return CGFloat(self * .pi / 180)
    }
    
    var inDegrees: CGFloat {
        return CGFloat(self * 180 / .pi)
    }

}
