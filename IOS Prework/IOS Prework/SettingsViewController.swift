//
//  SettingsViewController.swift
//  IOS Prework
//
//  Created by Trang Do on 7/14/22.
//

import UIKit

class SettingsViewController: UIViewController {
    
    @IBOutlet weak var mode: UISwitch!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        let defaults = UserDefaults.standard
        if (defaults.object(forKey: "SwitchState") != nil) {
            mode.isOn = defaults.bool(forKey: "SwitchState")
        }
    }
    
    @IBAction func Mode(_ sender: Any) {
        let defaults = UserDefaults.standard
            if mode.isOn {
                defaults.set(true, forKey: "SwitchState")
                overrideUserInterfaceStyle = .light
            } else {
                overrideUserInterfaceStyle = .dark
                defaults.set(false, forKey: "SwitchState")
            }
        self.parent?.overrideUserInterfaceStyle = self.overrideUserInterfaceStyle
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
