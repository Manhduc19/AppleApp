//
//  TabBarViewController.swift
//  AppleApp
//
//  Created by Thanh Nguyên Trần on 29/12/2021.
//

import UIKit

class TabBarViewController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()

        setUpTabBar()
    }
    

    func setUpTabBar() {
        
        let homeVC = HomeViewController()
        let navHome = UINavigationController(rootViewController: homeVC)
        navHome.tabBarItem = UITabBarItem(title: "Home", image: UIImage(systemName: "house"), selectedImage: UIImage(systemName: "house.fill"))
        
        let listfavoriteVC = ListFavoriteViewController()
        let navListFavorite = UINavigationController(rootViewController: listfavoriteVC)
        navListFavorite.tabBarItem = UITabBarItem(title: "ListFavorite", image: UIImage(systemName: "heart"), selectedImage: UIImage(systemName: "heart.fill"))
        
        let profileVC = ProfileViewController()
        let navProfile = UINavigationController(rootViewController: profileVC)
        navProfile.tabBarItem = UITabBarItem(title: "Profile", image: UIImage(systemName: "person"), selectedImage: UIImage(systemName: "person.fill"))
        
        let cartbagVC = CartBagViewController()
        let navCartBag = UINavigationController(rootViewController: cartbagVC)
        navCartBag.tabBarItem = UITabBarItem(title: "Cart", image: UIImage(systemName: "cart"), selectedImage: UIImage(systemName: "cart.fill"))
        
        UITabBar.appearance().tintColor = UIColor().mainColor()
        setViewControllers([navHome,navListFavorite,navProfile,navCartBag], animated: true)

}
}
