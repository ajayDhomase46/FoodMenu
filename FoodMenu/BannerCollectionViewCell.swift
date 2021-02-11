//
//  BannerCollectionViewCell.swift
//  FoodMenu
//
//  Created by Ajay Dhomase on 11/02/21.
//

import UIKit

class BannerCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var foodImage: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        self.layoutIfNeeded()
        foodImage.layer.cornerRadius = 20
        foodImage.layer.masksToBounds = true

    }
    

}
