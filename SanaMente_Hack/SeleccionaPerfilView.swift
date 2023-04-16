//
//  SeleccionaPerfilView.swift
//  SanaMente_Hack
//
//  Created by Alejandro Dennis on 16/04/23.
//

import SwiftUI

struct SeleccionaPerfilView: View {
    @State private var searchText = ""
    
    var body: some View {
        GeometryReader { geo in
            ZStack{
                VStack{
                    Text("Selecciona tu perfil")
                        .font(.system(size: 32, weight: .bold))
                    
                    Divider()
                    
                    NavigationStack {
                    }
                    .searchable(text: $searchText)
                    
                    
                        
                }
            }
            .frame(width: geo.size.width, height: geo.size.height)
        }
    }
}

struct SeleccionaPerfilView_Previews: PreviewProvider {
    static var previews: some View {
        SeleccionaPerfilView()
    }
}
