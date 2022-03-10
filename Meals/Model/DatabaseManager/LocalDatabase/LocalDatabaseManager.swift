//
//  LocalDatabaseManager.swift
//  Meals
//
//  Created by Ahmed Taha on 06/03/2022.
//

import Foundation
import UIKit

class LocalDatabaseManager {
        
    func convertImageToData(img: UIImage) -> Data {
        
        let convertImage = img.pngData()!
        
        return convertImage
        
    }
    
    func saveToDatabase (mealsArray: [Meals]) {
        
        let documentDirectory = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first!
        
        let archiveUrl = documentDirectory.appendingPathComponent("Meal_List").appendingPathExtension("plist")
        
        let propertyListEncoder = PropertyListEncoder()
        
        guard let encodedData = try? propertyListEncoder.encode(mealsArray) else { return }
        
        try? encodedData.write(to: archiveUrl, options: .noFileProtection)
        
    }
    
    func loadData() -> [Meals] {
        
        let documentDirectory = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first!
        
        let archiveUrl = documentDirectory.appendingPathComponent("Meal_List").appendingPathExtension("plist")
        
        guard let retrieveData = try? Data(contentsOf: archiveUrl) else { return [] }
        
        let propertyListDecoder = PropertyListDecoder()
        
        guard let decodedArray = try? propertyListDecoder.decode([Meals].self, from: retrieveData) else { return [] }
        
        return decodedArray
        
    }
    
}


