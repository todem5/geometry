//
//  SettingsViewController.swift
//  geometry
//
//  Created by Dmitry Tolmachev on 21.02.16.
//  Copyright © 2016 Al Digit. All rights reserved.
//

import UIKit

protocol DiceGame: {
    func getColor()
}

class SettingsViewController: UIViewController, DiceGame
{
    var redsvc: CGFloat = 0.0
    var greensvc: CGFloat = 0.0
    var bluesvc: CGFloat = 0.0
    var delegate: DiceGameDelegate?
    
    @IBAction func close(sender: AnyObject) {
        dismissViewControllerAnimated(true, completion: nil)
        delegate?.getColor(self)
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
     }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        redcolor.value = Float(redsvc * 255.0)
        labelRed.text = NSString(format: "%d", Int(redcolor.value)) as String
        greencolor.value = Float(greensvc * 255.0)
        labelGreen.text = NSString(format: "%d", Int(greencolor.value)) as String
        bluecolor.value = Float(bluesvc * 255.0)
        labelBlue.text = NSString(format: "%d", Int(bluecolor.value)) as String
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
}
