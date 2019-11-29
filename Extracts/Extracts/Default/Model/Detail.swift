//
//  Detail.swift
//  Extracts
//
//  Created by Bruno Todeschini on 11/11/19.
//  Copyright © 2019 Todeschini. All rights reserved.
//

import Foundation
import ObjectMapper

struct Detail: Codable, Mappable {
    
    var overdueDays: String?
    var overdueDate: String?
    var originalValue: String?
    var valueDiff: String?
    var totalValue: String?
    var store: String?
    
    init?(map: Map) {}
    
    mutating func mapping(map: Map) {
        self.overdueDays <- map["overdue_days"]
        self.overdueDate <- map["overdue_date"]
        self.originalValue <- map["original_value"]
        self.valueDiff <- map["value_diff"]
        self.totalValue <- map["total_value"]
        self.store <- map["store"]
    }

}
