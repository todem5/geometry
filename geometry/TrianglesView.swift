//  TrianglesView.swift
//  geometry
//
//  Created by Dmitry Tolmachev on 30.11.15.
//  Copyright © 2015 Al Digit. All rights reserved.

import UIKit
protocol TrianglesViewDataSource: class {
    func getColor(sender: TrianglesView) -> [CGFloat]?
}

class TrianglesView: UIView  {
    var redtv = CGFloat()
    var greentv = CGFloat()
    var bluetv = CGFloat()
    var colorRGB = [CGFloat]()
    
    private var dataSource: TrianglesProtocol?
    weak var dataSourceColor: TrianglesViewDataSource?
    
    override func drawRect(rect: CGRect) {
        let context = UIGraphicsGetCurrentContext()
        CGContextSetLineWidth(context, 3)
        colorRGB = (dataSourceColor?.getColor(self))!

        CGContextSetRGBStrokeColor(context, colorRGB[0], colorRGB[1], colorRGB[2], 1.0)
        let originsCount = 4
        var origins = [CGPoint](count: originsCount, repeatedValue: CGPointZero)

        for shape in dataSource!.getTriangles() {
            if let triangle = shape["points"] as? Array<Dictionary<String, Int>> {
                for i in 0 ..< (originsCount - 1) {
                    origins[i].x = CGFloat(triangle[i]["x"]!)
                    origins[i].y = CGFloat(triangle[i]["y"]!)
                }
                origins[originsCount - 1].x = CGFloat(triangle[0]["x"]!)
                origins[originsCount - 1].y = CGFloat(triangle[0]["y"]!)
            }

            CGContextAddLines(context, origins, originsCount)
        }

        CGContextStrokePath(context)
    }

    func setDataSource(dataSource: TrianglesProtocol) {
        self.dataSource = dataSource
    }
}