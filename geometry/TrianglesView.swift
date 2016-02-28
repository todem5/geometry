//  TrianglesView.swift
//  geometry
//
//  Created by Dmitry Tolmachev on 30.11.15.
//  Copyright © 2015 Al Digit. All rights reserved.

import UIKit

class TrianglesView: UIView {
    private var dataSource: TrianglesProtocol?
    var redt: CGFloat = 0.0
    var greent: CGFloat = 0.0
    var bluet: CGFloat = 0.0
    override func drawRect(rect: CGRect) {
        
        let context = UIGraphicsGetCurrentContext()
        CGContextSetLineWidth(context, 3)
        CGContextSetRGBStrokeColor(context, redt, greent, bluet, 1.0)
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
    func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        let settingsViewController = segue.destinationViewController as! SettingsViewController
        settingsViewController.delegate = self
        settingsViewController.red = redt
        settingsViewController.green = greent
        settingsViewController.blue = bluet
    }
}

extension TrianglesView: SettingsViewControllerDelegate {
    func settingsViewControllerFinished(settingsViewController: SettingsViewController) {
        self.redt = settingsViewController.red
        self.greent = settingsViewController.green
        self.bluet = settingsViewController.blue
    }
}