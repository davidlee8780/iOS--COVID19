//
//  Extensions.swift
//  COVID19
//
//  Created by David Lee on 31/03/20.
//  Copyright © 2020 David Lee. All rights reserved.
//

import SwiftUI

extension UIApplication {
    func endEditing() {
        sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
    }
}
