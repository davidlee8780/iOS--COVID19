//
//  Countries.swift
//  COVID19
//
//  Created by David Lee on 30/03/20.
//  Copyright © 2020 David Lee. All rights reserved.
//

import Foundation

struct Country: Codable {
    var country: String
    var cases: Int
    var deaths: Int
    var recovered: Int
    var updated: Int
    var countryInfo: CountryInfo

    enum CodingKeys: String, CodingKey {

        case country = "country"
        case countryInfo = "countryInfo"
        case cases = "cases"
        case deaths = "deaths"
        case recovered = "recovered"
        case updated = "updated"
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        country = try values.decodeIfPresent(String.self, forKey: .country) ?? ""
        countryInfo = try values.decodeIfPresent(CountryInfo.self, forKey: .countryInfo)!
        cases = try values.decodeIfPresent(Int.self, forKey: .cases) ?? 0
        deaths = try values.decodeIfPresent(Int.self, forKey: .deaths) ?? 0
        recovered = try values.decodeIfPresent(Int.self, forKey: .recovered) ?? 0
        updated = try values.decodeIfPresent(Int.self, forKey: .updated) ?? 0
    }
}
