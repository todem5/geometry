//
//  SettingsViewController.swift
//  geometry
//
//  Created by Dmitry Tolmachev on 21.02.16.
//  Copyright © 2016 Al Digit. All rights reserved.
//

import UIKit

protocol SettingsViewControllerDelegate: class {
    func settingsViewControllerDelegate(sender: SettingsViewController)
}

class SettingsViewController: UIViewController
{
    var settings = Settings()
    
    weak var delegate: SettingsViewControllerDelegate?
    
    @IBAction func close(sender: AnyObject) {
        dismissViewControllerAnimated(true, completion: nil)
        delegate?.settingsViewControllerDelegate(self)
    }
    
    @IBOutlet weak var redСolor: UISlider!
    @IBOutlet weak var greenСolor: UISlider!
    @IBOutlet weak var blueСolor: UISlider!
    
    @IBOutlet weak var labelRed: UILabel!
    @IBOutlet weak var labelGreen: UILabel!
    @IBOutlet weak var labelBlue: UILabel!
    
    
    
    
    @IBAction func colorChanged(sender: UISlider) {
        Settings.sharedInstance.red = Float(redСolor.value / 255)
        labelRed.text = NSString(format: "%d", Int(redСolor.value)) as String
        Settings.sharedInstance.green = Float(greenСolor.value / 255)
        labelGreen.text = NSString(format: "%d", Int(greenСolor.value)) as String
        Settings.sharedInstance.blue = Float(blueСolor.value / 255)
        labelBlue.text = NSString(format: "%d", Int(blueСolor.value)) as String
     }
   
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        redСolor.value = Float(Settings.sharedInstance.red * 255)
        labelRed.text = NSString(format: "%d", Int(redСolor.value)) as String
        greenСolor.value = Float(Settings.sharedInstance.green * 255)
        labelGreen.text = NSString(format: "%d", Int(greenСolor.value)) as String
        blueСolor.value = Float(Settings.sharedInstance.blue * 255)
        labelBlue.text = NSString(format: "%d", Int(blueСolor.value)) as String
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        }
}
