//  TrianglesView.swift
//  geometry
//
//  Created by Dmitry Tolmachev on 30.11.15.
//  Copyright © 2015 Al Digit. All rights reserved.

import UIKit
protocol TrianglesViewDataSource: class {
    func getColor(sender: TrianglesView) -> [Float]?
}

@IBDesignable
class TrianglesView: UIView  {
    
    @IBInspectable
    var colorRGB = [Float]() { didSet { setNeedsDisplay() } }
        
    private var dataSource: TrianglesProtocol?
    
    weak var dataSourceColor: TrianglesViewDataSource?
    
    override func drawRect(rect: CGRect) {
        let context = UIGraphicsGetCurrentContext()
        CGContextSetLineWidth(context, 3)
        if let color = dataSourceColor?.getColor(self) {
            colorRGB = color
            CGContextSetRGBStrokeColor(context,
                                       CGFloat(colorRGB[0]),
                                       CGFloat(colorRGB[1]),
                                       CGFloat(colorRGB[2]),
                                       1.0)
        } else {
            UIColor.greenColor().set()
        }
        let originsCount = 4
        var origins = [CGPoint](count: originsCount, repeatedValue: CGPointZero)

        for shape in dataSource!.getTriangles() {
            if let triangle = shape["points"] as? Array<Dictionary<String, Int>> {
                for i in 0 ..< (originsCount - 1) {
                    origins[i].x = CGFloat(triangle[i % (originsCount - 1)]["x"]!)
                    origins[i].y = CGFloat(triangle[i % (originsCount - 1)]["y"]!)
                }
            }

            CGContextAddLines(context, origins, originsCount)
        }

        CGContextStrokePath(context)
    }

    func setDataSource(dataSource: TrianglesProtocol) {
        self.dataSource = dataSource
    }
}