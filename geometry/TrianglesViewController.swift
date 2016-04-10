//  TrianglesViewController
//  geometry
//
//  Created by Dmitry Tolmachev on 30.11.15.
//  Copyright © 2015 Al Digit. All rights reserved.

import UIKit

class TrianglesViewController: UIViewController, TrianglesProtocol, TrianglesViewDataSource {
    private var triangles: Array<AnyObject> = []
    
//    private var redtvc = CGFloat() {didSet { updateUI()  } }
//    private var greentvc = CGFloat() {didSet { updateUI()  } }
//    private var bluetvc = CGFloat() {didSet { updateUI()  } }
//    private var colors = [CGFloat]()
    
    @IBOutlet weak var trianglesView: TrianglesView! {
        didSet {
            trianglesView.dataSourceColor = self
        }
    }
    
    @IBAction func settingbutton(sender: AnyObject) {
        self.view.setNeedsDisplay()
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
    func getColor(sender: TrianglesView) -> [Float]? {
        let settings = Settings.sharedInstance
        return [settings.red,settings.green,settings.blue]
    }
    func updateUI() {
        trianglesView?.setNeedsDisplay()
    }
    
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        (self.view as! TrianglesView).setDataSource(self)
    }
//    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
//        if segue.identifier == "editSetting" {
//        let destination = segue.destinationViewController
//            if let svc = destination as? SettingsViewController {
//                svc.settings = Settings
//            }
//        }
//    }
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
    }
}

//extension TrianglesViewController: SettingsViewControllerDelegate {
//    func settingsViewControllerDelegate(sender: SettingsViewController) {
//        self.redtvc = sender.redsvc
//        self.greentvc = sender.greensvc
//        self.bluetvc = sender.bluesvc
//    }
//}