//
//  TableViewController.swift
//  tableViewSearchBar
//
//  Created by TAM NGUYEN DUC on 11/19/20.
//  Copyright © 2020 TAM NGUYEN DUC. All rights reserved.
//

import UIKit

class TableViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, UISearchResultsUpdating {
    
    
    
    var list : [String] = [
      "001 - Tam", "002 - Ly", "003 - Hieu", "004 - Tien"
    ]
    
    var filteredTableData = [String]()
    var resultSearchController = UISearchController()

    @IBOutlet weak var tableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        let nib = UINib(nibName: "TableViewCell", bundle: .main)
        tableView.register(nib, forCellReuseIdentifier: "cell")
        
        // search
        resultSearchController = ({
            let controller = UISearchController(searchResultsController: nil)
            controller.searchResultsUpdater = self
            controller.obscuresBackgroundDuringPresentation = false
            controller.searchBar.sizeToFit()

            tableView.tableHeaderView = controller.searchBar

            return controller
        })()

        // Reload the table
        tableView.reloadData()
        

        // Do any additional setup after loading the view.
    }


   func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    if resultSearchController.isActive {
        return filteredTableData.count
    } else {
        return list.count
    }
    
    
   }
   
   func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! TableViewCell
    if resultSearchController.isActive {
        cell.cellLabel?.text = filteredTableData[indexPath.row]
    } else {
        cell.cellLabel?.text = list[indexPath.row]
    }
    return cell
   }
   
    func updateSearchResults(for searchController: UISearchController) {
        filteredTableData.removeAll(keepingCapacity: false)

        let searchPredicate = NSPredicate(format: "SELF CONTAINS[c] %@", searchController.searchBar.text!)
        let array = (list as NSArray).filtered(using: searchPredicate)
        filteredTableData = array as! [String]

        self.tableView.reloadData()
    }
}
