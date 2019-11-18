//
//  CellViewController.swift
//  Extracts
//
//  Created by Bruno Todeschini on 14/11/19.
//  Copyright © 2019 Todeschini. All rights reserved.
//

import UIKit

class CellViewController: UITableViewCell {
    
    @IBOutlet weak var checkBox: UIImageView!
    @IBOutlet weak var labelPastDue: UILabel!
    @IBOutlet weak var labelCarnet: UILabel!
    @IBOutlet weak var labelInstallment: UILabel!
    @IBOutlet weak var labelValue: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
