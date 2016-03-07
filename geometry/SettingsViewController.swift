//
//  SettingsViewController.swift
//  geometry
//
//  Created by Dmitry Tolmachev on 21.02.16.
//  Copyright © 2016 Al Digit. All rights reserved.
//

import UIKit

protocol SettingsViewControllerDelegate: class {
    func settingsViewControllerFinished(settingsViewController: SettingsViewController)
}

class SettingsViewController: UIViewController
{
    
    var redsvc: CGFloat = 0.0
    var greensvc: CGFloat = 0.0
    var bluesvc: CGFloat = 0.0
    weak var delegate: SettingsViewControllerDelegate?
    
    @IBAction func close(sender: AnyObject) {
        dismissViewControllerAnimated(true, completion: nil)
        self.delegate?.settingsViewControllerFinished(self)
    }
    
    @IBOutlet weak var redcolor: UISlider!
    @IBOutlet weak var greencolor: UISlider!
    @IBOutlet weak var bluecolor: UISlider! 
    
    @IBOutlet weak var labelRed: UILabel!
    @IBOutlet weak var labelGreen: UILabel!
    @IBOutlet weak var labelBlue: UILabel!
    
    @IBAction func colorChanged(sender: UISlider) {
        redsvc = CGFloat(redcolor.value / 255.0)
        labelRed.text = NSString(format: "%d", Int(redcolor.value)) as String
        greensvc = CGFloat(greencolor.value / 255.0)
        labelGreen.text = NSString(format: "%d", Int(greencolor.value)) as String
        bluesvc = CGFloat(bluecolor.value / 255.0)
        labelBlue.text = NSString(format: "%d", Int(bluecolor.value)) as String
        
        //drawPreview()
    }
    
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        redcolor.value = Float(redsvc * 255.0)
        labelRed.text = NSString(format: "%d", Int(redcolor.value)) as String
        greencolor.value = Float(greensvc * 255.0)
        labelGreen.text = NSString(format: "%d", Int(greencolor.value)) as String
        bluecolor.value = Float(bluesvc * 255.0)
        labelBlue.text = NSString(format: "%d", Int(bluecolor.value)) as String
        
        //drawPreview()
    }
       
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //labelRed.text = NSString(format: "%d", Int(redsvc.value)) as String
        // Do any additional setup after loading the view.
    }
}
