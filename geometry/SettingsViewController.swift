//
//  SettingsViewController.swift
//  geometry
//
//  Created by Dmitry Tolmachev on 21.02.16.
//  Copyright © 2016 Al Digit. All rights reserved.
//

import UIKit

protocol SettingsViewControllerDelegate {
    func setColor(rColor: Float, gColor: Float, bColor: Float)
}

class SettingsViewController: UIViewController
{
    var delegate: SettingsViewControllerDelegate?
    var redsvc = Float()
    var greensvc = Float()
    var bluesvc = Float()
    
    @IBOutlet weak var redСolor: UISlider!
    @IBOutlet weak var greenСolor: UISlider!
    @IBOutlet weak var blueСolor: UISlider!
    
    @IBOutlet weak var labelRed: UILabel!
    @IBOutlet weak var labelGreen: UILabel!
    @IBOutlet weak var labelBlue: UILabel!
    
    @IBAction func close(sender: UIButton) {
        dismissViewControllerAnimated(true, completion: nil)
        let rColor = Float(redСolor.value / 255)
        let gColor = Float(greenСolor.value / 255)
        let bColor = Float(blueСolor.value / 255)
        delegate?.setColor(rColor, gColor: gColor, bColor: bColor)
        navigationController?.popViewControllerAnimated(true)
    }
    
    @IBAction func colorChanged(sender: UISlider) {
        redsvc = Float(redСolor.value / 255)
        labelRed.text = NSString(format: "%d", Int(redСolor.value)) as String
        greensvc = Float(greenСolor.value / 255)
        labelGreen.text = NSString(format: "%d", Int(greenСolor.value)) as String
        bluesvc = Float(blueСolor.value / 255)
        labelBlue.text = NSString(format: "%d", Int(blueСolor.value)) as String
    }
   
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        redСolor.value = Float(redsvc * 255)
        labelRed.text = NSString(format: "%d", Int(redСolor.value)) as String
        greenСolor.value = Float(greensvc * 255)
        labelGreen.text = NSString(format: "%d", Int(greenСolor.value)) as String
        blueСolor.value = Float(bluesvc * 255)
        labelBlue.text = NSString(format: "%d", Int(blueСolor.value)) as String
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        }
}
