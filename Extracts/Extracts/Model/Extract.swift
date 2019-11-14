//
//  Extract.swift
//  Extracts
//
//  Created by Bruno Todeschini on 11/11/19.
//  Copyright © 2019 Todeschini. All rights reserved.
//

import Foundation
import ObjectMapper

struct Extract: Codable, Mappable {

    var name: String?
    var totalOverdue: String?
    var totalDue: String?
    var installments: [Installments]?
    var limits: Limits?
    
    init?(map: Map) {
        if map.JSON["data"] == nil {
            return nil
        }
    }
    
    mutating func mapping(map: Map) {
        self.name <- map["name"]
        self.totalOverdue <- map["total_overdue"]
        self.totalDue <- map["total_due"]
        self.installments <- map["installments"]
        self.limits <- map ["limits"]
    }
}
