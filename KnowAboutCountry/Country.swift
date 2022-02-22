//
//  Country.swift
//  KnowAboutCountry
//
//  Created by Sheena on 22/02/22.
//

import Foundation

struct Countries: Codable {
    
    var countries: [Country]
}

struct Country: Codable {
    
    var name: String
    var capital: String
    var currency: String
    var population: Int
    var area: Int
    
}
