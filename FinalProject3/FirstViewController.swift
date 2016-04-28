//
//  FirstViewController.swift
//  FinalProject3
//
//  Created by Tejas Shah on 4/25/16.
//  Copyright © 2016 Tejas Shah. All rights reserved.
//

import AVFoundation
import UIKit

class FirstViewController: UIViewController
{
    var player = AVAudioPlayer()
    
    @IBAction func alertButton(sender: AnyObject)
    {
            let alertController = UIAlertController(title: "Fire Water Grass", message: "Fire beats Grass, Water beats Fire, and Grass beats Water!", preferredStyle: UIAlertControllerStyle.Alert)
        alertController.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.Default, handler: nil))
        
        self.presentViewController(alertController, animated: true, completion: nil)
    }
    
    override func viewDidLoad()
    {
        let url:NSURL = NSBundle.mainBundle().URLForResource("bg", withExtension:  "mp3")!
        do
        {
            player = try AVAudioPlayer(contentsOfURL: url, fileTypeHint: nil)
        }
        catch
            let error as NSError
        {
            print(error.description)
        }
        
        player.numberOfLoops = -1
        player.prepareToPlay()
        player.play()
   
    }
    
}