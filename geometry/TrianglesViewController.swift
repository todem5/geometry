//  TrianglesViewController
//  geometry
//
//  Created by Dmitry Tolmachev on 30.11.15.
//  Copyright © 2015 Al Digit. All rights reserved.

import UIKit

class TrianglesViewController: UIViewController, TrianglesProtocol, ColorProtocol, SettingsViewControllerDelegate, , UINavigationControllerDelegate {
    private var triangles: Array<AnyObject> = []
    
    private var redtvc: CGFloat = 1.0
    private var greentvc: CGFloat = 1.0
    private var bluetvc: CGFloat = 1.0
    private var colors: [(CGFloat, CGFloat, CGFloat)] = [(0,0,0)]
    
    @IBAction func settingbutton(sender: AnyObject) {
        
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
    func getColor() -> Array<AnyObjects> {
        return colors
    }
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        (self.view as! TrianglesView).setDataSource(self)
        (self.view as! TrianglesView).setColorSource(self, greentv: self, bluetv: self)
    }
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "editSetting" {
        let destination = segue.destinationViewController
            if let svc = destination as? SettingsViewController {
                svc.delegate = self
                svc.redsvc = redtvc
                svc.greensvc = greentvc
                svc.bluesvc = bluetvc
            }
        }
    }
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        //navigationController?.delegate = self
    }
}

extension TrianglesViewController: SettingsViewControllerDelegate {
    func settingsViewControllerFinished(settingsViewController: SettingsViewController) {
        self.redtvc = settingsViewController.redsvc
        self.greentvc = settingsViewController.greensvc
        self.bluetvc = settingsViewController.bluesvc
    }
}