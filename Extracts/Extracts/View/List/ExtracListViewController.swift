//
//  ExtracListViewController.swift
//  Extracts
//
//  Created by Bruno Todeschini on 22/11/19.
//  Copyright © 2019 Todeschini. All rights reserved.
//

import UIKit

class ExtractListViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    var extract: Extract?
    
    @IBOutlet weak var labelName: UILabel!
    @IBOutlet weak var labelAvailable: UILabel!
    @IBOutlet weak var labelTotal: UILabel!
    @IBOutlet weak var labelExpent: UILabel!
    @IBOutlet weak var extractTable: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.loadComponents()
        self.extractTable.dataSource = self
        self.extractTable.delegate = self
    }
    

    func loadComponents() {
        guard let extract: Extract = extract else { return }
        labelName.text = extract.name
        labelAvailable.text = extract.limits?.available
        labelTotal.text = extract.limits?.total
        labelExpent.text = extract.limits?.expent
    }
    
    //MARK - table
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return extract?.installments?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = extractTable.dequeueReusableCell(withIdentifier: "extractRow", for: indexPath) as! CellViewController
        if let installment = extract?.installments?[indexPath.item] {
            cell.labelPastDue.text = installment.pastDue
            cell.labelCarnet.text = installment.carnet
            cell.labelInstallment.text = installment.installment
            cell.labelValue.text = installment.value
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let cell: CellViewController = tableView.cellForRow(at: indexPath) as! CellViewController
        cell.checkBox.image = UIImage(named: "verified")
        if let installment = extract?.installments?[indexPath.item] {
            let storyBoard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
            let newViewController = storyBoard.instantiateViewController(withIdentifier: "DetailsViewController") as! DetailsViewController
            newViewController.extract = extract
            newViewController.detail = installment.detail
            self.navigationController?.pushViewController(newViewController, animated: true)
        }
        
    }
    
    func tableView(_ tableView: UITableView, didDeselectRowAt indexPath: IndexPath) {
        let cell: CellViewController = tableView.cellForRow(at: indexPath) as! CellViewController
        cell.checkBox.image = UIImage(named: "empty")
    }
    
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 60.0
    }
    
    @IBAction func btnLogout(_ sender: Any) {
        let storyBoard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        let newViewController = storyBoard.instantiateViewController(withIdentifier: "LoginViewController") as! LoginViewController
        self.navigationController?.pushViewController(newViewController, animated: true)
    }

}
