//
//  DetailViewController.swift
//  FoodMenu
//
//  Created by Ajay Dhomase on 11/02/21.
//

import UIKit

class DetailViewController: UIViewController {

    @IBOutlet weak var foodItemImage: UIImageView!
    @IBOutlet weak var foodItemLabel: UILabel!
    
    @IBOutlet weak var foodItemDetails: UITextView!
    
    @IBOutlet weak var selectBtn: UIButton!
    var imageName: String!
    var itemName: String!
    var details: String!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.foodItemImage.image = UIImage(named: imageName) ?? .remove
        self.selectBtn.layer.cornerRadius = 10
        self.foodItemLabel.text = itemName
        self.foodItemDetails.text = details
        self.title = imageName

    }

    func customInit(itemName: String, foodDetails: String) {
        self.imageName = itemName
        self.itemName = itemName
        self.details = foodDetails
    }

    @IBAction func selectBtnPressed(_ sender: UIButton) {
        self.navigationController?.popViewController(animated: true)
    }
}
