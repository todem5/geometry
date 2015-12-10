//
//  View1.swift
//  geometry
//
//  Created by Dmitry Tolmachev on 30.11.15.
//  Copyright © 2015 Al Digit. All rights reserved.
//

import UIKit

class tView: UIView {
    private var dataSource: TrianglesProtocol?
    
    override func drawRect(rect: CGRect) {
        UIColor.greenColor().set()
        let context = UIGraphicsGetCurrentContext()
        CGContextSetLineWidth(context, 3)
        
        if let trianglesDict = dataSource?.getTriangles(){
            CGContextMoveToPoint(context, (trianglesDict["first"]!["x"] as! CGFloat), (trianglesDict["first"]!["y"] as! CGFloat))

            for (_,value) in trianglesDict {
                CGContextAddLineToPoint(context, (value["x"] as! CGFloat), (value["y"] as! CGFloat))
                CGContextMoveToPoint(context, (value["x"] as! CGFloat), (value["y"] as! CGFloat))
            }
            CGContextAddLineToPoint(context, (trianglesDict["first"]!["x"] as! CGFloat), (trianglesDict["first"]!["y"] as! CGFloat))
        }
          CGContextStrokePath(context)
    }
    
    func setDataSource(dataSource: TrianglesProtocol) {
        self.dataSource = dataSource
    }
        
}
