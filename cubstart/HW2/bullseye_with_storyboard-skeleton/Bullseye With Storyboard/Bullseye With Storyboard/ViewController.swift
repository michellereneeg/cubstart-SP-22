//
//  ViewController.swift
//  Storyboard Bullseye
//
//  Created by Tony Hong on 1/13/22.
//

import UIKit
import Foundation

var randomNumber = 0
var range = 100
var level = 1
var highestScore = 0

class ViewController: UIViewController {
    
    // switch that switches on and off from exact mode
    @IBOutlet weak var exactSwitch: UISwitch!
    
    // displays whether user hit bullseye
    @IBOutlet weak var resultLabel: UILabel!
    
    // displays the number user must hit to win
    @IBOutlet weak var numLabel: UILabel!
    
    // displays the current level the user is on
    @IBOutlet weak var currentLevel: UILabel!
    
    // displays high score of user
    @IBOutlet weak var highScore: UILabel!
    
    // slider user can slide to match random number given
    @IBOutlet weak var numSlider: UISlider!
    
    // IBOutlet for play again button
    @IBOutlet weak var playAgainButton: UIButton!
    
    // displays the max value of slider
    @IBOutlet weak var rangeLabel: UILabel!
    
    @IBAction func checkValue(_ sender: Any) {
        //if we are not in "exact" mode
        if exactSwitch.isOn == false {
            if randomNumber - 3 <= Int(numSlider.value) && randomNumber + 3 >= Int(numSlider.value) {
                resultLabel.text = "Bullseye!"
                
                //increase range for harder next level
                range += 50
                rangeLabel.text = String(range)
                
                //change slider maximum to reflect new range
                //numSlider is a float, not an integer (range is an Int)
                numSlider.maximumValue = Float(range)
                
                // increase level
                level += 1
                currentLevel.text = String(level)
                
                numSlider.setValue(Float(range/2), animated: false)
                randomNumber = Int(arc4random_uniform(UInt32(range + 1)))
                numLabel.text = String(randomNumber)
                
                //hide Result label, since it is a new round
                resultLabel.isHidden = true
                
                
            } else {
                resultLabel.text = "You missed the target!"
                //user can only play again if they lose
                playAgainButton.isHidden = false
            }
            
            } else {
                if randomNumber == Int(numSlider.value) {
                    resultLabel.text = "Bullseye!"
                    
                    //increase range for harder next level
                    range += 50
                    rangeLabel.text = String(range)
                    
                    //change slider maximum to reflect new range
                    //numSlider is a float, not an integer (range is an Int)
                    numSlider.maximumValue = Float(range)
                    
                    // increase level
                    level += 1
                    currentLevel.text = String(level)
                    
                    numSlider.setValue(Float(range/2), animated: false)
                    randomNumber = Int(arc4random_uniform(UInt32(range + 1)))
                    numLabel.text = String(randomNumber)
                    
                    //hide Result label, since it is a new round
                    resultLabel.isHidden = true
                } else {
                    resultLabel.text = "You missed the target!"
                    //user can only play again if they lose
                    playAgainButton.isHidden = false
        }
    }
        resultLabel.isHidden = false
    }
    
    @IBAction func playAgain(_ sender: Any) {
        numSlider.setValue(50, animated: false)
        randomNumber = Int(arc4random_uniform(101))
        numLabel.text = String(randomNumber)
        resultLabel.isHidden = true
        playAgainButton.isHidden = true
        
        if level > highestScore  && level != 1 {
            highestScore = level
            highScore.text = String(highestScore)
        }
        
        //reset range to 100 when player loses
        range = 100
        rangeLabel.text = String(range)
        numSlider.maximumValue = Float(range)
        
        //reset level to l
        level = 1
        currentLevel.text = String(level)
        
        
    }
    
    @IBAction func sliderValueChanged(_ sender: Any) {
        //numLabel.text = "\(Int(numSlider.value))"
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        randomNumber = Int(arc4random_uniform(101))
        numLabel.text = String(randomNumber)
        
        rangeLabel.text = String(range)
        currentLevel.text = String(level)
        
        highScore.text = String(highestScore)
    }

}

