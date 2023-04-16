//
//  SexPicker.swift
//  SanaMente_Hack
//
//  Created by Alejandro Dennis on 16/04/23.
//

import SwiftUI

struct SexPicker: Identifiable {
    
    var id: Int
    var category: String
    var image: String
    
}

extension SexPicker {
    static let sexOptions = [
        SexPicker(id: 0, category: "Male", image: "MaleFace"),
        SexPicker(id: 1, category: "Female", image: "FemaleFace")
    ]
    
}
