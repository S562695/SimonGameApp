//
//  SimonGameVC.swift
//  SimonGameApp
//
//  Created by Naga Lakshmi on 10/2/23.
//

import UIKit

class SimonGameVC: UIViewController {
    var playerOrder = [Int]()
    var simonOrder = [Int]()
    var gameIsOver = false
    var currentStep = 0
    var gameLevel = 0
    var gameScore = 0

    override func viewDidLoad() {
        super.viewDidLoad()
        reset()
        // Do any additional setup after loading the view.
    }
    
    @IBOutlet weak var scoreLBL: UILabel!
    
    @IBOutlet weak var levelLBL: UILabel!
    
    @IBOutlet weak var messageLBL: UILabel!
    
    @IBOutlet var coloredBtnCLCTN: [UIButton]!
    
    @IBAction func onClickColorBtn(_ sender: UIButton) {
        if !gameIsOver {
                    let btn1 = sender.tag
                    simonOrder.append(btn1)
                    currentStep += 1
                    
                    print("Player Order: \(playerOrder)")
                    print("Simon Order: \(simonOrder)")
                    print("Current Step: \(currentStep)")
                    print("Level: \(gameLevel)")
                    
                    if currentStep == gameLevel {
                        if simonOrder == playerOrder {
                            gameScore += 1
                            scoreLBL.text = "\(gameScore)"
                            gameLevel += 1
                            levelLBL.text = "\(gameLevel)"
                            simonOrder.removeAll()
                            highlightButtonsForNextLevel()
                        } else {
                            gameIsOver = true
                            messageLBL.text = "Game Over!!! Lost in Level \(gameLevel) 🎯"
                        }
                        currentStep = 0
                    }
                }
    }
    
    
    
    @IBOutlet var startBTN: [UIButton]!
    
    @IBAction func onStart(_ sender: UIButton) {
        if gameIsOver {
                    reset()
                }
                highlightButtonsForNextLevel()
                gameLevel = 1
                levelLBL.text = "\(gameLevel)"
    }
    
    func reset() {
            gameIsOver = false
            currentStep = 0
            gameScore = 0
            scoreLBL.text = "\(gameScore)"
            gameLevel = 0
            levelLBL.text = "\(gameLevel)"
            simonOrder.removeAll()
            playerOrder.removeAll()
            messageLBL.text = ""
        }
    
       func highlightButtonsForNextLevel() {
           let rdmIndex = Int.random(in: 0..<coloredBtnCLCTN.count)
                   let rdmBtn = coloredBtnCLCTN[rdmIndex]
                   
                   playerOrder.append(rdmBtn.tag)
                   
                   UIView.animate(withDuration: 1.0, delay: 0, options: [.curveEaseInOut], animations: {
                       rdmBtn.transform = CGAffineTransform.identity.scaledBy(x: 1.05, y: 1.05)
                       rdmBtn.alpha = 1.0
                   }) { _ in
                       UIView.animate(withDuration: 1.0) {
                           rdmBtn.transform = CGAffineTransform.identity.scaledBy(x: 1.0, y: 1.0)
                           rdmBtn.alpha = 0.5
                       }
                   }
           }
    
    @IBAction func onReset(_ sender: UIButton) {
        reset()
    }
    
    
    
    
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
