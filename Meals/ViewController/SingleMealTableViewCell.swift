//
//  SingleMealTableViewCell.swift
//  Meals
//
//  Created by Ahmed Taha on 06/03/2022.
//

import UIKit

class SingleMealTableViewCell: UITableViewCell {

    @IBOutlet weak var mealImg: UIImageView!
    
    @IBOutlet weak var mealName: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
