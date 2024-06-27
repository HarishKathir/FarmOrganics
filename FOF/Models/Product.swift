//
//  Product.swift
//  FOF
//
//  Created by Harishkathir on 19/08/23.
//

import Foundation

struct Product : Identifiable {
    var id = UUID()
    var name : String
    var image : String
    var description : String
    var supplier : String
    var price : Int

}

var productList = [
    Product(name: "Honey",
            image: "Honey",
            description: "Organic honey is produced from the pollen of organically grown plants, and without chemical miticides to treat the bees. Buying organic honey ensures that you avoid contact with pesticides that may be sprayed on or near the plants visited by honeybees.",
            supplier: "FarmOrganics",
            price: 200),
    
    Product(name: "RedChilli",
            image: "RedChilli",
            description: "Orgrain India Red Chilli powder is the dried, crushed form of red chilli pepper. Besides adding flavour to dishes, Organic Chilli Powder also acts as an antioxidant to strengthen the immune system.",
            supplier: "FarmOrganics",
            price: 300),
    
    Product(name: "Turmeric",
            image: "Turmeric",
            description: "Organic Tattva's Organic Turmeric/Haldi Powder is a rich source of calcium, iron and protein. Along with these, Organic Haldi Powder also contains dietary fibres, vitamins and various other required nutrients. One serving of Organic Haldi Powder contains 0g trans fat and 0mg cholesterol.",
            supplier: "FarmOrganics",
            price: 270),
    
    Product(name: "Wheat",
            image: "Wheat",
            description: "Organic wheat is grown without using off-farm inputs like fertilizers, pesticides, preservatives and growth regulators. Farmers rely on crop rotation, green manures, legumes, crop residues, mechanical cultivation, and biological pest control methods to yield a proper and healthy organic harvest.",
            supplier: "FarmOrganics",
            price: 1200),
    
    Product(name: "OliveOil",
            image: "OliveOil",
            description: " Organic olive oil is the definition for the olive oil produced with organic processes, in accordance with EU regulations. This means firstly that the olives have been cultivated without chemical-synthetic fertilizers, plant protection products, and soil herbicides.",
            supplier: "FarmOrganics",
            price: 800),
    
    Product(name: "Sugar",
            image: "Sugar",
            description: " Organic olive oil is the definition for the olive oil produced with organic processes, in accordance with EU regulations. This means firstly that the olives have been cultivated without chemical-synthetic fertilizers, plant protection products, and soil herbicides.",
            supplier: "FarmOrganics",
            price: 300),
    
    Product(name: "CoconutOil",
            image: "CoconutOil",
            description: " Organic olive oil is the definition for the olive oil produced with organic processes, in accordance with EU regulations. This means firstly that the olives have been cultivated without chemical-synthetic fertilizers, plant protection products, and soil herbicides.",
            supplier: "FarmOrganics",
            price: 400),
    
    Product(name: "OliveOil",
            image: "OliveOil",
            description: " Organic olive oil is the definition for the olive oil produced with organic processes, in accordance with EU regulations. This means firstly that the olives have been cultivated without chemical-synthetic fertilizers, plant protection products, and soil herbicides.",
            supplier: "FarmOrganics",
            price: 800),
    
]
