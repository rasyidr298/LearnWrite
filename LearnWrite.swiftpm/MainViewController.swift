//
//  File.swift
//  LearnWrite
//
//  Created by Rasyid Ridla on 23/04/22.
//

import UIKit
import Vision

class MainViewController: UIViewController {
    
    var totalAnswered: Int = 0
    var resultOperation = 0
    
    var timer: Timer?
    var totalTime = 60
    
    //labelView
    var labelTimer = UILabel()
    var labelCanvas = UILabel()
    var labelResultGame = UILabel()
    var labelTotResult = UILabel()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .systemGray3
        
        //labelTImer
        labelTimer = UILabel(frame: CGRect(x: 505, y: 230, width: 350, height: 60))
        labelTimer.textColor = .white
        labelTimer.font = UIFont.boldSystemFont(ofSize: 26)
        labelTimer.text = "00:00"
        
        //labelCanvas
        labelCanvas = UILabel(frame: CGRect(x: 60, y: 500, width: 500, height: 60))
        labelCanvas.font = UIFont.boldSystemFont(ofSize: 24)
        labelCanvas.textAlignment = .center
        labelCanvas.text = "Click start and write your answer here.."
        
        //labelResult
        labelResultGame = UILabel(frame: CGRect(x: 60, y: 500, width: 500, height: 60))
        labelResultGame.font = UIFont.boldSystemFont(ofSize: 24)
        labelResultGame.textAlignment = .center
        labelResultGame.text = "Total Questions that can be done in 1 minute"
        
        //labelTotResult
        labelTotResult = UILabel(frame: CGRect(x: 70, y: 420, width: 500, height: 500))
        labelTotResult.font = UIFont.boldSystemFont(ofSize: 200)
        labelTotResult.textAlignment = .center
        labelTotResult.textColor = .green
        
        //btnTrigger
        buttonClear.addTarget(self, action: #selector(clearCanvas), for: .touchUpInside)
        buttonStart.addTarget(self, action: #selector(startGame), for: .touchUpInside)
        buttonSubmit.addTarget(self, action: #selector(submitAnswer), for: .touchUpInside)
        
        view.addSubview(canvasView)
        view.addSubview(bgCanvass)
        view.addSubview(buttonStart)
        view.addSubview(buttonClear)
        view.addSubview(numZero)
        view.addSubview(numZeroLeft)
        view.addSubview(plusOperation)
        view.addSubview(samaDengan)
        view.addSubview(dot)
        view.addSubview(labelCanvas)
        view.addSubview(icDrawBig)
    }
    
    @objc func clearCanvas() {
        canvasView.clear()
    }
    
    @objc func updateTimer() {
        
        if self.totalTime <= 15 {
            bgTimerGreen.removeFromSuperview()
            view.addSubview(bgTimerRed)
            view.addSubview(labelTimer)
            shakeWith(view: bgTimerRed, duration: 1.0, angle: .pi/30, yOffset: -20)
        }
        labelTimer.text = self.timeFormatted(self.totalTime)
        if totalTime != 0 {
            totalTime -= 1
        } else {
            if let timer = self.timer {
                timer.invalidate()
                self.timer = nil
                finishGame()
            }
        }
    }
    
    @objc func submitAnswer() {
        recogtext()
    }
    
    @objc func startGame() {
//        playSound(file: "click", fileExtension: "wav")
        print("start game")
        startOperation()
        
        view.addSubview(buttonSubmit)
        view.addSubview(bgTimerGreen)
        view.addSubview(labelTimer)
        view.addSubview(icDrawSmall)
        view.addSubview(samaDengan)
        view.addSubview(dot)
        numZeroLeft.removeFromSuperview()
        icDrawBig.removeFromSuperview()
        labelCanvas.removeFromSuperview()
        labelResultGame.removeFromSuperview()
        labelTotResult.removeFromSuperview()
        
        self.totalTime = 60
        self.timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(updateTimer), userInfo: nil, repeats: true)
    }
    
    func timeFormatted(_ totalSeconds: Int) -> String {
        let seconds: Int = totalSeconds % 60
        let minutes: Int = (totalSeconds / 60) % 60
        return String(format: "%02d:%02d", minutes, seconds)
    }
    
    func finishGame() {
        print("finish game")
        clearNumber()
        clearOperation()
        samaDengan.removeFromSuperview()
        dot.removeFromSuperview()
        labelTimer.text = "FINISH"
        buttonSubmit.removeFromSuperview()
        icDrawSmall.removeFromSuperview()
        canvasView.clear()
        view.addSubview(buttonStart)
        view.addSubview(labelResultGame)
        labelTotResult.text = String(totalAnswered)
        view.addSubview(labelTotResult)
    }
    
    func recogtext() {
        guard let cgImage = canvasView.image.cgImage else {return}
        let requestHandler = VNImageRequestHandler(cgImage: cgImage)
      
        let recognizeTextRequest = VNRecognizeTextRequest { (request, error) in
          guard let observations = request.results as? [VNRecognizedTextObservation] else {
            return
          }
          
          let recognizedStrings = observations.compactMap { observation in
              observation.topCandidates(1).first?.string
          }
          
          DispatchQueue.main.async {
              let result = Int(recognizedStrings.first ?? "0")
              print("detect image -> ",result as Any)
              
              let alertController = UIAlertController(title: result != self.resultOperation ? "WRONG" : "CORECT", message: nil, preferredStyle: .alert)
              alertController.addAction(UIAlertAction(title: result != self.resultOperation ? "REPEAT" : "NEXT", style: .default) { [weak self] _ in
                  canvasView.clear()
                  self?.startOperation()
              })
              self.present(alertController, animated: true, completion: nil)

              if result == self.resultOperation {
                  self.totalAnswered += 1
              }
          }
        }
        
        recognizeTextRequest.recognitionLevel = .fast
        
        DispatchQueue.global(qos: .userInitiated).async {
          do {
            try requestHandler.perform([recognizeTextRequest])
          } catch {
            print(error)
          }
        }
    }
    
    func startOperation() {
        clearNumber()
        clearOperation()
        
        let random1 = Int.random(in: 6..<9)
        let random2 = Int.random(in: 0..<6)
        let randomOneOperation = Int.random(in: 1..<4)
        
        switch random2 {
        case 0 : view.addSubview(numZero)
        case 1 : view.addSubview(numOne)
        case 2 : view.addSubview(numTwo)
        case 3 : view.addSubview(numThree)
        case 4 : view.addSubview(numFour)
        case 5 : view.addSubview(numFive)
        default :
            view.addSubview(numZero)
        }
        
        switch random1 {
        case 6 : view.addSubview(numSix)
        case 7 : view.addSubview(numSeven)
        case 8 : view.addSubview(numEight)
        case 9 : view.addSubview(numNine)
        default :
            view.addSubview(numSix)
        }
        
        switch randomOneOperation {
        case 1 : view.addSubview(plusOperation)
        case 2: view.addSubview(minusOperation)
        case 3 : view.addSubview(xOperation)
        default :
            view.addSubview(plusOperation)
        }
        
        resultOperation = oneOperation(number1: random1, number2: random2, operation: randomOneOperation)
        
        if resultOperation >= 10 {
            return startOperation()
        }
        
        print(random1, " ", getOperation(operation: randomOneOperation), " ", random2, " = ", resultOperation)
    }
}
