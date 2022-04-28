//
//  File.swift
//  LearnWrite
//
//  Created by Rasyid Ridla on 23/04/22.
//
import CoreGraphics

struct Line {
    var points: [CGPoint]
    
    init() {
        self.init([])
    }
    
    init(_ points: [CGPoint]) {
        self.points = points
    }
}

