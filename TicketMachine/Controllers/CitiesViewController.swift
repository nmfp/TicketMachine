//
//  ViewController.swift
//  TicketMachine
//
//  Created by Nuno Pereira on 20/03/2018.
//  Copyright © 2018 Nuno Pereira. All rights reserved.
//

import UIKit

class CitiesViewController: UITableViewController , UISearchBarDelegate {
    
    lazy var searchBar: UISearchBar = {
        let sb = UISearchBar()
        sb.barTintColor = .gray
        UITextField.appearance(whenContainedInInstancesOf: [UISearchBar.self]).backgroundColor = UIColor(red: 230, green: 230, blue: 230)
        sb.placeholder = "Enter city"
        sb.delegate = self
        sb.translatesAutoresizingMaskIntoConstraints = false
        return sb
    }()

    var cities = [City]()
    var filteredCities = [City]()
    var letters = [String]()
    
    let nextLetterCellId = "nextLetterCellId"
    let cityCellId = "cityCellId"
    let sectionTitles = ["Next Character Available", "Cities"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        
        fetchCities()
        setupNavBar()
        setupTableView()
    }

    //MARK:- SetupUI
    fileprivate func setupNavBar() {
        guard let navBar = navigationController?.navigationBar else {return}
        navBar.addSubview(searchBar)
        //UIView extension method to setup auto layout
        searchBar.anchor(top: navBar.topAnchor, left: navBar.leftAnchor, bottom: navBar.bottomAnchor, right: navBar.rightAnchor, paddingTop: 0, paddingLeft: 8, paddingBottom: 0, paddingRight: 8, width: 0, height: 0)
    }
    
    fileprivate func setupTableView() {
        tableView.tableFooterView = UIView()
        tableView.register(CityCell.self, forCellReuseIdentifier: cityCellId)
        tableView.register(NextLetterCell.self, forCellReuseIdentifier: nextLetterCellId)
    }
    
    //Fetch cities from web
    private func fetchCities() {
        ApiService.shared.getCapitalsFromServer { cities in
            //Sorting alphabetically and removing empty elements to be user friendly
            self.cities = cities.sorted {c1, c2 -> Bool in c1.name < c2.name }.filter {$0.name != ""}
            self.filteredCities = self.cities
            self.tableView.reloadData()
        }
    }
}

