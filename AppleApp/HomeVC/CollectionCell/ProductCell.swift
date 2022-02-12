//
//  ProductCell.swift
//  AppleApp
//
//  Created by Thanh Nguyên Trần on 29/12/2021.
//

import UIKit

class ProductCell: UICollectionViewCell {

    
    @IBOutlet weak var typeView: UIView!
    @IBOutlet weak var productCollectionView: UICollectionView!
    @IBOutlet weak var typeProductLabel: UILabel!
    var count = 0
    let productLists : [Product] = productList
    
    let typeProducts : [typeProduct] = typeList
    var number = productList.count
    override func awakeFromNib() {
        super.awakeFromNib()
        setUpLayout()
        setupCollectionView()
    }

    func setUpLayout(){
        typeView.backgroundColor = UIColor().mainColor()
        typeView.layer.borderWidth = 1
        typeProductLabel.font = .boldSystemFont(ofSize: 20)
    }
    
    func setupCollectionView()
    {
        productCollectionView.delegate = self
        productCollectionView.dataSource = self
        
        productCollectionView.register(UINib(nibName: "ProductDetailCell", bundle: nil), forCellWithReuseIdentifier: "ProductDetailCell")
        
        
    }
      
}
extension ProductCell: UICollectionViewDelegate, UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ProductDetailCell", for: indexPath) as?  ProductDetailCell
        if typeProductLabel.text ==  "\(ProductType.Wearable)"{
        cell?.imageProduct.image = UIImage(named: wearables[indexPath.row].productImage)
            cell?.priceProductLabel.text = "$ \(wearables[indexPath.row].price)"
            cell?.nameProductLabel.text = wearables[indexPath.row].title
            cell?.SubtitleLabel.text = wearables[indexPath.row].subtitle
        }
        
        if typeProductLabel.text ==  "\(ProductType.Laptops)"{
        cell?.imageProduct.image = UIImage(named: laptops[indexPath.row].productImage)
            cell?.priceProductLabel.text = "$ \(laptops[indexPath.row].price)"
            cell?.nameProductLabel.text = laptops[indexPath.row].title
            cell?.SubtitleLabel.text = laptops[indexPath.row].subtitle
        }
        if typeProductLabel.text ==  "\(ProductType.Phones)"{
        cell?.imageProduct.image = UIImage(named: phones[indexPath.row].productImage)
            cell?.priceProductLabel.text = "$ \(phones[indexPath.row].price)"
            cell?.nameProductLabel.text = phones[indexPath.row].title
            cell?.SubtitleLabel.text = phones[indexPath.row].subtitle
        }
        if typeProductLabel.text ==  "\(ProductType.Tablets)"{
        cell?.imageProduct.image = UIImage(named: tablets[indexPath.row].productImage)
            cell?.priceProductLabel.text = "$ \(tablets[indexPath.row].price)"
            cell?.nameProductLabel.text = tablets[indexPath.row].title
            cell?.SubtitleLabel.text = tablets[indexPath.row].subtitle
        }
        
        return cell!
 }
        
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if typeProductLabel.text == "\(ProductType.Wearable)" {
            for i in productLists {
                if i.type == .Wearable{
                    count += 1
                }
            }
        }
        if typeProductLabel.text == "\(ProductType.Phones)"{
            for i in productLists {
                if i.type == .Phones{
                    count += 1
                }
            }
        }
        if typeProductLabel.text == "\(ProductType.Laptops)"{
            for i in productLists {
                if i.type == .Laptops{
                    count += 1
                }
            }
        }
        if typeProductLabel.text == "\(ProductType.Tablets)"{
            for i in productLists {
                if i.type == .Tablets{
                    count += 1
                }
            }
        }
        
        return count
}
}
extension ProductCell : UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        return CGSize(width: productCollectionView.frame.size.width/2.5, height: productCollectionView.frame.size.height)
        
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
      return 5
    }
}
