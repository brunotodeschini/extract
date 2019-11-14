//
//  Limits.swift
//  Extracts
//
//  Created by Bruno Todeschini on 11/11/19.
//  Copyright © 2019 Todeschini. All rights reserved.
//

import Foundation
import ObjectMapper

struct Limits: Codable, Mappable {
    
    var totalDue: String?
    var total: String?
    var expent: String?
    var available: String?
    
    init?(map: Map) {}
    
    mutating func mapping(map: Map) {
        self.totalDue <- map["total_due"]
         self.total <- map["total"]
         self.expent <- map["expent"]
         self.available <- map["available"]
    }
}
