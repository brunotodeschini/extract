//
//  Response.swift
//  Extracts
//
//  Created by Bruno Todeschini on 14/11/19.
//  Copyright © 2019 Todeschini. All rights reserved.
//

import Foundation
import ObjectMapper

struct ResponseWrapper<T: Mappable> : Mappable {
    
    var code: Int = -1
    var status: String?
    var data: T?
    
    init?(map: Map){}
    
    mutating func mapping(map: Map) {
        self.code <- map["code"]
        self.status <- map["status"]
        self.data <- map["data"]
    }
}
