//
//  CitiesViewController+tableView.swift
//  TicketMachine
//
//  Created by Nuno Pereira on 21/03/2018.
//  Copyright © 2018 Nuno Pereira. All rights reserved.
//

import Foundation
import UIKit

extension CitiesViewController {
    
    //MARK:- TableView Methods
    override func numberOfSections(in tableView: UITableView) -> Int {
        let count = textBeingSearched.count == 0 ? 1 : 2
        return count
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        var count = 0
        if textBeingSearched.count != 0 && section == 0 {
            count = letters.count
            return count
        }
        count = filteredCities.count
        return count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cityCellId, for: indexPath) as! CityCell
        cell.city = textBeingSearched.count != 0 && indexPath.section == 0 ? String(describing: letters[indexPath.row]) : filteredCities[indexPath.row].name
        return cell
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 50
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    override func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return textBeingSearched.count == 0 ? 0 : 20
    }
    
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return sectionTitles[section]
    }
}
