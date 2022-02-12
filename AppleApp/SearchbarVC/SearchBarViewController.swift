//
//  SearchBarViewController.swift
//  AppleApp
//
//  Created by Thanh Nguyên Trần on 10/01/2022.
//

import UIKit

class SearchBarViewController: UIViewController {
    let data = ["red","blue","green","yellow","pink","purple","white","black","gray"]
    var filter : [String]!
    @IBOutlet weak var resultTableView: UITableView!
    @IBOutlet weak var searchBarView: UISearchBar!
    override func viewDidLoad() {
        super.viewDidLoad()
        filter = data
        
        searchBarView.delegate = self
        searchBarView.showsCancelButton = true
        
        resultTableView.delegate = self
        resultTableView.dataSource = self
        resultTableView.register(UITableViewCell.self, forCellReuseIdentifier: "UITableViewCell")
    }

}

extension SearchBarViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return filter.count
    }
     func numberOfSections(in tableView: UITableView) -> Int {
        
        return 1
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "UITableViewCell", for: indexPath)
        cell.textLabel?.text = filter[indexPath.row]
        return cell
    }
}
extension SearchBarViewController : UISearchBarDelegate{
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        filter = []
        if searchText == "" {
            filter = data
        }else{
            for color in data{
                if color.lowercased().contains(searchText.lowercased()){
                    filter.append(color)
                }
            }
        }
        self.resultTableView.reloadData()
        
    }
}
