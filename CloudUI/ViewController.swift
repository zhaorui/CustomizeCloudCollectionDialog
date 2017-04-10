//
//  ViewController.swift
//  CloudUI
//
//  Created by 赵睿 on 07/04/2017.
//  Copyright © 2017 com.homebrew.zhaorui. All rights reserved.
//

import Cocoa

class ViewController: NSViewController {
    
    var customize_cloud_btn_wc : CustomWindowController?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }

    override var representedObject: Any? {
        didSet {
        // Update the view, if already loaded.
        }
    }

    @IBAction func showCustomButtonWindow(_ sender: NSButton) {
        customize_cloud_btn_wc = CustomWindowController(windowNibName: "CustomWindowController")
        customize_cloud_btn_wc?.showWindow(self)
        self.view.window?.addChildWindow((customize_cloud_btn_wc?.window)!, ordered: .above)
    }

}




