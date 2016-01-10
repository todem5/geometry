//
//  View1.swift
//  geometry
//
//  Created by Dmitry Tolmachev on 30.11.15.
//  Copyright © 2015 Al Digit. All rights reserved.
//

import UIKit

class TrianglesView: UIView {
    private var dataSource: TrianglesProtocol?
    
    override func drawRect(rect: CGRect) {
        UIColor.greenColor().set()
        let context = UIGraphicsGetCurrentContext()
        CGContextSetLineWidth(context, 3)
        
        if let trianglesDict = dataSource?.getTriangles(){
            CGContextMoveToPoint(context, (trianglesDict["1"]!["first"]!!["x"] as! CGFloat), (trianglesDict["1"]!["first"]!!["y"] as! CGFloat))
            CGContextAddLineToPoint(context, (trianglesDict["1"]!["second"]!!["x"] as! CGFloat), (trianglesDict["1"]!["second"]!!["y"] as! CGFloat))
            CGContextMoveToPoint(context, (trianglesDict["1"]!["second"]!!["x"] as! CGFloat), (trianglesDict["1"]!["second"]!!["y"] as! CGFloat))
            CGContextAddLineToPoint(context, (trianglesDict["1"]!["third"]!!["x"] as! CGFloat), (trianglesDict["1"]!["third"]!!["y"] as! CGFloat))
            CGContextMoveToPoint(context, (trianglesDict["1"]!["third"]!!["x"] as! CGFloat), (trianglesDict["1"]!["third"]!!["y"] as! CGFloat))
            CGContextAddLineToPoint(context, (trianglesDict["1"]!["first"]!!["x"] as! CGFloat), (trianglesDict["1"]!["first"]!!["y"] as! CGFloat))
            
            CGContextMoveToPoint(context, (trianglesDict["2"]!["first"]!!["x"] as! CGFloat), (trianglesDict["2"]!["first"]!!["y"] as! CGFloat))
            CGContextAddLineToPoint(context, (trianglesDict["2"]!["second"]!!["x"] as! CGFloat), (trianglesDict["2"]!["second"]!!["y"] as! CGFloat))
            CGContextMoveToPoint(context, (trianglesDict["2"]!["second"]!!["x"] as! CGFloat), (trianglesDict["2"]!["second"]!!["y"] as! CGFloat))
            CGContextAddLineToPoint(context, (trianglesDict["2"]!["third"]!!["x"] as! CGFloat), (trianglesDict["2"]!["third"]!!["y"] as! CGFloat))
            CGContextMoveToPoint(context, (trianglesDict["2"]!["third"]!!["x"] as! CGFloat), (trianglesDict["2"]!["third"]!!["y"] as! CGFloat))
            CGContextAddLineToPoint(context, (trianglesDict["2"]!["first"]!!["x"] as! CGFloat), (trianglesDict["2"]!["first"]!!["y"] as! CGFloat))
            
            CGContextMoveToPoint(context, (trianglesDict["3"]!["first"]!!["x"] as! CGFloat), (trianglesDict["3"]!["first"]!!["y"] as! CGFloat))
            CGContextAddLineToPoint(context, (trianglesDict["3"]!["second"]!!["x"] as! CGFloat), (trianglesDict["3"]!["second"]!!["y"] as! CGFloat))
            CGContextMoveToPoint(context, (trianglesDict["3"]!["second"]!!["x"] as! CGFloat), (trianglesDict["3"]!["second"]!!["y"] as! CGFloat))
            CGContextAddLineToPoint(context, (trianglesDict["3"]!["third"]!!["x"] as! CGFloat), (trianglesDict["3"]!["third"]!!["y"] as! CGFloat))
            CGContextMoveToPoint(context, (trianglesDict["3"]!["third"]!!["x"] as! CGFloat), (trianglesDict["3"]!["third"]!!["y"] as! CGFloat))
            CGContextAddLineToPoint(context, (trianglesDict["3"]!["first"]!!["x"] as! CGFloat), (trianglesDict["3"]!["first"]!!["y"] as! CGFloat))
            
        }
          CGContextStrokePath(context)
    }
    
    func setDataSource(dataSource: TrianglesProtocol) {
        self.dataSource = dataSource
    }
        
}
