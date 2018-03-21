//
//  ViewController.swift
//  TicketMachine
//
//  Created by Nuno Pereira on 20/03/2018.
//  Copyright © 2018 Nuno Pereira. All rights reserved.
//

import UIKit

class CitiesViewController: UITableViewController {

    var cities = [City]()
    let cityCellId = "cityCellId"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        navigationItem.title = "Cities"
        
        fetchCities()
        
        tableView.tableFooterView = UIView()
        tableView.register(CityCell.self, forCellReuseIdentifier: cityCellId)
    }

    //Fetch cities from web
    private func fetchCities() {
        ApiService.shared.getCapitalsFromServer { cities in
            self.cities = cities
            self.tableView.reloadData()
        }
    }
    

}

