//
//  ViewController.swift
//  geometry
//
//  Created by Dmitry Tolmachev on 30.11.15.
//  Copyright © 2015 Al Digit. All rights reserved.
//

import UIKit

let XKey = "x"
let YKey = "y"
public var xID = [0,0]
public var yID = [0,0]

class ViewController: UIViewController {
    
    @IBAction func loadTriangle(sender: UIButton) {
        var myDict: NSDictionary?
        if let path = NSBundle.mainBundle().pathForResource("data2", ofType: "plist") {
            myDict = NSDictionary(contentsOfFile: path)
        }
        if let dict = myDict {
            print("1", [myDict?.valueForKey("x")] )
            print("2", [myDict?.valueForKey("y")] )
            print("dict size", [myDict?.count] )

            for (key, value) in dict {
                print("\(key): \(value)")
                xID = dict.objectForKey(XKey)! as! [Int]
                yID = dict.objectForKey(YKey)! as! [Int]
                print("\(xID): \(yID)")
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */
}
