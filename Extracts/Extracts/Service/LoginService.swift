//
//  LoginService.swift
//  Extracts
//
//  Created by Bruno Todeschini on 11/11/19.
//  Copyright © 2019 Todeschini. All rights reserved.
//

import Foundation
import Alamofire
import ObjectMapper
import AlamofireObjectMapper

class LoginService {
    
    let baseURL: URL?
    
    init () {
        baseURL = URL(string: "http://www.icoded.com.br/api/extract.php")!
    }
    
    func doLogin(user: String, password: String, success: @escaping (Extract?) -> Void, failure: @escaping (String?) -> Void) {
        let pwd = ["pwd": password]
        Alamofire.request(String(describing: baseURL!), method: .post, parameters: pwd).responseObject { (response: DataResponse<ResponseWrapper<Extract>>) in
            switch response.result {
            case let .success (value):
                if let data: ResponseWrapper = response.result.value {
                    success(data.data)
                }
            case let .failure (value):
                print (value)
            }
        }
    }
}