//
//  BusinessSearch.swift
//  New Sight App
//
//  Created by Bharat Singh on 24/11/21.
//

import Foundation
struct BusinessSearch: Decodable {
    
var businesses = [Business]()
var total = 0
 var region = Region()
    
}




struct Region: Decodable {
    
    var center = Coordinate()
}
