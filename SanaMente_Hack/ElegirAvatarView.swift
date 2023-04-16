//
//  ElegirAvatarView.swift
//  SanaMente_Hack
//
//  Created by Alejandro Dennis on 16/04/23.
//

import SwiftUI

struct ElegirAvatarView: View {
    var body: some View {
        GeometryReader { geo in
            ZStack{
                VStack{
                    Text("Selecciona tu avatar!")
                        .font(.system(size: 32, weight: .bold))
                    VStack{
                        HStack{
                            Text("H")
                        }
                    }
                }
            }
            .frame(width: geo.size.width, height: geo.size.height)
        }
    }
}

struct ElegirAvatarView_Previews: PreviewProvider {
    static var previews: some View {
        ElegirAvatarView()
    }
}
