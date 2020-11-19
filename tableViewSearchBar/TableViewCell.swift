//
//  TableViewCell.swift
//  tableViewSearchBar
//
//  Created by TAM NGUYEN DUC on 11/19/20.
//  Copyright © 2020 TAM NGUYEN DUC. All rights reserved.
//

import UIKit

class TableViewCell: UITableViewCell {

    @IBOutlet weak var cellLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
