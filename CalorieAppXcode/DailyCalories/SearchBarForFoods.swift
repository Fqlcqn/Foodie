//
//  SearchBarForFoods.swift
//  DailyCalories
//
//  Created by Maneesh Getni on 2/10/24.
//

import Foundation
import SwiftUI

// List of food items
let foods = [
    "Bacon and Eggs",
    "Pancakes with Syrup",
    "Bagel with Cream Cheese",
    "Oatmeal with Brown Sugar",
    "Avocado Toast",
    "Acai Bowl",
    "Egg White Omelette",
    // Add more food items here
]

struct ContentView: View {
    @State private var searchText = ""
    
    var body: some View {
        VStack {
            TextField("Search", text: $searchText)
                .padding()
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .onChange(of: searchText) { _ in
                    // Update search results
                    let matches = getClosestMatches(for: searchText, in: foods)
                    displayResults(matches)
                }
            
            Spacer()
        }
        .padding()
    }
    
    func getClosestMatches(for searchText: String, in foods: [String]) -> [String] {
        return foods.filter { $0.lowercased().contains(searchText.lowercased()) }
    }
    
    func displayResults(_ matches: [String]) -> some View {
        return List(matches, id: \.self) { match in
            Text(match)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
