//
//  LocalDatabaseManager.swift
//  Meals
//
//  Created by Ahmed Taha on 06/03/2022.
//

import Foundation
import UIKit

class LocalDatabaseManager {
    
    var mealArray: [Meals] = []
    
    func fetchData() -> [Meals] {
        
        let pizza = Meals(name: "Pizza", image: convertImageToData(img: UIImage(named: "1")!), price: 120)
        let chesePizza = Meals(name: "Chese Pizza", image: convertImageToData(img: UIImage(named: "2")!), price: 135)
        let burger = Meals(name: "Burger", image: convertImageToData(img: UIImage(named: "3")!), price: 85)
        let cheseBurger = Meals(name: "Chese Burger", image: convertImageToData(img: UIImage(named: "4")!), price: 95)
        let salad = Meals(name: "Salad", image: convertImageToData(img: UIImage(named: "5")!), price: 50)
        let pasta = Meals(name: "Pasta", image: convertImageToData(img: UIImage(named: "6")!), price: 65)
        let sandwich = Meals(name: "Sandwich", image: convertImageToData(img: UIImage(named: "7")!), price: 60)
        
        mealArray = [pizza, chesePizza, burger, cheseBurger, salad, pasta, sandwich]
        
        return mealArray
        
    }
    
    func convertImageToData(img: UIImage) -> Data {
        
        let convertImage = img.pngData()!
        
        return convertImage
        
    }
    
}


