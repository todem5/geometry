//
//  View1.swift
//  geometry
//
//  Created by Dmitry Tolmachev on 30.11.15.
//  Copyright © 2015 Al Digit. All rights reserved.
//

import UIKit

class tView: UIView {
    
        override func drawRect(rect: CGRect)
        {
            
            
            UIColor.greenColor().set()
            /* Get the current graphics context */
            let context = UIGraphicsGetCurrentContext()
            /* Set the width for the line */
            CGContextSetLineWidth(context, 3)
            
            CGContextMoveToPoint(context,100, 50)
            CGContextAddLineToPoint(context, 100, 200)
            
            CGContextMoveToPoint(context, 100, 200)
            CGContextAddLineToPoint(context, 200, 200)
            
            CGContextMoveToPoint(context, 200, 200)
            CGContextAddLineToPoint(context, 150, 50)
            
            CGContextStrokePath(context)
        }
        
        
}
