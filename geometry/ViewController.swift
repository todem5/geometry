//
//  ViewController.swift
//  geometry
//
//  Created by Dmitry Tolmachev on 30.11.15.
//  Copyright © 2015 Al Digit. All rights reserved.
//

import UIKit

class ViewController: UIViewController, TrianglesProtocol {
    private var trianglesDict: [String: AnyObject]?
    
    @IBAction func loadTriangle(sender: UIButton) {
        if let path = NSBundle.mainBundle().pathForResource("data2", ofType: "plist") {
            if let dict = NSDictionary(contentsOfFile: path) as? Dictionary<String, AnyObject> {
                trianglesDict = dict
            }
        }
        self.view.setNeedsDisplay()
    }
    
    func getTriangles() -> NSDictionary? {
        return trianglesDict
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        (self.view as! tView).setDataSource(self)
        // Do any additional setup after loading the view.
    }
   
}
