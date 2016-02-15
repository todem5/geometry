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
            let lineOriginsCount = 3
            var lineOrigins = [Int](count: lineOriginsCount,repeatedValue: 0)
            CGContextMoveToPoint(context, lineOrigins[0], lineOrigins[1])
            for n in 0...lineOriginsCount*2-1
            {
                lineOrigins[n] = trianglesDict[n]
                CGContextAddLines(context, lineOrigins[n],lineOrigins[n+1], lineOriginsCount)
            }
            CGContextStrokePath(context)
        }
    
        func setDataSource(dataSource: TrianglesProtocol)
            {
            self.dataSource = dataSource
            }
    }
}