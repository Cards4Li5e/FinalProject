//
//  ResultViewController.swift
//  FinalProject3
//
//  Created by Tejas Shah on 4/19/16.
//  Copyright © 2016 Tejas Shah. All rights reserved.
//

import UIKit

class ResultViewController: UIViewController
{
    
    
    @IBOutlet var myLabel: UILabel!
    
    @IBOutlet var myImageView: UIImageView!
    
    var resultString:String!
    var imageString:String!
    
    override func viewDidAppear(animated: Bool)
    {
        super.viewDidAppear(animated)
        
        myLabel.text = resultString
        myImageView.image  = UIImage(named: imageString)
        
        
    }
    
    
    @IBAction func playAgain(sender: AnyObject)
    {
        
        dismissViewControllerAnimated(true, completion: nil)
    }
    
    
}

