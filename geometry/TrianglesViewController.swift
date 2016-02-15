//  TrianglesViewController
//  geometry
//
//  Created by Dmitry Tolmachev on 30.11.15.
//  Copyright © 2015 Al Digit. All rights reserved.

import UIKit

class TrianglesViewController: UIViewController, TrianglesProtocol {
    private var trianglesDict: Array<Int>?
    
    @IBAction func loadTriangles(sender: UIButton) {
        if let path = NSBundle.mainBundle().pathForResource("triangles", ofType: "plist") {
            if let dict = NSArray(contentsOfFile: path)
            {
                trianglesDict = dict as? Array<Int>
            }
        }
        self.view.setNeedsDisplay()
    }
    
    func getTriangles() -> Array<Int>? {
        return trianglesDict
    }
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        //(self.view as! TrianglesView).setDataSource(self)
    }
    
}