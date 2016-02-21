//  TrianglesView.swift
//  geometry
//
//  Created by Dmitry Tolmachev on 30.11.15.
//  Copyright © 2015 Al Digit. All rights reserved.

import UIKit

class TrianglesView: UIView {
    private var dataSource: TrianglesProtocol?
    
    override func drawRect(rect: CGRect) {
        UIColor.greenColor().set()
        let context = UIGraphicsGetCurrentContext()
        CGContextSetLineWidth(context, 3)
    
        if let trianglesDict = dataSource?.getTriangles(){
            let lineOriginsCount = 3*2
            var lineOrigins = [Array<AnyObject>](count: lineOriginsCount,repeatedValue: 0)
            CGContextMoveToPoint(context, lineOrigins[0] as! CGFloat, lineOrigins[1] as! CGFloat)
            for n in 0...lineOriginsCount*2-1
            {
                lineOrigins[n] = trianglesDict[n]
                print("\(lineOrigins[n])")
                CGContextAddLineToPoint(context, (trianglesDict[n].x as! CGFloat), (trianglesDict[n].y as! CGFloat))
                CGContextMoveToPoint(context, (trianglesDict[n].x as! CGFloat), (trianglesDict[n].y as! CGFloat))
                //CGContextAddLines(context, lineOrigins[n],lineOrigins[n+1])
            }
            CGContextStrokePath(context)
        }
    
        func setDataSource(dataSource: TrianglesProtocol)
            {
            self.dataSource = dataSource
            }
    }
}