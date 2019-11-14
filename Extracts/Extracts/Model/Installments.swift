//
//  Installments.swift
//  Extracts
//
//  Created by Bruno Todeschini on 11/11/19.
//  Copyright © 2019 Todeschini. All rights reserved.
//

import Foundation
import ObjectMapper

struct Installments: Codable, Mappable {
    
    var pastDue: String?
    var carnet: String?
    var installment: String?
    var value: String?
    var detail: Detail?

    
    init?(map: Map) {}
    
    mutating func mapping(map: Map) {
        pastDue <- map["past_due"]
        carnet <- map["carnet"]
        installment <- map["installment"]
        value <- map["value"]
        detail <- map["detail"]
    }

}
