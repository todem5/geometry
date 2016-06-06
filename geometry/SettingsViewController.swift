//
//  SettingsViewController.swift
//  geometry
//
//  Created by Dmitry Tolmachev on 21.02.16.
//  Copyright © 2016 Al Digit. All rights reserved.
//

import UIKit

protocol SettingsViewControllerDelegate: class {
    func fillSettingsViewControllerDelegate(rColor: Float, gColor: Float, bColor: Float)
}

class SettingsViewController: UIViewController
{
    var delegate: SettingsViewControllerDelegate?
    var redsvc = Float()
    var greensvc = Float()
    var bluesvc = Float()
       
    @IBOutlet weak var redSlider: UISlider!
    @IBOutlet weak var greenSlider: UISlider!
    @IBOutlet weak var blueSlider: UISlider!
    
    @IBOutlet weak var redLabel: UILabel!
    @IBOutlet weak var greenLabel: UILabel!
    @IBOutlet weak var blueLabel: UILabel!
    
    @IBAction func close(sender: AnyObject) {
        dismissViewControllerAnimated(true, completion: nil)
        let rColor = Float(redSlider.value / 255)
        let gColor = Float(greenSlider.value / 255)
        let bColor = Float(blueSlider.value / 255)
        delegate?.fillSettingsViewControllerDelegate(rColor,gColor: gColor,bColor: bColor)
        navigationController?.popViewControllerAnimated(true)
    }
    
    @IBAction func colorChanged(sender: UISlider) {
        redsvc = Float(redSlider.value / 255)
        redLabel.text = NSString(format: "%d", Int(redSlider.value)) as String
        greensvc = Float(greenSlider.value / 255)
        greenLabel.text = NSString(format: "%d", Int(greenSlider.value)) as String
        bluesvc = Float(blueSlider.value / 255)
        blueLabel.text = NSString(format: "%d", Int(blueSlider.value)) as String
     }
   
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        redSlider.value = Float(redsvc * 255)
        redLabel.text = NSString(format: "%d", Int(redSlider.value)) as String
        greenSlider.value = Float(greensvc * 255)
        greenLabel.text = NSString(format: "%d", Int(greenSlider.value)) as String
        blueSlider.value = Float(bluesvc * 255)
        blueLabel.text = NSString(format: "%d", Int(blueSlider.value)) as String
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        }
}
