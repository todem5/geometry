//  TrianglesViewController
//  geometry
//
//  Created by Dmitry Tolmachev on 30.11.15.
//  Copyright © 2015 Al Digit. All rights reserved.

import UIKit

class TrianglesViewController: UIViewController, SettingsViewControllerDelegate, TrianglesProtocol, TrianglesViewDataSource {
    private var triangles: Array<AnyObject> = []
    var redtvc: Float = 0.0
    var greentvc: Float = 0.0
    var bluetvc: Float = 0.0
    
    @IBOutlet weak var trianglesView: TrianglesView! {
        didSet {
            trianglesView.dataSourceColor = self
        }
    }
    @IBAction func settingbutton(sender: AnyObject) {
    }
        
    func loadTriangles() {
        if let path = NSBundle.mainBundle().pathForResource("triangles", ofType: "plist") {
            triangles = (NSArray(contentsOfFile: path) as? Array<AnyObject>)!
        }
    }
    
    func getTriangles() -> Array<AnyObject> {
        return triangles
    }
    func setColor(rColor: Float, gColor: Float, bColor: Float) {
        redtvc = rColor
        greentvc = gColor
        bluetvc = bColor
    }
    
    func getColor(sender: TrianglesView) -> [Float]? {
        return [redtvc,greentvc,bluetvc]
    }
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        loadTriangles()
        (self.view as! TrianglesView).setDataSource(self)
    }
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "editSetting" {
            let nav = segue.destinationViewController as! UINavigationController
            let destinationVC = nav.topViewController as! SettingsViewController
            destinationVC.delegate = self
            destinationVC.redsvc = redtvc
            destinationVC.greensvc = greentvc
            destinationVC.bluesvc = bluetvc            
        }
    }
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        self.view.setNeedsDisplay()
    }
}