//
//  FoodModel.swift
//  FoodMenu
//
//  Created by Ajay Dhomase on 10/02/21.
//

import Foundation

struct FoodModel {
    
    var category: String!
    var items: [String]!
    var details: String!
    var expanded: Bool!
    
    init(category: String, items: [String],details: String, expanded: Bool){
        self.category = category
        self.items = items
        self.details = details
        self.expanded = expanded
    }
}
