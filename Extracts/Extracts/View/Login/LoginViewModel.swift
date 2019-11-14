//
//  LoginViewModel.swift
//  Extracts
//
//  Created by Bruno Todeschini on 11/11/19.
//  Copyright © 2019 Todeschini. All rights reserved.
//

import Foundation

class LoginViewModel {
    
    func doLogin(user: String, password: String){
        let service = LoginService()
        service.doLogin(user: user, password: password, success: { extract in
            print(extract)
        }, failure: {message in
           
        })
    }
}
