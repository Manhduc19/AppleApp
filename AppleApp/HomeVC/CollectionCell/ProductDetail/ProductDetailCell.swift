//
//  ProductDetailCell.swift
//  AppleApp
//
//  Created by Thanh Nguyên Trần on 09/01/2022.
//

import UIKit

class ProductDetailCell: UICollectionViewCell {

    @IBOutlet weak var imageProduct: UIImageView!
    @IBOutlet weak var SubtitleLabel: UILabel!
    @IBOutlet weak var priceProductLabel: UILabel!
    @IBOutlet weak var nameProductLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

}
