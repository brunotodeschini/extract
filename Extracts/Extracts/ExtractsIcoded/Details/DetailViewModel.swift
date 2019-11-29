//
//  DetailsViewModel.swift
//  Extracts
//
//  Created by Bruno Todeschini on 22/11/19.
//  Copyright © 2019 Todeschini. All rights reserved.
//

import Foundation

class DetailViewModel {
    
    var extract: Extract?
    var detail: Detail?
    
    init(extract: Extract?, detail: Detail?) {
        self.extract = extract
        self.detail = detail
    }
}
