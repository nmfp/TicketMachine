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
    var letters = [Character]()
    
    var textBeingSearched: String = ""
    let cityCellId = "cityCellId"
    let sectionTitles = ["Next Character Available", "Cities"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        navigationItem.title = "Cities"
        
        guard let navBar = navigationController?.navigationBar else {return}
        navBar.addSubview(searchBar)
        
        NSLayoutConstraint.activate([
            searchBar.topAnchor.constraint(equalTo: navBar.topAnchor),
            searchBar.leftAnchor.constraint(equalTo: navBar.leftAnchor, constant: 8),
            searchBar.bottomAnchor.constraint(equalTo: navBar.bottomAnchor, constant: 0),
            searchBar.rightAnchor.constraint(equalTo: navBar.rightAnchor, constant: -8)
            ])
        
        
        fetchCities()
        
        tableView.tableFooterView = UIView()
        tableView.register(CityCell.self, forCellReuseIdentifier: cityCellId)
    }

    //Fetch cities from web
    private func fetchCities() {
        ApiService.shared.getCapitalsFromServer { cities in
            self.cities = cities
            self.filteredCities = cities
            self.tableView.reloadData()
        }
    }
    
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        textBeingSearched = searchText
        if searchText.isEmpty {
            filteredCities = cities
        }
        else {
            let startDate = Date()
//            filteredCities = cities.filter{ city in
//                if city.name!.lowercased().hasPrefix(searchText.lowercased()) {
//                    letters.append(String(describing: city.name!.first))
//                    return true
//                }
//                return false
//            }
            
            filteredCities = cities.filter({$0.name!.lowercased().hasPrefix(searchText.lowercased())})
            let lettersWithRepetitions = filteredCities.flatMap({ (c) -> String in
                guard let index = c.name?.index(c.name!.startIndex, offsetBy: searchText.count) else {return ""}
                return try! String(describing: c.name![index])
            })
            
            letters = Array(Set(lettersWithRepetitions))
            let endDate = Date()
            print("Tempo: ", endDate.timeIntervalSince1970 - startDate.timeIntervalSince1970)
            print("Tempo 2: ", endDate.timeIntervalSince(startDate))
            print("\n\n", letters)
        }
        
        self.tableView.reloadData()
    }

}

