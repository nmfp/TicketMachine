//
//  CityCell.swift
//  TicketMachine
//
//  Created by Nuno Pereira on 20/03/2018.
//  Copyright © 2018 Nuno Pereira. All rights reserved.
//

import Foundation
import UIKit

class CityCell: UITableViewCell {
    
    var city: City? {
        didSet {
            cityLabel.text = city?.name
        }
    }
    
    let cityLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 16)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupViews()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupViews() {
        addSubview(cityLabel)
        
        NSLayoutConstraint.activate([
            cityLabel.topAnchor.constraint(equalTo: topAnchor),
            cityLabel.leftAnchor.constraint(equalTo: leftAnchor, constant: 12),
            cityLabel.rightAnchor.constraint(equalTo: rightAnchor),
            cityLabel.bottomAnchor.constraint(equalTo: bottomAnchor)
            ])
    }
}
