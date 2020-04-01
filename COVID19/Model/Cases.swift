//
//  Cases.swift
//  COVID19
//
//  Created by David Lee on 31/03/20.
//  Copyright © 2020 David Lee. All rights reserved.
//

import Foundation

struct Cases: Codable {
    var cases: Int?
    var deaths: Int?
    var recovered: Int?
    var updated: Int?
    
    init(cases: Int, deaths: Int, recovered: Int, updated: Int) {
        self.cases = cases
        self.deaths = deaths
        self.recovered = recovered
        self.updated = updated
    }
    
    enum CodingKeys: String, CodingKey {
        case cases = "cases"
        case deaths = "deaths"
        case recovered = "recovered"
        case updated = "updated"
    }
    
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        cases = try values.decodeIfPresent(Int.self, forKey: .cases)
        deaths = try values.decodeIfPresent(Int.self, forKey: .deaths)
        recovered = try values.decodeIfPresent(Int.self, forKey: .recovered)
        updated = try values.decodeIfPresent(Int.self, forKey: .updated)
    }
}
