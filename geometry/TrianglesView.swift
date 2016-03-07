//  TrianglesView.swift
//  geometry
//
//  Created by Dmitry Tolmachev on 30.11.15.
//  Copyright © 2015 Al Digit. All rights reserved.

import UIKit

class TrianglesView: UIView  {
    var redtv: CGFloat = 0
    var greentv: CGFloat = 0
    var bluetv: CGFloat = 0
    
    private var dataSource: TrianglesProtocol?
    override func drawRect(rect: CGRect) {
        let context = UIGraphicsGetCurrentContext()
        CGContextSetLineWidth(context, 3)
        CGContextSetRGBStrokeColor(context, redtv, greentv, bluetv, 1.0)
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

extension TrianglesView: SettingsViewControllerDelegate {
    func settingsViewControllerFinished(settingsViewController: SettingsViewController) {
        self.redtv = settingsViewController.redsvc
        self.greentv = settingsViewController.greensvc
        self.bluetv = settingsViewController.bluesvc
    }
}