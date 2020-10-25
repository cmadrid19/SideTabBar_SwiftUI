//
//  Item.swift
//  Side Tab Bar
//
//  Created by Maxim Macari on 25/10/2020.
//

import SwiftUI

// tabs
var tabs = ["Shakes", "Coffee", "Drinks", "Cocktails"]

//Item Model And Data
struct Item: Identifiable {
    var id = UUID().uuidString
    var title: String
    var cost: String
    var image: String
}

var items = [
    Item( title: "Orange juice shake", cost: "6,00", image: "orange"),
    Item( title: "Strawberry juice shake", cost: "10.00", image: "strawberry")
]
