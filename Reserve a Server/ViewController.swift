//
//  ViewController.swift
//  Reserve a Server
//
//  Created by Gaelan D'costa on 2015-03-21.
//  Copyright (c) 2015 Gaelan D'costa. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource {
    let fb = Firebase(url: "https://dazzling-fire-7049.firebaseio.com/").childByAppendingPath("servers")
    let cellIdentifier = "ServerItem"
    
    var servers: [Server] = []
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var spinner: UIActivityIndicatorView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        showLoadingView()
        fb.observeEventType(.Value, withBlock: populateServerList)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func populateServerList(fds : FDataSnapshot!) {
        showLoadingView()
        
        let serverList = fds.value as [String: Bool]
        
        servers = map(serverList, {s in Server(s)})
        tableView.reloadData()
        
        hideLoadingView()
    }
    
    func showLoadingView() {
        spinner.startAnimating()
        spinner.hidden = false
    }
    
    func hideLoadingView() {
        spinner.hidden = true;
        spinner.stopAnimating()
    }
    
    // MARK: UITableViewDataSource conformity
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return servers.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier(cellIdentifier) as ServerCellView
        let row = indexPath.row
        cell.isInUse.tag = row
        let server = servers[row]
        
        cell.setFromServer(server)
        return cell
    }
    
    // MARK: Switch functionality
    
    @IBAction func toggleSwitch(sender: UISwitch) {
        let key = servers[sender.tag].name
        
        servers[sender.tag].inUse = sender.on
        fb.childByAppendingPath(key).setValue(sender.on)
    }
}
