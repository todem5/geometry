//
//  ViewController.swift
//  geometry
//
//  Created by Dmitry Tolmachev on 30.11.15.
//  Copyright © 2015 Al Digit. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    var arr=[]
    @IBAction func loadTriangle(sender: UIButton) {
        var myDict: NSDictionary?
        if let path = NSBundle.mainBundle().pathForResource("data", ofType: "plist") {
            myDict = NSDictionary(contentsOfFile: path)
        }
        if let dict = myDict {
            print("1", [myDict?.valueForKey("x1")] )
            print("2", [myDict?.valueForKey("y1")] )
            print("кол-во", [myDict?.count] )
            //arr[0]=myDict?.valueForKey("x1")
            myDict?.valueForKey("y1")
            myDict?.valueForKey("x2")
            
            for var i = 1; i <= myDict?.count; i++ {
                arr[]=myDict?.mutableArrayValueForKey(i)
                
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
