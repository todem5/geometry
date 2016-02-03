//
//  TrianglesView.swift
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

        if let trianglesDict = dataSource?.getTriangles() {
            for n in ["1", "2", "3"] {
                CGContextMoveToPoint(context, (trianglesDict[n]!["first"]!!["x"] as! CGFloat), (trianglesDict[n]!["first"]!!["y"] as! CGFloat))
                CGContextAddLineToPoint(context, (trianglesDict[n]!["second"]!!["x"] as! CGFloat), (trianglesDict[n]!["second"]!!["y"] as! CGFloat))
                CGContextMoveToPoint(context, (trianglesDict[n]!["second"]!!["x"] as! CGFloat), (trianglesDict[n]!["second"]!!["y"] as! CGFloat))
                CGContextAddLineToPoint(context, (trianglesDict[n]!["third"]!!["x"] as! CGFloat), (trianglesDict[n]!["third"]!!["y"] as! CGFloat))
                CGContextMoveToPoint(context, (trianglesDict[n]!["third"]!!["x"] as! CGFloat), (trianglesDict[n]!["third"]!!["y"] as! CGFloat))
                CGContextAddLineToPoint(context, (trianglesDict[n]!["first"]!!["x"] as! CGFloat), (trianglesDict[n]!["first"]!!["y"] as! CGFloat))
            }
            CGContextStrokePath(context)
        }
    }

    func setDataSource(dataSource: TrianglesProtocol) {
        self.dataSource = dataSource
    }
}
