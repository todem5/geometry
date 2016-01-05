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
            
            
            for key : AnyObject in trianglesDict.allKeys{
                let stringKey: String = key as! String
                if let _ : AnyObject = trianglesDict.valueForKey(stringKey) {
                        
                }
                
            }

            
        }
          CGContextStrokePath(context)
    }
    
    func setDataSource(dataSource: TrianglesProtocol) {
        self.dataSource = dataSource
    }
        
}
