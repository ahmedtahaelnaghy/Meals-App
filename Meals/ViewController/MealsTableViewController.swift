//
//  MealsTableViewController.swift
//  Meals
//
//  Created by Ahmed Taha on 06/03/2022.
//

import UIKit

class MealsTableViewController: UITableViewController, IaddNewMeal {
    
    
    @IBOutlet weak var mealImg: UIImageView!
    
    @IBOutlet weak var mealName: UILabel!
    
    var localDatabaseManager: LocalDatabaseManager!
    
    var mealsArray: [Meals] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        localDatabaseManager = LocalDatabaseManager()
        mealsArray = localDatabaseManager.fetchData()
        
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return mealsArray.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! SingleMealTableViewCell
        
        cell.mealName.text = mealsArray[indexPath.row].name
        cell.mealImg.image = UIImage(data: mealsArray[indexPath.row].image)
        
        return cell
    }

    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        return 130
        
    }
    
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        if let vc = storyboard?.instantiateViewController(withIdentifier: "DetailsVC") as? DetailsViewController {
            
            vc.comingMeal = mealsArray[indexPath.row]            
            
            self.navigationController?.pushViewController(vc, animated: true)
            
        }
        
    }
    
    func addNewMeal(meal: Meals) {
        
        mealsArray.append(meal)
        tableView.reloadData()
        
    }
    
    @IBAction func addBtn(_ sender: Any) {
        
        if let vc = storyboard?.instantiateViewController(withIdentifier: "AddVC") as? AddMealViewController {
            
            vc.delegate = self
            
            self.navigationController?.pushViewController(vc, animated: true)
            
        }
        
        
        
    }
    
    
    
    
    
    
    
    
    
    
    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
