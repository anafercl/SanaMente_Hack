//
//  Avatars.swift
//  SanaMente_Hack
//
//  Created by Alejandro Dennis on 16/04/23.
//

import SwiftUI

struct AvatarPicker: Identifiable {
    var id: Int
    var image: String
}

extension AvatarPicker {
    static let avatarOptions = [
        AvatarPicker(id: 0, image: "Avatar1"),
        AvatarPicker(id: 1, image: "Avatar2"),
        AvatarPicker(id: 2, image: "Avatar3"),
        AvatarPicker(id: 3, image: "Avatar4"),
        AvatarPicker(id: 4, image: "Avatar5"),
        AvatarPicker(id: 5, image: "Avatar6"),
        AvatarPicker(id: 6, image: "Avatar7"),
        AvatarPicker(id: 7, image: "Avatar8"),
        AvatarPicker(id: 8, image: "Avatar9"),
        AvatarPicker(id: 9, image: "Avatar10")
        
    ]
    
}
