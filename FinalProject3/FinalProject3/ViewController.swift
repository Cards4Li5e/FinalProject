//
//  ViewController.swift
//  FinalProject3
//
//  Created by Tejas Shah on 4/19/16.
//  Copyright © 2016 Tejas Shah. All rights reserved.
//

import UIKit
//import AVFoundation

class ViewController: UIViewController
{
    var counter = 1
    var timer = NSTimer()
    var isAnimating = true
    
    
    
    @IBOutlet weak var fire: UIButton!
    @IBOutlet weak var water: UIButton!
    @IBOutlet weak var grass: UIButton!
    
    @IBOutlet weak var fireImage: UIImageView!
    
    var userOption:GameChoice! //you pick
    var computerOption:GameChoice! //computer picks
    
    let winnerMessage = [ GameChoice.Fire : "Fire Beats Grass",
        GameChoice.Water: "Water Beats Fire",
        GameChoice.Grass : "Grass Beats Water"]
    
    let moreMessage = [ GameResult.Winner: ". You Win!"
        ,GameResult.Loser : ". You Lose!"
        ,GameResult.Tie : "Its A Tie"]
    
    @IBAction func animateImage(sender: AnyObject)
    {
        if isAnimating == true
        {
            //timer.invalidate()
            //isAnimating = false
        }
        else
        {
            timer = NSTimer.scheduledTimerWithTimeInterval(0.1, target: self, selector: Selector("doAnimation"), userInfo: nil, repeats: true)
            isAnimating = true
        }

    }
    
    
    @IBAction func makeChoice(sender: AnyObject)
    {
        
        switch(sender as! UIButton)
        {
        case fire:
            userOption = .Fire
            computerOption = GameChoice()
            displayResult()
        case water:
            userOption = .Water
            computerOption = GameChoice()
            displayResult()
        case grass:
            userOption = .Grass
            computerOption = GameChoice()
            displayResult()
        default:
            print("handle value")
            
        }
        
    }
    
    
    func displayResult()
    {
        let myGameResult = gameResult(userOption, computerOption: computerOption)
        let myResultString = gameResultText(myGameResult)
        let myStoryBoard = UIStoryboard(name: "Main", bundle: nil)
        let myResultVC = myStoryBoard.instantiateViewControllerWithIdentifier("ResultView") as! ResultViewController
        
        myResultVC.resultString = myResultString
        
        if myGameResult == GameResult.Tie
        {
            myResultVC.imageString = myResultString.stringByReplacingOccurrencesOfString(" ", withString: "")
        }
        else
        {
            let tempString = myResultString.stringByReplacingOccurrencesOfString(moreMessage[myGameResult]!, withString: "")
            
            myResultVC.imageString = tempString.stringByReplacingOccurrencesOfString(" ", withString: "")
            
        }
        
        self.presentViewController(myResultVC, animated: true, completion: nil)
        
    }
    
    func gameResultText(gameResult:GameResult ) ->String
    {
        switch(gameResult)
        {
        case .Winner:
            return winnerMessage[userOption]! + moreMessage[gameResult]!
        case .Loser:
            return winnerMessage[computerOption]! + moreMessage[gameResult]!
        default:
            return moreMessage[gameResult]!
            
        }
    }
    
    func gameResult(userOption:GameChoice,computerOption:GameChoice) -> GameResult
    {
        switch(userOption,computerOption)
        {
        case (GameChoice.Fire,GameChoice.Grass),(GameChoice.Water,GameChoice.Fire),(GameChoice.Grass,GameChoice.Water):
            return GameResult.Winner
        case (GameChoice.Grass,GameChoice.Fire),(GameChoice.Fire,GameChoice.Water),(GameChoice.Water, GameChoice.Grass):
            return GameResult.Loser
        default:
            return GameResult.Tie
        }
        
    }
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        
        timer = NSTimer.scheduledTimerWithTimeInterval(0.1, target: self, selector: Selector("doAnimation"), userInfo: nil, repeats: true)
        
    }
    
    func doAnimation()
    {
        //allows animation to work
        if counter == 4
        {
            counter = 1
        }
        else
        {
            counter++
        }
        
        fireImage.image = UIImage(named: "fire\(counter).png")
        
    }

    
    
    
    

}

