//
//  CrearUsuarioView.swift
//  SanaMente_Hack
//
//  Created by Alejandro Dennis on 16/04/23.
//

import SwiftUI

struct CrearUsuarioView: View {
    @AppStorage("Name") var name: String = ""
    @State private var lastName: String = ""
    @State private var dateBirth = Date()
    
    @State var sexEdit: String = "Male"
    
    var body: some View {
        GeometryReader { geo in
            ZStack{
                VStack(spacing: 50){
                    HStack(spacing: 50){
                        ForEach(SexPicker.sexOptions) { sex in
                            VStack{
                                Image(sex.image)
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 100, height: 100)
                                    .background(Circle().fill(Color("GrayColor")))
                                    .clipShape(Circle())
                                    .opacity(sexEdit == sex.category ? 1.0 : 0.3)
                                    .onTapGesture {
                                        sexEdit = sex.category
                                    }
                                Text(sex.category)
                                    .font(.system(size: 18, weight: .semibold))
                                    .foregroundColor(sexEdit == sex.category ? .black : .gray)
                            }
                            
                           
                        }
                    }
                    
                    VStack(spacing: 50) {
                        VStack(alignment: .leading){
                            Text("Nombre")
                                .font(.system(size: 18, weight: .regular))
                            HStack {
                                TextField("Nombre", text: $name)
                            }
                            .padding()
                            .background(Rectangle().fill(Color.white).cornerRadius(10))
                            .frame(width: geo.size.width * 0.9)
                            .shadow(radius: 5)
                        }
                        
                        VStack(alignment: .leading){
                            Text("Apellido")
                                .font(.system(size: 18, weight: .regular))
                            HStack {
                                TextField("Apellido", text: $lastName)
                            }
                            .padding()
                            .background(Rectangle().fill(Color.white).cornerRadius(10))
                            .frame(width: geo.size.width * 0.9)
                            .shadow(radius: 5)
                        }
                        
                        HStack{
                            Text("Fecha de Nacimiento")
                                .font(.system(size: 18, weight: .regular))
                            
                            DatePicker("", selection: $dateBirth, in: ...Date(), displayedComponents: [.date])
   
                        }.frame(width: geo.size.width * 0.9)
                    }
                    
                    Button {
                        
                    } label: {
                        Text("Continuar")
                            .frame(width: geo.size.width * 0.85, height: geo.size.height * 0.085)
                    }
                    .font(.system(size: 24, weight: .bold))
                    .foregroundColor(.white)
                    .frame(width: geo.size.width * 0.85, height: geo.size.height * 0.085)
                    .background(Color("GreenColor"))
                    .cornerRadius(40)
                    
                }
               
  
                
            }
            .frame(width: geo.size.width, height: geo.size.height)
            
        }
    }
    
    private let dateFormatter: DateFormatter = {
            let formatter = DateFormatter()
            formatter.dateStyle = .medium
            formatter.timeStyle = .none
            return formatter
    }()
}

struct CrearUsuarioView_Previews: PreviewProvider {
    static var previews: some View {
        CrearUsuarioView()
    }
}
