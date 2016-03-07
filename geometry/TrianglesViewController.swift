//  TrianglesViewController
//  geometry
//
//  Created by Dmitry Tolmachev on 30.11.15.
//  Copyright © 2015 Al Digit. All rights reserved.

import UIKit

class TrianglesViewController: UIViewController, TrianglesProtocol {
    private var triangles: Array<AnyObject> = []
    var colors: [(CGFloat, CGFloat, CGFloat)] = [(0,0,0)]
    var redtvc: CGFloat = 1.0
    var greentvc: CGFloat = 1.0
    var bluetvc: CGFloat = 1.0
    @IBAction func settingbutton(sender: UIButton) {
        
        }
    @IBAction func loadTriangles(sender: UIButton) {
        if let path = NSBundle.mainBundle().pathForResource("triangles", ofType: "plist") {
            triangles = (NSArray(contentsOfFile: path) as? Array<AnyObject>)!
        }
        self.view.setNeedsDisplay()
        
    }

    func getTriangles() -> Array<AnyObject> {
        return triangles
    }

    override func viewDidLoad()
    {
        super.viewDidLoad()
        (self.view as! TrianglesView).setDataSource(self)
    }
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
            let destination = segue.destinationViewController
            if let svc = destination as? SettingsViewController {
                svc.delegate = self
                svc.redsvc = redtvc
                svc.greensvc = greentvc
                svc.bluesvc = bluetvc
            }
        }
    }

extension TrianglesViewController: SettingsViewControllerDelegate {
    func settingsViewControllerFinished(settingsViewController: SettingsViewController) {
        self.redtvc = settingsViewController.redsvc
        self.greentvc = settingsViewController.greensvc
        self.bluetvc = settingsViewController.bluesvc
        //self.redtvc = settingsViewController.redcolor.value
    }
}