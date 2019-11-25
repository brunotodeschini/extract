//
//  BaseViewController.swift
//  
//
//  Created by Bruno Todeschini on 25/11/19.
//

import Foundation
import UIKit

class BaseViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }
    
    func showLoader() {
        let alert = UIAlertController(title: "Aguarde", message: nil, preferredStyle: .alert)

        let loadingIndicator = UIActivityIndicatorView(frame: CGRect(x: 10, y: 5, width: 50, height: 50))
        loadingIndicator.hidesWhenStopped = true
        loadingIndicator.style = UIActivityIndicatorView.Style.medium
        loadingIndicator.startAnimating();
        
        alert.view.addSubview(loadingIndicator)
        present(alert, animated: true, completion: nil)
    }
       
    func hideLoader() {
        dismiss(animated: false, completion: nil)
    }
    
    func showAlertError(message: String) {
        let alert = UIAlertController(title: "Atenção", message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Ok", style: UIAlertAction.Style.default, handler: nil))
        
        if presentedViewController == nil {
            self.present(alert, animated: true, completion: nil)
        } else{
            self.dismiss(animated: false) { () -> Void in
                self.present(alert, animated: true, completion: nil)
              }
        }
    }

}
