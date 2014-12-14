//
//  ViewController.swift
//  Tipster
//
//  Created by Shrikar Archak on 12/13/14.
//  Copyright (c) 2014 Shrikar Archak. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var tipControl: UISegmentedControl!
    @IBOutlet weak var tipLabel: UILabel!
    @IBOutlet weak var amountLabel: UITextField!
    @IBOutlet weak var totalLabel: UILabel!
    var userDefaults : NSUserDefaults?
    let tips = [ 18, 20, 25]
    var defaultTip : Int?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tipLabel.text = "$0.00"
        self.totalLabel.text = "$0.00"

        tipControl.layer.cornerRadius = 5.0
        tipControl.layer.masksToBounds = true
        tipControl.tintColor = UIColor(red: 92.0/255, green: 69.0/255, blue: 133.0/255, alpha: 0.8)
        tipControl.selectedSegmentIndex = 0
        
        userDefaults = NSUserDefaults.standardUserDefaults()
        
        defaultTip = userDefaults?.integerForKey("defaultTip")
        
        for (index,tmp) in enumerate(tips) {
            NSLog("### Val :\(index) \(tmp)")
            if(defaultTip == tmp){
                tipControl.selectedSegmentIndex = index
            }
        }
    }
    
    override func viewWillAppear(animated: Bool) {
        defaultTip = userDefaults?.integerForKey("defaultTip")
        
        for (index,tmp) in enumerate(tips) {
            NSLog("### Val :\(index) \(tmp)")
            if(defaultTip == tmp){
                tipControl.selectedSegmentIndex = index
            }
        }
        editTextAction(self)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    
    }

    @IBAction func onTap(sender: AnyObject) {
        view.endEditing(true)
    }
    
    @IBAction func editTextAction(sender: AnyObject) {
        NSLog("Edit action : \(tipControl.selectedSegmentIndex)")

        let bill = (amountLabel.text as NSString).doubleValue
        let total = bill + bill * (Double(tips[tipControl.selectedSegmentIndex])/100)
        totalLabel.text = NSString(format: "$%.2f", total)
        tipLabel.text = NSString(format: "$%.2f", bill * Double(tips[tipControl.selectedSegmentIndex])/100)
    }

}

