//
//  MainViewController.swift
//  FoodMenu
//
//  Created by Ajay Dhomase on 10/02/21.
//

import UIKit

class MainViewController: UIViewController {

    @IBOutlet weak var backgroundView: UIView!
    @IBOutlet weak var tableView: UITableView!
    
    var foodItems = [
        FoodModel(category: "", items: [], details: "", expanded: false),
        FoodModel(category: "Pizza", items: ["Margherita","Farmhouse","Peppy Paneer","Veg Extravaganza"], details: "Pizza is a savory dish of Italian origin consisting of a usually round, flattened base of leavened wheat-based dough topped with tomatoes, cheese, and often various other ingredients, which is then baked at a high temperature, traditionally in a wood-fired oven.", expanded: true),
        FoodModel(category: "Burger", items: ["Beef Burger","Elk Burger","Mushroom Burger","Turkey Burger","Veggie Burger","Mushroom Burger","Turkey Burger","Veggie Burger"], details: "A hamburger is a sandwich consisting of one or more cooked patties of ground meat, usually beef, placed inside a sliced bread roll or bun. The patty may be pan fried, grilled, smoked or flame broiled.", expanded: false),
        FoodModel(category: "Beverages", items: ["Milk","Soft drinks","Apple Juice","Cider","Spirits","Soft drinks","Apple Juice","Cider","Spirits"], details: "A drink is a liquid intended for human consumption. In addition to their basic function of satisfying thirst, drinks play important roles in human culture.", expanded: false),
        FoodModel(category: "Snacks", items: ["Cookies","Cakes","Pastries","Sandwiches","Cookies","Cakes","Pastries","Sandwiches"], details: "A snack is a small portion of food generally eaten between meals. Snacks come in a variety of forms including packaged snack foods and other processed foods.", expanded: false),
        FoodModel(category: "Pizza", items: ["Margherita","Farmhouse","Peppy Paneer","Veg Extravaganza"], details: "Pizza is a savory dish of Italian origin consisting of a usually round, flattened base of leavened wheat-based dough topped with tomatoes, cheese, and often various other ingredients, which is then baked at a high temperature, traditionally in a wood-fired oven.", expanded: false),
        FoodModel(category: "Burger", items: ["Beef Burger","Elk Burger","Mushroom Burger","Turkey Burger","Veggie Burger","Mushroom Burger","Turkey Burger","Veggie Burger"], details: "A hamburger is a sandwich consisting of one or more cooked patties of ground meat, usually beef, placed inside a sliced bread roll or bun. The patty may be pan fried, grilled, smoked or flame broiled.", expanded: false),
        FoodModel(category: "Beverages", items: ["Milk","Soft drinks","Apple Juice","Cider","Spirits","Soft drinks","Apple Juice","Cider","Spirits"], details: "A drink is a liquid intended for human consumption. In addition to their basic function of satisfying thirst, drinks play important roles in human culture.", expanded: false),
        FoodModel(category: "Snacks", items: ["Cookies","Cakes","Pastries","Sandwiches","Cookies","Cakes","Pastries","Sandwiches"], details: "A snack is a small portion of food generally eaten between meals. Snacks come in a variety of forms including packaged snack foods and other processed foods.", expanded: false),
        FoodModel(category: "Pizza", items: ["Margherita","Farmhouse","Peppy Paneer","Veg Extravaganza"], details: "Pizza is a savory dish of Italian origin consisting of a usually round, flattened base of leavened wheat-based dough topped with tomatoes, cheese, and often various other ingredients, which is then baked at a high temperature, traditionally in a wood-fired oven.", expanded: false),
        FoodModel(category: "Burger", items: ["Beef Burger","Elk Burger","Mushroom Burger","Turkey Burger","Veggie Burger","Mushroom Burger","Turkey Burger","Veggie Burger"], details: "A hamburger is a sandwich consisting of one or more cooked patties of ground meat, usually beef, placed inside a sliced bread roll or bun. The patty may be pan fried, grilled, smoked or flame broiled.", expanded: false),
        FoodModel(category: "Beverages", items: ["Milk","Soft drinks","Apple Juice","Cider","Spirits","Soft drinks","Apple Juice","Cider","Spirits"], details: "A drink is a liquid intended for human consumption. In addition to their basic function of satisfying thirst, drinks play important roles in human culture.", expanded: false),
        FoodModel(category: "Snacks", items: ["Cookies","Cakes","Pastries","Sandwiches","Cookies","Cakes","Pastries","Sandwiches"], details: "A snack is a small portion of food generally eaten between meals. Snacks come in a variety of forms including packaged snack foods and other processed foods.", expanded: false)
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        self.title = "FoodMenu"
    }


}

extension MainViewController: UITableViewDelegate, UITableViewDataSource{
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return foodItems.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0 {
            return 0
        }else{
            return foodItems[section].items.count
        }
        
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        if section == 0 {
            return 240
        }else{
            return 44
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if (foodItems[indexPath.section].expanded) {
            return 44
        } else {
            return 0
        }
    }
    
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        if section == 0 {
            return 4
        }else{
            return 2
        }
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        if section == 0{
            return configureHeaderView()
        } else {
        let header = ExpandableHeaderView()
        header.customInit(title: foodItems[section].category, section: section, delegate: self)
        return header
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "labelCell")!
        cell.textLabel?.text = foodItems[indexPath.section].items[indexPath.row]
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let simpleVC = DetailViewController()
        let item = foodItems[indexPath.section]
        simpleVC.customInit(itemName: item.items[indexPath.row], foodDetails: item.details)
        tableView.deselectRow(at: indexPath, animated: true)
        self.navigationController?.pushViewController(simpleVC, animated: true)
    }
}


extension MainViewController: ExpandableHeaderViewDelegate{
    func toggleSection(header: ExpandableHeaderView, section: Int) {
        foodItems[section].expanded = !foodItems[section].expanded
        
        
        tableView.beginUpdates()
        for i in 0 ..< foodItems[section].items.count {
            tableView.reloadRows(at: [IndexPath(row: i, section: section)], with: .automatic)
        }
        tableView.endUpdates()
    }
    
    
}

extension MainViewController: UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func configureHeaderView() -> UIView {

        let layout = UICollectionViewFlowLayout()

        layout.scrollDirection = .horizontal
        layout.sectionInset = UIEdgeInsets(top: 20, left: 0, bottom: 10, right: 0)
        let headerView = UICollectionView(frame: CGRect(x: 0, y: 0, width: view.frame.width, height: 230), collectionViewLayout: layout)
        headerView.backgroundColor = #colorLiteral(red: 0.9464979768, green: 0.9597960114, blue: 0.9782915711, alpha: 1)
        headerView.isPagingEnabled = true
        headerView.isUserInteractionEnabled = true
        headerView.dataSource = self
        headerView.delegate = self
        headerView.register(UINib(nibName: "BannerCollectionViewCell", bundle: .main), forCellWithReuseIdentifier: "BannerCollectionViewCell")
        headerView.showsHorizontalScrollIndicator = false
        return headerView
    }

    // MARK: UICollectionViewDataSource
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return foodItems.count - 1
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier:"BannerCollectionViewCell", for: indexPath) as! BannerCollectionViewCell
        let item = foodItems[indexPath.row + 1]
        cell.foodImage.image = UIImage(named: item.category)
        
        return cell
    }

    // MARK: UICollectionViewDelegateFlowLayout
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 200, height: 200)
    }
}

