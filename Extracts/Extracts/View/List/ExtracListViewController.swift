//
//  ExtracListViewController.swift
//  Extracts
//
//  Created by Bruno Todeschini on 22/11/19.
//  Copyright © 2019 Todeschini. All rights reserved.
//

import UIKit

class ExtractListViewController: BaseViewController {
    
    @IBOutlet weak var labelName: UILabel!
    @IBOutlet weak var labelAvailable: UILabel!
    @IBOutlet weak var labelTotal: UILabel!
    @IBOutlet weak var labelExpent: UILabel!
    @IBOutlet weak var extractTable: UITableView!
    
    var viewModel: ExtractListViewModel? = nil
    
    override func viewDidLoad() {
        self.hideLoader()
        super.viewDidLoad()
        self.loadComponents()
        self.extractTable.dataSource = self
        self.extractTable.delegate = self
    }
    

    func loadComponents() {
        guard let extract: Extract = self.viewModel?.extract else { return }
        labelName.text = extract.name
        labelAvailable.text = extract.limits?.available
        labelTotal.text = extract.limits?.total
        labelExpent.text = extract.limits?.expent
    }
    
    
    @IBAction func btnLogout(_ sender: Any) {
        let storyBoard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        if let newViewController = storyBoard.instantiateViewController(withIdentifier: "LoginViewController") as? LoginViewController {
            self.navigationController?.pushViewController(newViewController, animated: true)
        }
    }
}

extension ExtractListViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let cell = tableView.cellForRow(at: indexPath) as? CellViewController {
            cell.checkBox.image = UIImage(named: "verified")
            if let installment = self.viewModel?.extract?.installments?[indexPath.item] {
                let storyBoard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
                if let viewController = storyBoard.instantiateViewController(withIdentifier: "DetailsViewController") as? DetailsViewController {
                    viewController.viewModel = DetailViewModel(extract: viewModel?.extract, detail: installment.detail)
                    self.navigationController?.pushViewController(viewController, animated: true)
                }
            }
        }
    }
        
    func tableView(_ tableView: UITableView, didDeselectRowAt indexPath: IndexPath) {
        if let cell: CellViewController = tableView.cellForRow(at: indexPath) as? CellViewController {
            cell.checkBox.image = UIImage(named: "empty")
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 60.0
    }
}

extension ExtractListViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel?.extract?.installments?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = extractTable.dequeueReusableCell(withIdentifier: "extractRow", for: indexPath) as! CellViewController
        if let installment = viewModel?.extract?.installments?[indexPath.item] {
            cell.labelPastDue.text = installment.pastDue
            cell.labelCarnet.text = installment.carnet
            cell.labelInstallment.text = installment.installment
            cell.labelValue.text = installment.value
        }
        return cell
    }
}
