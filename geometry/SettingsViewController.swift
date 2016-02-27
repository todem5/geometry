//
//  SettingsViewController.swift
//  geometry
//
//  Created by Dmitry Tolmachev on 21.02.16.
//  Copyright © 2016 Al Digit. All rights reserved.
//

import UIKit

class SettingsViewController: UIViewController
{

    @IBAction func doneUnwindAction(unwindSeque: UIStoryboardSegue) {
        if let tViewController = unwindSeque.sourceViewController as? SettingsViewController {
            print ("unwind")
        }
    }
    
    @IBOutlet weak var redcolor: UISlider! { didSet { UpdateUI() } }
    @IBOutlet weak var greencolor: UISlider!
    @IBOutlet weak var bluecolor: UISlider! 
    
    func UpdateUI() {
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        UpdateUI()
        // Do any additional setup after loading the view.
    }
}
