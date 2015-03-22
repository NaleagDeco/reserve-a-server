//
//  ServerCellView.swift
//  Reserve a Server
//
//  Created by Gaelan D'costa on 2015-03-22.
//  Copyright (c) 2015 Gaelan D'costa. All rights reserved.
//

import UIKit

class ServerCellView: UITableViewCell {
    @IBOutlet weak var serverName: UILabel!
    @IBOutlet weak var isInUse: UISwitch!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

    func setFromServer(server: Server) {
        serverName.text = server.name
        isInUse.enabled = server.inUse
    }
    
}
