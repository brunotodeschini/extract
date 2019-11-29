//
//  DetailsViewModel.swift
//  Extracts
//
//  Created by Bruno Todeschini on 22/11/19.
//  Copyright © 2019 Todeschini. All rights reserved.
//

import Foundation

class DetailViewModel {
    
    var myExtract: Extract?
    var myDetail: Detail?
    
    init(extract: Extract?, detail: Detail?) {
        self.myExtract = extract
        self.myDetail = detail
    }
}
