//
//  DetailsViewController.swift
//  Meals
//
//  Created by Ahmed Taha on 06/03/2022.
//

import UIKit

class DetailsViewController: UIViewController {

    @IBOutlet weak var mealImg: UIImageView!
    
    @IBOutlet weak var mealName: UILabel!
    
    @IBOutlet weak var mealPrice: UILabel!
    
    var comingMeal: Meals!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        mealImg.image = UIImage(data: comingMeal.image)
        mealName.text = comingMeal.name
        mealPrice.text = "\(comingMeal.price) L.E"
        
    }
    
}
