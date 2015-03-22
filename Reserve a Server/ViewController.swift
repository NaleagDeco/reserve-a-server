//
//  ViewController.swift
//  Reserve a Server
//
//  Created by Gaelan D'costa on 2015-03-21.
//  Copyright (c) 2015 Gaelan D'costa. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource {
    let fb = Firebase(url: "https://dazzling-fire-7049.firebaseio.com/")
    let cellIdentifier = "ServerItem"
    
    var servers : [Server] = []
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        fb.observeEventType(.Value, withBlock: populateServerList)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func populateServerList(fds : FDataSnapshot!) {
        let serverList = fds.value["servers"] as [String: Bool]
        
        servers = map(serverList, {s in Server(s)})
        tableView.reloadData()
    }
    
    // MARK: UITableViewDataSource conformity
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return servers.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier(cellIdentifier) as ServerCellView
        let server = servers[indexPath.row]
        
        cell.setFromServer(server)
        return cell
    }
}
