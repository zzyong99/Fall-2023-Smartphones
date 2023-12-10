//
//  ChristmasTableViewCell.swift
//  MerryChristmas
//
//  Created by Drillmaps on 02/12/23.
//

import UIKit

class ChristmasTableViewCell: UITableViewCell {
    @IBOutlet weak var imgView: UIImageView!
    
    @IBOutlet weak var lblChristmas: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
