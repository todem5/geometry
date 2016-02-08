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
    
            var arr: [NSArray]
            arr = trianglesDict as! [NSArray]
        
            let lineOriginsCount = 3
    
            for n in 0...lineOriginsCount-1
            {
                print("\(trianglesDict[n])")
            }
            CGContextStrokePath(context)
        }
    
        func setDataSource(dataSource: TrianglesProtocol)
            {
            self.dataSource = dataSource
            }
    }
}