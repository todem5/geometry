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
            var n = 0
            var numbers = [1:"1",2:"2",3:"3"]
            
            for n in 1...3 {
            CGContextMoveToPoint(context, (trianglesDict[numbers[n]!]!["first"]!!["x"] as! CGFloat), (trianglesDict[numbers[n]!]!["first"]!!["y"] as! CGFloat))
            CGContextAddLineToPoint(context, (trianglesDict[numbers[n]!]!["second"]!!["x"] as! CGFloat), (trianglesDict[numbers[n]!]!["second"]!!["y"] as! CGFloat))
            CGContextMoveToPoint(context, (trianglesDict[numbers[n]!]!["second"]!!["x"] as! CGFloat), (trianglesDict[numbers[n]!]!["second"]!!["y"] as! CGFloat))
            CGContextAddLineToPoint(context, (trianglesDict[numbers[n]!]!["third"]!!["x"] as! CGFloat), (trianglesDict[numbers[n]!]!["third"]!!["y"] as! CGFloat))
            CGContextMoveToPoint(context, (trianglesDict[numbers[n]!]!["third"]!!["x"] as! CGFloat), (trianglesDict[numbers[n]!]!["third"]!!["y"] as! CGFloat))
            CGContextAddLineToPoint(context, (trianglesDict[numbers[n]!]!["first"]!!["x"] as! CGFloat), (trianglesDict[numbers[n]!]!["first"]!!["y"] as! CGFloat))
            }
        CGContextStrokePath(context)
        }
        func setDataSource(dataSource: TrianglesProtocol) {
                    self.dataSource = dataSource
        }
    }
}