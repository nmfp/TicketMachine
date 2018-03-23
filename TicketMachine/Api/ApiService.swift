//
//  ApiService.swift
//  TicketMachine
//
//  Created by Nuno Pereira on 20/03/2018.
//  Copyright © 2018 Nuno Pereira. All rights reserved.
//

import Foundation
import UIKit
import Alamofire

struct ApiService {
    
    //singleton for web requests
    static let shared = ApiService()
    
    // Web url to get cities from REST COUNTRIES api. Website: https://restcountries.eu / Twitter: @RESTCountries
    let countriesUrl = "https://restcountries.eu/rest/v2/all?fields=capital"
    
    func getCapitalsFromServer(completion: @escaping ([City]) -> ()) {
        let parameters: Parameters = [
            "fields": "capital"
        ]
        
        //Queue where response parse will be done avoiding Main UI crash/freezing
        let utilityQueue = DispatchQueue.global(qos: .utility)
        
        Alamofire.request(countriesUrl, method: .get, parameters: parameters, encoding: URLEncoding.default, headers: nil).responseData(queue: utilityQueue) { (response) in
            let resultData = response.result.value
            guard let data = resultData else {return}
            
            do {
                let cities = try JSONDecoder().decode([City].self, from: data)
                completion(cities)
            }
            catch let errParsingJsonObj {
                print("Failed do create City object: ", errParsingJsonObj)
            }
        }
    }
}
