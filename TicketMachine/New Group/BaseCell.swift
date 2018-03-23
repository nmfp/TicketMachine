//
//  BaseCell.swift
//  TicketMachine
//
//  Created by Nuno Pereira on 23/03/2018.
//  Copyright © 2018 Nuno Pereira. All rights reserved.
//

import UIKit

class BaseCell: UITableViewCell {
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupViews()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupViews() {
        
    }
}
