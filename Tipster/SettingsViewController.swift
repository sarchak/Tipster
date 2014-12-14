//
//  SettingsViewController.swift
//  Tipster
//
//  Created by Shrikar Archak on 12/13/14.
//  Copyright (c) 2014 Shrikar Archak. All rights reserved.
//

import UIKit

class SettingsViewController: UIViewController {

    @IBOutlet weak var tipLabel: UILabel!
    @IBOutlet weak var tipControl: UISegmentedControl!
    let tips = [18, 20, 25]
    var userDefaults : NSUserDefaults?
    let defaultTip: Double?
    override func viewDidLoad() {
        super.viewDidLoad()
        
        userDefaults = NSUserDefaults.standardUserDefaults()
        let tipVal = userDefaults?.integerForKey("defaultTip")
        tipControl.selectedSegmentIndex = 0
        for (index,tmp) in enumerate(tips) {
            if(tipVal == tmp){
                tipControl.selectedSegmentIndex = index
            }
        }
        tipControl.layer.cornerRadius = 5.0
        tipControl.layer.masksToBounds = true
        tipControl.tintColor = UIColor(red: 92.0/255, green: 69.0/255, blue: 133.0/255, alpha: 0.8)
        

    }
    override func viewWillAppear(animated: Bool) {
        self.view.alpha = 0.6
        UIView.animateWithDuration(1.5, animations: { () -> Void in
            self.view.alpha = 1.0
        })

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func donePressed(sender: AnyObject) {
        self.dismissViewControllerAnimated(true , completion: { () -> Void in
            
        })
    }
    
    
    @IBAction func valueChanged(sender: AnyObject) {

        let currTip = tips[tipControl.selectedSegmentIndex]
        self.tipLabel.text = "Default tip is \(currTip)%"
        userDefaults?.setInteger(currTip, forKey: "defaultTip")
        userDefaults?.synchronize()
    }
    
}
