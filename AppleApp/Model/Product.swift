//
//  Product.swift
//  AppleApp
//
//  Created by Thanh Nguyên Trần on 29/12/2021.
//

import Foundation
import UIKit


let typeList : [typeProduct] = [
    typeProduct(UUID().uuidString,"Wearable") ,
    typeProduct(UUID().uuidString,"Laptops"),
    typeProduct(UUID().uuidString,"Phones"),
    typeProduct(UUID().uuidString,"Tablets"),
]


let productList : [Product] = [
    Product( .Wearable, "Apple Watch", "Series 4", 359, "aw1"),
    Product(.Wearable, "Apple Watch", "Series 5", 400, "aw2"),
    Product(.Wearable, "Apple Watch", "Series 6", 500, "aw3"),
    Product(.Wearable, "Apple Watch", "Series 7", 600, "aw4"),

    Product(.Laptops, "MacBook Pro", "13 inch", 1000, "mac1"),
    Product(.Laptops, "MacBook Pro", "16 inch", 1300, "mac2"),
    Product(.Laptops, "MacBook Air", "13 inch", 700, "mac3"),
    Product(.Laptops, "MacBook Air", "16 inch", 900, "mac4"),
    
    Product( .Phones, "Iphone 13", "Promax", 1000, "ip1"),
    Product( .Phones, "Iphone 12", "Promax", 900, "ip2"),
    Product( .Phones, "Iphone 11", "Promax", 800, "ip3"),
    Product(.Phones, "Iphone XS", "Promax", 700, "ip4"),

    Product(.Tablets, "Ipad Pro", "M1", 359, "ipad1"),
    Product( .Tablets, "Ipad Promax", "M1", 359, "ipad2"),
    Product(.Tablets, "Ipad Air", "Intel", 359, "ipad3"),
    Product( .Tablets, "Ipad Mini", "Intel", 359, "ipad4")
]
let wearables : [Product] = [
    Product( .Wearable, "Apple Watch", "Series 4", 359, "aw1"),
    Product(.Wearable, "Apple Watch", "Series 5", 400, "aw2"),
    Product(.Wearable, "Apple Watch", "Series 6", 500, "aw3"),
    Product(.Wearable, "Apple Watch", "Series 7", 600, "aw4")
]
let phones : [Product] = [
    Product( .Phones, "Iphone 13", "Promax", 1000, "ip1"),
    Product( .Phones, "Iphone 12", "Promax", 900, "ip2"),
    Product( .Phones, "Iphone 11", "Promax", 800, "ip3"),
    Product(.Phones, "Iphone XS", "Promax", 700, "ip4")
]
let laptops : [Product] = [
    Product(.Laptops, "MacBook Pro", "13 inch", 1000, "mac1"),
    Product(.Laptops, "MacBook Pro", "16 inch", 1300, "mac2"),
    Product(.Laptops, "MacBook Air", "13 inch", 700, "mac3"),
    Product(.Laptops, "MacBook Air", "16 inch", 900, "mac4")
]
let tablets : [Product] = [
    Product(.Tablets, "Ipad Pro", "M1", 359, "ipad1"),
    Product( .Tablets, "Ipad Promax", "M1", 359, "ipad2"),
    Product(.Tablets, "Ipad Air", "Intel", 359, "ipad3"),
    Product( .Tablets, "Ipad Mini", "Intel", 359, "ipad4")
]

var names: [String] = []
var searchNames: [String] = []
