//
//  InterfaceController.swift
//  WatchApp WatchKit Extension
//
//  Created by 지찬우 on 2021/12/07.
//

import WatchKit
import Foundation


class InterfaceController: WKInterfaceController {

    @IBOutlet var asdf: WKInterfaceMap!
    override func awake(withContext context: Any?) {
        // Configure interface objects here.
    }
    
    override func willActivate() {
        // This method is called when watch view controller is about to be visible to user
    }
    
    override func didDeactivate() {
        // This method is called when watch view controller is no longer visible
    }

}
