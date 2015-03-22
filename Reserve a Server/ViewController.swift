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
    var servers : Array<(String, Bool)> = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        fb.observeEventType(.Value, withBlock: populateServerList)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func populateServerList(fds : FDataSnapshot!) -> Void {
        let serverList = fds.value["servers"] as Dictionary<String, Bool>
        
        servers = map(serverList, {s in s})
        println(servers)
    }


}

