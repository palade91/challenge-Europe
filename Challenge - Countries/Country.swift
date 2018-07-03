//
//  Country.swift
//  Challenge - Countries
//
//  Created by Catalin Palade on 02/07/2018.
//  Copyright © 2018 Catalin Palade. All rights reserved.
//

import UIKit

class Country: NSObject {

    var name: String
    var area: Int
    var population: Int
    var capital: String
    var currency: String
    var language: String
    var flagUrl: String
    
    init(name: String, area: Int, population: Int, capital: String, currency: String, language: String, flagUrl: String) {
        self.area = area
        self.name = name
        self.population = population
        self.capital = capital
        self.currency = currency
        self.language = language
        self.flagUrl = flagUrl
    }
    
}
