//
//  AddMealViewController.swift
//  Meals
//
//  Created by Ahmed Taha on 06/03/2022.
//

import UIKit

class AddMealViewController: UIViewController {
    
    
    @IBOutlet weak var newMealImg: UIImageView!
    
    @IBOutlet weak var newMealName: UITextField!
    
    @IBOutlet weak var newMealPrice: UITextField!
    
    var delegate: IaddNewMeal?
    
    override func viewDidLoad() {
        super.viewDidLoad()
                
        
    }
    
    @IBAction func doneBtn(_ sender: Any) {
        
//        let image = newMealImg.image!
        
        let image = UIImage(named: "3")!
        let imageData = LocalDatabaseManager().convertImageToData(img: image)
        
        let name = newMealName.text!
        let price = Int(newMealPrice.text!)!
        
        delegate?.addNewMeal(meal: Meals(name: name, image: imageData, price: price))
        
        self.navigationController?.popViewController(animated: true)
        
    }
    
}
