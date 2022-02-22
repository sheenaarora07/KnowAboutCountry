//
//  DetailTableViewController.swift
//  KnowAboutCountry
//
//  Created by Sheena on 22/02/22.
//

import UIKit

class DetailTableViewController: UITableViewController {

    @IBOutlet var imageCountry: UIImageView!
    @IBOutlet var currencyLabel: UILabel!
    @IBOutlet var areaLabel: UILabel!
    @IBOutlet var populationLabel: UILabel!
    @IBOutlet var nameLabel: UILabel!
    @IBOutlet var capitalLabel: UILabel!
    
    var country : Country?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        guard let country = country else{return}
        
        nameLabel.text = country.name
        capitalLabel.text = country.capital
        currencyLabel.text = country.currency
        populationLabel.text = "\(country.population)"
        areaLabel.text = "\(country.area)"
        imageCountry.image = UIImage(named: country.name)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        imageAnimate()
        nameAnimate()
        infoAnimate()
    }
    
    func imageAnimate() {
        UIView.animate(withDuration: 0) {
            self.imageCountry.alpha = 0
            self.imageCountry.transform = CGAffineTransform(translationX: 0, y: 30)
        }
        UIView.animate(withDuration: 4) {
            self.imageCountry.alpha = 1
            self.imageCountry.transform = CGAffineTransform(translationX: 0, y: 0)
        }
    }
    
    func nameAnimate() {
        UIView.animate(withDuration: 0) {
            self.nameLabel.alpha = 0
        }
        UIView.animate(withDuration: 1) {
            self.nameLabel.alpha = 1
        }
    }
    
    func infoAnimate() {
        UIView.animate(withDuration: 0) {
            self.capitalLabel.alpha = 0
            self.populationLabel.alpha = 0
            self.areaLabel.alpha = 0
            self.currencyLabel.alpha = 0
        }
        UIView.animate(withDuration: 3) {
            self.capitalLabel.alpha = 1
            self.populationLabel.alpha = 1
            self.areaLabel.alpha = 1
            self.currencyLabel.alpha = 1
        }
    }

}
