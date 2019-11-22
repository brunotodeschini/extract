//
//  DetailsViewController.swift
//  Extracts
//
//  Created by Bruno Todeschini on 22/11/19.
//  Copyright © 2019 Todeschini. All rights reserved.
//

import UIKit

class DetailsViewController: UIViewController {
    
    var extract: Extract?
    var detail: Detail?

    @IBOutlet weak var labelUserName: UILabel!
    @IBOutlet weak var labelDueDate: UILabel!
    @IBOutlet weak var labelOriginalValue: UILabel!
    @IBOutlet weak var labelValueDiff: UILabel!
    @IBOutlet weak var labelFinalValue: UILabel!
    @IBOutlet weak var labelStore: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loadComponents()
    }
    
    func loadComponents() {
        if let extract = extract, let details = detail {
            labelUserName.text = extract.name
            labelDueDate.text = details.overdueDate
            labelOriginalValue.text = details.originalValue
            labelValueDiff.text = details.valueDiff
            labelFinalValue.text = details.totalValue
            labelStore.text = details.store
        }
    }
    

    

}
