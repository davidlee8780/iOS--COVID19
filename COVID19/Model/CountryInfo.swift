//
//  CountryData.swift
//  COVID19
//
//  Created by David Lee on 30/03/20.
//  Copyright © 2020 David Lee. All rights reserved.
//

import Foundation

struct CountryInfo: Codable {

    let flag : String

    enum CodingKeys: String, CodingKey {
        case flag = "flag"
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        flag = try values.decodeIfPresent(String.self, forKey: .flag) ?? ""
    }
}
