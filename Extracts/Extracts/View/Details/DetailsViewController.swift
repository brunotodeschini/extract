//
//  DetailsViewController.swift
//  Extracts
//
//  Created by Bruno Todeschini on 22/11/19.
//  Copyright © 2019 Todeschini. All rights reserved.
//

import UIKit

class DetailsViewController: BaseViewController {

    @IBOutlet weak var labelUserName: UILabel!
    @IBOutlet weak var labelDueDate: UILabel!
    @IBOutlet weak var labelOriginalValue: UILabel!
    @IBOutlet weak var labelValueDiff: UILabel!
    @IBOutlet weak var labelFinalValue: UILabel!
    @IBOutlet weak var labelStore: UILabel!
    
    var viewModel: DetailViewModel? = nil
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loadComponents()
    }
    
    func loadComponents() {
        if let viewModel = viewModel {
            labelUserName.text = viewModel.myExtract?.name
            labelDueDate.text = viewModel.myDetail?.overdueDate
            labelOriginalValue.text = viewModel.myDetail?.originalValue
            labelValueDiff.text = viewModel.myDetail?.valueDiff
            labelFinalValue.text = viewModel.myDetail?.totalValue
            labelStore.text = viewModel.myDetail?.store
        }
    }
    

    @IBAction func backButton(_ sender: Any) {
        let storyBoard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        if let viewController = storyBoard.instantiateViewController(withIdentifier: "ExtractListViewController") as? ExtractListViewController {
            viewController.viewModel = ExtractListViewModel(viewModel?.myExtract)
                self.navigationController?.pushViewController(viewController, animated: true)
        }
    }
    

}
