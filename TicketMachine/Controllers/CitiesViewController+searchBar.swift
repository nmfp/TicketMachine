//
//  CitiesViewController+searchBar.swift
//  TicketMachine
//
//  Created by Nuno Pereira on 23/03/2018.
//  Copyright © 2018 Nuno Pereira. All rights reserved.
//

import Foundation
import UIKit

extension CitiesViewController {
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        if searchText.isEmpty {
            //Reset to helper array to show complete list
            filteredCities = cities
        }
        else {
            filteredCities = cities.filter({$0.name.lowercased().hasPrefix(searchText.lowercased())})
            //Create an array to store next letters
            let lettersWithRepetitions = filteredCities.flatMap({ (c) -> String? in
                let index = c.name.index(c.name.startIndex, offsetBy: searchText.count)
                return index == c.name.endIndex ? nil : String(describing: c.name[index])
            })
            //Removing duplicate characters from lettersWithRepetitions
            letters = Array(Set(lettersWithRepetitions))
        }
        self.tableView.reloadData()
    }
}
