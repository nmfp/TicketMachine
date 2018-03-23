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
    
    //MARK:- TableView Helper
    func isLetterCellBeingRendered(section: Int) -> Bool {
        return searchBar.text?.count != 0 && section == 0 ? true : false
    }
    
    //MARK:- TableView Methods
    override func numberOfSections(in tableView: UITableView) -> Int {
        return searchBar.text?.count == 0 ? 1 : 2
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return isLetterCellBeingRendered(section: section) ? letters.count : filteredCities.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = isLetterCellBeingRendered(section: indexPath.section) ? tableView.dequeueReusableCell(withIdentifier: nextLetterCellId, for: indexPath) as! NextLetterCell : tableView.dequeueReusableCell(withIdentifier: cityCellId, for: indexPath) as! CityCell
        cell.cityData = isLetterCellBeingRendered(section: indexPath.section) ? letters[indexPath.row] : filteredCities[indexPath.row].name
        return cell
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 50
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    override func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return searchBar.text?.count == 0 ? 0 : 20
    }
    
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return sectionTitles[section]
    }
}
