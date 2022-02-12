//
//  TypeProduct.swift
//  AppleApp
//
//  Created by Thanh Nguyên Trần on 29/12/2021.
//

import Foundation
import UIKit

struct typeProduct {
    let id : String
    let type : String

    init(_ id : String , _ type : String){
        self.id = id
        self.type = type
    }
}


enum ProductType : String,CaseIterable{
    case Wearable = "Wearable"
    case Laptops = "Laptops"
    case Phones = "Phones"
    case Tablets = "Tablets"
}

struct Product{
    var id = UUID().uuidString
    var type : ProductType
    var title : String
    var subtitle : String
    var description : String = ""
    var price : Int
    var productImage: String = ""
    var quantity : Int = 1

    init( _ type : ProductType,_ title : String,_ subtitle : String ,
         _ price:Int,_ productImage: String){
        self.type = type
        self.title = title
        self.subtitle = subtitle
        self.price = price
        self.productImage = productImage
        }
}
