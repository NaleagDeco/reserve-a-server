//
//  ViewController.swift
//  Reserve a Server
//
//  Created by Gaelan D'costa on 2015-03-21.
//  Copyright (c) 2015 Gaelan D'costa. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    let fb = Firebase(url: "https://dazzling-fire-7049.firebaseio.com/")!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        fb.observeEventType(.Value, withBlock: displayValues)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func displayValues(fds : FDataSnapshot!) -> Void {
        println(fds.value)
    }


}

