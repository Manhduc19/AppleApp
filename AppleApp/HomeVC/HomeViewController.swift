//
//  HomeViewController.swift
//  AppleApp
//
//  Created by Thanh Nguyên Trần on 29/12/2021.
//

import UIKit

class HomeViewController: UIViewController {

    @IBOutlet weak var productCollectionView: UICollectionView!
    @IBOutlet weak var searchBarView: UISearchBar!
    let typeproducts : [typeProduct] = typeList
    override func viewDidLoad() {
        super.viewDidLoad()

        config()
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.tabBarController?.tabBar.isHidden = false
        navigationController?.isNavigationBarHidden = true
    }
    func config(){
        setUpCollectionView()
        let tabSearch = UITapGestureRecognizer(target: self, action: #selector(didTabSearchView))
        searchBarView.searchTextField.addGestureRecognizer(tabSearch)
    }
    func setUpCollectionView(){
        productCollectionView.delegate = self
        productCollectionView.dataSource = self
        productCollectionView.register(UINib(nibName: "ProductCell", bundle: nil), forCellWithReuseIdentifier: "ProductCell")
    }
    @objc func didTabSearchView() {
        let vc  = SearchBarViewController()
        navigationController?.pushViewController(vc, animated: true)
    }

    

}
extension HomeViewController : UICollectionViewDataSource, UICollectionViewDelegate{
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
       let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ProductCell", for: indexPath) as? ProductCell
       cell?.typeProductLabel.text = typeproducts[indexPath.row].type
           return cell!
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        return typeproducts.count
    }
}
extension HomeViewController: UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        return CGSize(width: productCollectionView.frame.size.width, height: productCollectionView.frame.size.height/2)
    }
    
}
