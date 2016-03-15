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

        let originsCount = 4
        var origins = [CGPoint](count: originsCount, repeatedValue: CGPointZero)

        for shape in dataSource!.getTriangles() {
            if let triangle = shape["points"] as? Array<Dictionary<String, Int>> {
                for i in 0 ..< originsCount {
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