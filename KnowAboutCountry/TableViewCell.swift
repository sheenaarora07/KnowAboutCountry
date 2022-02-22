//
//  TableViewCell.swift
//  KnowAboutCountry
//
//  Created by Sheena on 22/02/22.
//

import UIKit

class TableViewCell: UITableViewCell {

    @IBOutlet var imageCountry: UIImageView!
    @IBOutlet var name: UILabel!
    @IBOutlet var capital: UILabel!
    @IBOutlet var currency: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    

}
