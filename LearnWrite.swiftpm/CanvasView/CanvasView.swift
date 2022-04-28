//
//  CanvasView.swift
//  LearnWrite
//
//  Created by Rasyid Ridla on 23/04/22.
//
import UIKit

class CanvasView: UIView {
    private(set) var canvas: Canvas    
    
    override init(frame: CGRect) {
        canvas = Canvas()
        super.init(frame: frame)
        
        self.addGestureRecognizer(UIPanGestureRecognizer(target: self, action: #selector(CanvasView.onPanGesture(_:))))
    }

    required init?(coder aDecoder: NSCoder) {
        canvas = Canvas()
        super.init(coder: aDecoder)
    }
    
    var image: UIImage {
        UIGraphicsBeginImageContext(bounds.size)
        layer.render(in: UIGraphicsGetCurrentContext()!)
        let result = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        return result!
    }
    
    override func draw(_ rect: CGRect) {
        let lineWidth = Swift.min(frame.size.width, frame.size.height) / 9
        
        let context = UIGraphicsGetCurrentContext()
        for line in canvas.lines {
            context?.setLineWidth(lineWidth)
            context?.setStrokeColor(UIColor(red: 0.0, green: 0.0, blue: 0.0, alpha: 1.0).cgColor)
            context?.setLineCap(.round)
            context?.setLineJoin(.round)
            for (index, point) in line.points.enumerated() {
                if index == 0 {
                    context?.move(to: CGPoint(x: point.x, y: point.y))
                } else {
                    context?.addLine(to: CGPoint(x: point.x, y: point.y))
                }
            }
        }
        context?.strokePath()
    }
    
    @objc func onPanGesture(_ gestureRecognizer: UIPanGestureRecognizer) {
        canvas.draw(gestureRecognizer.location(in: self))
        if gestureRecognizer.state == .ended {
            canvas.newLine()
        }
        
        setNeedsDisplay()
    }
    
    func clear() {
        canvas = Canvas()
        setNeedsDisplay()
    }
}

