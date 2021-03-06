//
//  Canvas.swift
//  LearnWrite
//
//  Created by Rasyid Ridla on 23/04/22.
//

import CoreGraphics

struct Canvas {
    var lines: [Line] = [Line()]
    
    mutating func draw(_ point: CGPoint) {
        lines[lines.endIndex - 1].points.append(point)
    }
    
    mutating func newLine() {
        lines.append(Line())
    }
}
