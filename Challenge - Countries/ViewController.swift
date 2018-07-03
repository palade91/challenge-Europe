//
//  ViewController.swift
//  Challenge - Countries
//
//  Created by Catalin Palade on 02/07/2018.
//  Copyright © 2018 Catalin Palade. All rights reserved.
//

import UIKit

class ViewController: UITableViewController {
    
    var countries = [Country]()
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Europe"
        
        loadAPI()
        
        
        
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    //setting the tableView
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return countries.count
    }
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        let country = countries[indexPath.row]
        cell.textLabel?.text = country.name
        cell.detailTextLabel?.text = country.capital
        return cell
    }
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let vc = DetailViewController()
        let country = countries[indexPath.row]
        vc.detailsCountry = country
        navigationController?.pushViewController(vc, animated: true)
    }
    //load the api from url and parse it with SwiftyJSON
    func loadAPI() {
        let urlString = "https://restcountries.eu/rest/v2/regionalbloc/eu"
        if let url = URL(string: urlString) {
            if let data = try? String(contentsOf: url) {
                let json = JSON(parseJSON: data)
                parse(json: json)
            } else {
                print("Error on load API")
            }
        }
    }
    func parse(json: JSON) {
        for result in json.arrayValue {
            let name = result["name"].stringValue
            let capital = result["capital"].stringValue
            let population = result["population"].intValue
            let currency = result["currencies", 0, "name"].stringValue
            let language = result["languages", 0, "name"].stringValue
            let flagUrl = result["flag"].stringValue
            let area = result["area"].intValue
            let obj = Country(name: name, area: area, population: population, capital: capital, currency: currency, language: language, flagUrl: flagUrl)
            countries.append(obj)
        }
    }
}

