//
//  File.swift
//  LearnWrite
//
//  Created by Rasyid Ridla on 24/04/22.
//

import UIKit
import Foundation
import CoreML


//CustomView
var canvasView: CanvasView = {
    let canvasView = CanvasView()
    canvasView.frame.origin = CGPoint(x: 15, y: 220)
    canvasView.frame.size = CGSize(width: UIScreen.main.bounds.size.height-430, height: UIScreen.main.bounds.size.width)
    canvasView.backgroundColor = .white
    return canvasView
}()

//imageView
var bgCanvass: UIImageView = {
    let image = UIImageView(frame: CGRect(x: 15, y: 220, width: UIScreen.main.bounds.size.height-430, height: UIScreen.main.bounds.size.width))
    image.image = UIImage(named: "bg_canvas")
    image.contentMode = .scaleAspectFit
    image.clipsToBounds = true
    return image
}()

var bgTimerRed: UIImageView = {
    let image = UIImageView(frame: CGRect(x: 475, y: 235, width: 130, height: 50))
    image.image = UIImage(named: "bg_red")
    image.contentMode = .scaleAspectFit
    image.clipsToBounds = true
    return image
}()

var bgTimerGreen: UIImageView = {
    let image = UIImageView(frame: CGRect(x: 475, y: 235, width: 130, height: 50))
    image.image = UIImage(named: "bg_green")
    image.contentMode = .scaleAspectFit
    image.clipsToBounds = true
    return image
}()

var samaDengan: UIImageView = {
    let image = UIImageView(frame: CGRect(x: 410, y: 100, width: 70, height: 70))
    image.image = UIImage(named: "ic_=")
    image.contentMode = .scaleAspectFit
    image.clipsToBounds = true
    return image
}()

var dot: UIImageView = {
    let image = UIImageView(frame: CGRect(x: 510, y:110, width: 80, height: 80))
    image.image = UIImage(named: "ic_dot")
    image.contentMode = .scaleAspectFit
    image.clipsToBounds = true
    return image
}()

var icDrawSmall: UIImageView = {
    let image = UIImageView(frame: CGRect(x: 30, y:930, width: 40, height: 40))
    image.image = UIImage(systemName: "hand.draw.fill")
    image.contentMode = .scaleAspectFit
    image.tintColor = .systemGray3
    image.clipsToBounds = true
    return image
}()

var icDrawBig: UIImageView = {
    let image = UIImageView(frame: CGRect(x: 150, y:550, width: 300, height: 300))
    image.image = UIImage(systemName: "hand.draw.fill")
    image.contentMode = .scaleAspectFit
    image.clipsToBounds = true
    image.tintColor = .systemGray3
    return image
}()


//digitsView
var numZero: UIImageView = {
    let image = UIImageView(frame: CGRect(x: 270, y: 80, width: 100, height: 100))
    image.image = UIImage(named: "ic_zero")
    image.contentMode = .scaleAspectFit
    image.clipsToBounds = true
    return image
}()

var numZeroLeft: UIImageView = {
    let image = UIImageView(frame: CGRect(x: 30, y: 80, width: 100, height: 100))
    image.image = UIImage(named: "ic_zero")
    image.contentMode = .scaleAspectFit
    image.clipsToBounds = true
    return image
}()

var numOne: UIImageView = {
    let image = UIImageView(frame: CGRect(x: 270, y: 80, width: 100, height: 100))
    image.image = UIImage(named: "ic_one")
    image.contentMode = .scaleAspectFit
    image.clipsToBounds = true
    return image
}()

var numTwo: UIImageView = {
    let image = UIImageView(frame: CGRect(x: 270, y: 80, width: 100, height: 100))
    image.image = UIImage(named: "ic_two")
    image.contentMode = .scaleAspectFit
    image.clipsToBounds = true
    return image
}()

var numThree: UIImageView = {
    let image = UIImageView(frame: CGRect(x: 270, y: 80, width: 100, height: 100))
    image.image = UIImage(named: "ic_three")
    image.contentMode = .scaleAspectFit
    image.clipsToBounds = true
    return image
}()

var numFour: UIImageView = {
    let image = UIImageView(frame: CGRect(x: 270, y: 80, width: 100, height: 100))
    image.image = UIImage(named: "ic_four")
    image.contentMode = .scaleAspectFit
    image.clipsToBounds = true
    return image
}()

var numFive: UIImageView = {
    let image = UIImageView(frame: CGRect(x: 270, y: 80, width: 100, height: 100))
    image.image = UIImage(named: "ic_five")
    image.contentMode = .scaleAspectFit
    image.clipsToBounds = true
    return image
}()

var numSix: UIImageView = {
    let image = UIImageView(frame: CGRect(x: 30, y: 80, width: 100, height: 100))
    image.image = UIImage(named: "ic_six")
    image.contentMode = .scaleAspectFit
    image.clipsToBounds = true
    return image
}()

var numSeven: UIImageView = {
    let image = UIImageView(frame: CGRect(x: 30, y: 80, width: 100, height: 100))
    image.image = UIImage(named: "ic_seven")
    image.contentMode = .scaleAspectFit
    image.clipsToBounds = true
    return image
}()

var numEight: UIImageView = {
    let image = UIImageView(frame: CGRect(x: 30, y: 80, width: 100, height: 100))
    image.image = UIImage(named: "ic_eight")
    image.contentMode = .scaleAspectFit
    image.clipsToBounds = true
    return image
}()

var numNine: UIImageView = {
    let image = UIImageView(frame: CGRect(x: 30, y: 80, width: 100, height: 100))
    image.image = UIImage(named: "ic_nine")
    image.contentMode = .scaleAspectFit
    image.clipsToBounds = true
    return image
}()


//math operation
var plusOperation: UIImageView = {
    let image = UIImageView(frame: CGRect(x: 170, y: 100, width: 70, height: 70))
    image.image = UIImage(named: "ic_plus")
    image.contentMode = .scaleAspectFit
    image.clipsToBounds = true
    return image
}()

var minusOperation: UIImageView = {
    let image = UIImageView(frame: CGRect(x: 170, y: 100, width: 70, height: 70))
    image.image = UIImage(named: "ic_minus")
    image.contentMode = .scaleAspectFit
    image.clipsToBounds = true
    return image
}()

var xOperation: UIImageView = {
    let image = UIImageView(frame: CGRect(x: 170, y: 100, width: 70, height: 70))
    image.image = UIImage(named: "ic_x")
    image.contentMode = .scaleAspectFit
    image.clipsToBounds = true
    return image
}()


//button
var buttonStart: UIButton = {
    let button = UIButton(frame: CGRect(x: 630, y: 700, width: 120, height: 72))
    button.setImage(UIImage(named: "btn_start"), for: .normal)
    button.contentMode = .scaleAspectFit
    return button
}()

var buttonSubmit: UIButton = {
    let button = UIButton(frame: CGRect(x: 630, y: 700, width: 120, height: 72))
    button.setImage(UIImage(named: "btn_submit"), for: .normal)
    button.contentMode = .scaleAspectFit
    return button
}()

var buttonClear: UIButton = {
    let button = UIButton(frame: CGRect(x: 630, y: 600, width: 120, height: 72))
    button.setImage(UIImage(named: "btn_clear"), for: .normal)
    button.contentMode = .scaleAspectFit
    return button
}()


//function
func shakeWith(view: UIView, duration: Double, angle: CGFloat, yOffset: CGFloat) {
    let numberOfFrames: Double = 6
    let frameDuration = Double(1/numberOfFrames)

    UIView.animateKeyframes(withDuration: duration, delay: 0, options: [],
      animations: {
        UIView.addKeyframe(withRelativeStartTime: 0.0,
                           relativeDuration: frameDuration) {
            view.transform = CGAffineTransform(rotationAngle: -angle)
        }
        UIView.addKeyframe(withRelativeStartTime: frameDuration,
                           relativeDuration: frameDuration) {
            view.transform = CGAffineTransform(rotationAngle: +angle)
        }
        UIView.addKeyframe(withRelativeStartTime: frameDuration*2,
                           relativeDuration: frameDuration) {
            view.transform = CGAffineTransform(rotationAngle: -angle)
        }
        UIView.addKeyframe(withRelativeStartTime: frameDuration*3,
                           relativeDuration: frameDuration) {
            view.transform = CGAffineTransform(rotationAngle: +angle)
        }
        UIView.addKeyframe(withRelativeStartTime: frameDuration*4,
                           relativeDuration: frameDuration) {
            view.transform = CGAffineTransform(rotationAngle: -angle)
        }
        UIView.addKeyframe(withRelativeStartTime: frameDuration*5,
                           relativeDuration: frameDuration) {
            view.transform = CGAffineTransform.identity
        }
      },
      completion: nil
    )
}

func clearNumber() {
    numZero.removeFromSuperview()
    numOne.removeFromSuperview()
    numTwo.removeFromSuperview()
    numThree.removeFromSuperview()
    numFour.removeFromSuperview()
    numFive.removeFromSuperview()
    numSix.removeFromSuperview()
    numSeven.removeFromSuperview()
    numEight.removeFromSuperview()
    numNine.removeFromSuperview()
    
}

func clearOperation() {
    plusOperation.removeFromSuperview()
    minusOperation.removeFromSuperview()
    xOperation.removeFromSuperview()
}

func oneOperation(number1: Int, number2: Int, operation: Int) -> Int {
    switch operation {
    case 1 : return (number1 + number2)
    case 2 : return (number1 - number2)
    case 3 : return (number1 * number2)
    default:
        return (number1 + number2)
    }
}

func getOperation(operation: Int) -> String {
    switch operation {
    case 1 : return "+"
    case 2 : return "-"
    case 3 : return "*"
    default : return "+"
    }
}
