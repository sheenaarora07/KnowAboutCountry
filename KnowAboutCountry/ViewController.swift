//
//  ViewController.swift
//  KnowAboutCountry
//
//  Created by Sheena on 22/02/22.
//

import UIKit

class ViewController: UITableViewController {
    
    var countries = [Country]()
    var flag = [String]()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        fetchData()
        navigationController?.navigationBar.prefersLargeTitles = true
        title = "Know About Countries"
        
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return countries.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "Country", for: indexPath) as? TableViewCell else {fatalError()}
        
        let country = countries[indexPath.row]
        cell.imageCountry.image = UIImage(named: country.name)
        cell.imageCountry.layer.borderColor = UIColor.black.cgColor
        cell.imageCountry.layer.borderWidth = 5
        cell.name.text = country.name
        cell.capital.text = "Capital: \(country.capital)"
        cell.currency.text = "Currency: \(country.currency)"
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        
        guard let vc = storyboard?.instantiateViewController(withIdentifier: "Detail") as? DetailTableViewController else{return}
        vc.country = countries[indexPath.row]
        navigationController?.pushViewController(vc, animated: true)
    }

    func fetchData() {
        
        guard let path = Bundle.main.path(forResource: "country", ofType: "json") else{return}
        
        guard let data = try? Data(contentsOf: URL(fileURLWithPath: path)) else {return}
        
        let decoder = JSONDecoder()
        
        if let jsonData = try? decoder.decode(Countries.self, from: data) {
            
            countries = jsonData.countries
            save(countrey: countries)
        }
    }
    
    func save(countrey: [Country]) {
        for country in countrey {
            flag.append(country.name)
        }
    }

}

