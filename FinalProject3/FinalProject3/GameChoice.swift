//
//  GameChoice.swift
//  FinalProject3
//
//  Created by Tejas Shah on 4/19/16.
//  Copyright © 2016 Tejas Shah. All rights reserved.
//

import Foundation

enum GameChoice
{
    
    case Fire, Water, Grass
    
    init()
    {
        switch(arc4random_uniform(3))
        {
        case 0:
            self = Fire
        case 1:
            self = Water
        default:
            self = Grass
        }
    }
    
}