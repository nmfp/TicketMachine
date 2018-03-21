//
//  Country.swift
//  TicketMachine
//
//  Created by Nuno Pereira on 20/03/2018.
//  Copyright © 2018 Nuno Pereira. All rights reserved.
//

import Foundation
import UIKit

struct City: Decodable {
    var name: String?
    
    init(from decoder: Decoder) throws {
        let containter = try decoder.container(keyedBy: keys.self)
        name = try? containter.decode(String.self, forKey: .name)
    }
    
    private enum keys: String, CodingKey {
        case name = "capital"
    }
}
