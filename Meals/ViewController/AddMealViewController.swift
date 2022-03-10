//
//  AddMealViewController.swift
//  Meals
//
//  Created by Ahmed Taha on 06/03/2022.
//

import UIKit

class AddMealViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    
    @IBOutlet weak var newMealImg: UIImageView!
    
    @IBOutlet weak var newMealName: UITextField!
    
    @IBOutlet weak var newMealPrice: UITextField!
    
    var delegate: IaddNewMeal?
    
    var imagePicker: UIImagePickerController!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        imagePicker = UIImagePickerController()
        imagePicker.delegate = self
        imagePicker.sourceType = .photoLibrary
        
    }
    
    @IBAction func galleryBtn(_ sender: Any) {
        
        present(imagePicker, animated: true, completion: nil)
        
    }
    
    @IBAction func doneBtn(_ sender: Any) {
        
        guard let image = newMealImg.image else { return }
        let imageData = LocalDatabaseManager().convertImageToData(img: image)
        
        let name = newMealName.text!
        let price = Int(newMealPrice.text!)!
        
        delegate?.addNewMeal(meal: Meals(name: name, image: imageData, price: price))
        
        self.navigationController?.popViewController(animated: true)
        
    }
    

    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        
        if let selectedImage = info[.originalImage] as? UIImage {
            
            newMealImg.image = selectedImage
            
        }
        
        dismiss(animated: true, completion: nil)
        
    }
    
}
