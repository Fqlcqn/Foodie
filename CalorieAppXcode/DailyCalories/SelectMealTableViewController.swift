//  SelectMealTableViewController.swift
//  DailyCalories

import Foundation
import UIKit

protocol CalcCaloriesDelegate {
    func updateCalories(addValue: Int)
    /* we create a protocol on top of the source view controller, it is like a header for a C program. */
}


class SelectMealTableViewController: UITableViewController{
    

    var calorie = 0
    
    private var foods: [Food] = []
    
    var delegate: CalcCaloriesDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        addFoods()
        
        //foods = ["Eggs (80 Calories)":70,"Steak (679 Calories)":89,"Slice of Bread (78 Calories)":88]
        
    }
    
    
    @IBAction func submitCalories(_ sender: Any) {
        delegate?.updateCalories(addValue: calorie)
    }
    
    
    func addFoods(){
        
        // Breakfast
        foods.append(Food(name: "Bacon and Eggs (320)", calories: 320))
        foods.append(Food(name: "Pancakes with Syrup (520)", calories: 520))
        foods.append(Food(name: "Bagel with Cream Cheese (320)", calories: 320))
        foods.append(Food(name: "Oatmeal with Brown Sugar (150)", calories: 150))
        foods.append(Food(name: "Avocado Toast (250)", calories: 250))
        foods.append(Food(name: "Acai Bowl (400)", calories: 400))
        foods.append(Food(name: "Egg White Omelette (200)", calories: 200))

        // Snack
        foods.append(Food(name: "Quinoa Salad with Mixed Vegetables (350)", calories: 350))
        foods.append(Food(name: "Chia Seed Pudding (200)", calories: 200))
        foods.append(Food(name: "Caprese Salad (250)", calories: 250))

        // Lunch
        foods.append(Food(name: "Grilled Cheese Sandwich (320)", calories: 320))
        foods.append(Food(name: "BLT Sandwich (450)", calories: 450))
        foods.append(Food(name: "Chicken Caesar Salad (400)", calories: 400))
        foods.append(Food(name: "Cheeseburger and Fries (800)", calories: 800))
        foods.append(Food(name: "Taco Salad (600)", calories: 600))
        foods.append(Food(name: "Fish Tacos (450)", calories: 450))
        foods.append(Food(name: "Vegetable Stir Fry (300)", calories: 300))
        foods.append(Food(name: "Turkey Sandwich (400)", calories: 400))
        foods.append(Food(name: "Cobb Salad (500)", calories: 500))
        foods.append(Food(name: "Caesar Salad (250)", calories: 250))
        foods.append(Food(name: "Buddha Bowl (450)", calories: 450))
        foods.append(Food(name: "Seared Ahi Tuna Salad (400)", calories: 400))
        foods.append(Food(name: "Cobb Salad Wrap (450)", calories: 450))
        foods.append(Food(name: "Soba Noodle Salad (300)", calories: 300))

        // Dinner
        foods.append(Food(name: "Spaghetti and Meatballs (850)", calories: 850))
        foods.append(Food(name: "Beef Stew (350)", calories: 350))
        foods.append(Food(name: "BBQ Ribs (700)", calories: 700))
        foods.append(Food(name: "Fried Chicken (400)", calories: 400))
        foods.append(Food(name: "Pulled Pork Sandwich (500)", calories: 500))
        foods.append(Food(name: "Beef Burrito (700)", calories: 700))
        foods.append(Food(name: "Hamburger (400)", calories: 400))
        foods.append(Food(name: "Chicken Fried Rice (600)", calories: 600))
        foods.append(Food(name: "Shakshuka (300)", calories: 300))
        foods.append(Food(name: "Mushroom Risotto (400)", calories: 400))
        foods.append(Food(name: "Chicken Tikka Masala with Rice (600)", calories: 600))
        foods.append(Food(name: "Gyro Sandwich (600)", calories: 600))
        foods.append(Food(name: "Chicken Shawarma Wrap (500)", calories: 500))
        foods.append(Food(name: "Tuna Poke Bowl (400)", calories: 400))
        foods.append(Food(name: "Sushi Roll (Various, depending on type)", calories: 400)) // Adjusted average calories
        foods.append(Food(name: "Sushi Burrito (450)", calories: 450))

        // Additional Snacks or Miscellaneous
        foods.append(Food(name: "Chicken Wings (350)", calories: 350))
        foods.append(Food(name: "Nachos with Cheese (600)", calories: 600))
        foods.append(Food(name: "Clam Chowder Soup (350)", calories: 350))
        foods.append(Food(name: "Baked Potato with Sour Cream (300)", calories: 300))
        foods.append(Food(name: "Fajitas (450)", calories: 450))
        foods.append(Food(name: "Shrimp Cocktail (200)", calories: 200))
        foods.append(Food(name: "Hawaiian Poke Bowl (450)", calories: 450))
        foods.append(Food(name: "Pho (Vietnamese Noodle Soup) (350)", calories: 350))
        foods.append(Food(name: "Ramen Noodles (400)", calories: 400))
        foods.append(Food(name: "Cauliflower Crust Pizza (300)", calories: 300))
        foods.append(Food(name: "Stuffed Bell Peppers (300)", calories: 300))
        foods.append(Food(name: "Zucchini Noodles with Pesto (250)", calories: 250))
        foods.append(Food(name: "Veggie Burger (350)", calories: 350))
        foods.append(Food(name: "Eggplant Parmesan (400)", calories: 400))
        foods.append(Food(name: "Falafel Wrap (450)", calories: 450))
        
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return foods.count

    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        
        
        if let cell = tableView.cellForRow(at: indexPath) {
            if(cell.accessoryType != .checkmark){
                cell.accessoryType = .checkmark
                let addCalorie = foods[indexPath.row].calories
                calorie += addCalorie
            }
            else{
                cell.accessoryType = .none
                let subtractCalorie = foods[indexPath.row].calories
                calorie -= subtractCalorie
                
            }
        }
    }
            
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let tableViewCell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        tableViewCell.textLabel?.text = foods[indexPath.row].name
        return tableViewCell
    }
    
}
