//
//  Point.swift
//  1S-2px_Integral
//
//  Created by Daksh Patel on 2/16/22.
//

import Foundation

struct Point {
    
    var functions: MonteCarloEx
    
    var xPoint: Double
    var yPoint: Double
    var zPoint: Double
    
    var radius: Double
    var theta: Double
    var phi: Double
    
    init(xPoint: Double, yPoint: Double, zPoint: Double) {
        
        self.xPoint = xPoint
        self.yPoint = yPoint
        self.zPoint = zPoint
        
        self.functions = MonteCarloEx()
        
        self.radius = 0.0
        self.theta = 0.0
        self.phi = 0.0
        
    }
    
    func max() -> Double {
        var max = abs(self.xPoint)
        if(abs(self.yPoint) > max) {
            max = abs(self.yPoint)
        }
        
        if(abs(self.zPoint) > max) {
            max = abs(self.zPoint)
        }
        
        return max
    }
    
    mutating func scale(scaleFactor: Double) {
        self.xPoint *= scaleFactor
        self.yPoint *= scaleFactor
        self.zPoint *= scaleFactor
    }
}
