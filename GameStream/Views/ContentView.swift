//
//  ContentView.swift
//  GameStream
//
//  Created by Miguel Zamudio on 17/11/2024.
//

import SwiftUI

struct ContentView: View {
    
    
    var body: some View {
        
        NavigationView() {
            ZStack {
                
                Spacer()
                
                Color(red: 20/255, green: 30/255, blue: 51/255, opacity: 1.0).ignoresSafeArea()
                //Color(.blue).ignoresSafeArea()
                
                
                VStack {
                    
                    Image("appLogo").resizable().aspectRatio(contentMode: .fit).frame(width: 250).padding(.bottom, 42)
                    
                    InicioYRegistroView()
                }
            }.navigationBarHidden(true)
        }
        
    }
}


struct InicioYRegistroView:View {
    
    @State var tipoInicioSesion = true
    
    
    var body: some View {
        
        
        VStack  {
            
            HStack {
                
                Spacer()
                Button("INICIA SESION") {
                    print("Inicia Sesion")
                    tipoInicioSesion = true
                }.foregroundColor(tipoInicioSesion ? .white : .gray)
                
                Spacer()
                
                Button("REGISTRATE") {
                    print("Registro")
                    tipoInicioSesion = false
                }.foregroundColor(tipoInicioSesion ? .gray : .white)
                
                Spacer()
                
                
            }
            
            Spacer(minLength: 42)
            
            if tipoInicioSesion == true{
                InicioSesionView()
            }
            else    {
                RegistroView()
            }
            
        }
    }
}

struct InicioSesionView:View {
    
    @State var correo = ""
    @State var contrasena = ""
    @State var isPantallaHomeActive = false
    
    var body: some View {
        
        
        ScrollView {
            
            VStack(alignment: .leading) {
                
                Text("Correo Electronico").foregroundColor(Color("Dark-Cian"))
                
                
                ZStack(alignment: .leading){
                    
                    if correo.isEmpty    {
                        Text("ejemplo@gmail.com").font(.caption).foregroundColor(.gray)
                    }
                    
                    
                    TextField("", text: $correo).foregroundColor(.white)
                }
                
                Divider().frame(height: 1).background(Color("Dark-Cian")).padding(.bottom)
                
                
                Text("Contraseña").foregroundColor(Color(.white))
                
                ZStack(alignment: .leading){
                    
                    if contrasena.isEmpty    {
                        Text("Escribe tu contraseña").font(.caption).foregroundColor(.gray)
                    }
                    
                    
                    SecureField("", text: $contrasena).foregroundColor(.white)
                }
                
                Divider().frame(height: 1).background(Color("Dark-Cian")).padding(.bottom)
                
                
                Text("¿Olvidaste tu contraseña?").font(.footnote).frame(width: 300, alignment: .trailing).foregroundColor(Color("Dark-Cian")).padding(.bottom)
                
                
                Button(action: iniciarSesion, label:{
                    Text("INICIAR SESION").fontWeight(.bold).foregroundColor(.white).frame(maxWidth: .infinity, alignment: .center)
                        .padding(EdgeInsets(top: 11, leading: 18, bottom: 11, trailing: 18))
                        .overlay(RoundedRectangle(cornerRadius: 6.0).stroke(Color("Dark-Cian"), lineWidth: 1.0).shadow(color:.white, radius: 6))
                    //stroke sirve para gestionar el borde del rectangulo
                })
                
                Spacer()
                
                Text("Inicia sesion con tus redes sociales").foregroundColor(.white).padding(.top, 50).frame(width: 300, alignment: .center)
                
                Spacer(minLength: 20)
                
                HStack(alignment: .center){
                    Button(action: {print("Inicio de sesion con Facebook")}, label:{
                        Text("Facebook")
                    }).frame(width: 150, height: 40, alignment: .center).background(Color("Plain-Blue")).foregroundColor(.white).overlay(RoundedRectangle(cornerRadius: 15.0).stroke(Color("Plain-Blue"), lineWidth: 1.0).shadow(color:.white, radius: 10))
                    Spacer(minLength: 15)
                    Button(action: {print("Inicio de sesion con Twitter")}, label:{
                        Text("Twitter")
                    }).frame(width: 150, height: 40, alignment: .center).background(Color("Plain-Blue")).foregroundColor(.white).overlay(RoundedRectangle(cornerRadius: 15.0).stroke(Color("Plain-Blue"), lineWidth: 1.0).shadow(color:.white, radius: 10))
                    
                    
                }
                
                
            }.padding(.horizontal, 77.0)
            
            NavigationLink(
                destination: Home(),
                isActive: $isPantallaHomeActive,
                label: {
                    EmptyView()
                })
                
            }
            
            
            
        }
        
    func iniciarSesion(){
        print("Estoy iniciando sesion")
        isPantallaHomeActive = true
    }
    
    
    }




struct RegistroView:View {
    
    @State var correo = ""
    @State var contrasena = ""
    @State var confirmarContrasena = ""
    
    
    var body: some View {
        ScrollView {
            
            VStack(alignment: .center) {
                Text("Elije una foto de perfil").fontWeight(.bold).foregroundColor(.white)
            }
            
            Text("Puedes seleccionarla desde la galeria").font(.footnote).fontWeight(.light).foregroundColor(.gray).padding(.bottom)
            
            
            Button(action: tomarFoto, label: {
                ZStack {
                    Image("perfilEjemplo").resizable().aspectRatio(contentMode: .fit)
                        .frame(width: 100, height: 100)
                    
                    Image(systemName: "camera").foregroundColor(.white)
                }.padding(.bottom)
                
                
            })
            VStack(){
           VStack(alignment: .leading) {
                
                Text("Correo Electronico*").foregroundColor(Color("Dark-Cian"))
                
                
                ZStack(alignment: .leading){
                    
                    if correo.isEmpty    {
                        Text("ejemplo@gmail.com").font(.caption).foregroundColor(.gray)
                    }
                    
                    
                    TextField("", text: $correo).foregroundColor(.white)
                }
                
                Divider().frame(height: 1).background(Color("Dark-Cian")).padding(.bottom)
                
                
                Text("Contraseña*").foregroundColor(Color(.white))
                
                ZStack(alignment: .leading){
                    
                    if contrasena.isEmpty    {
                        Text("Escribe tu contraseña").font(.caption).foregroundColor(.gray)
                    }
                    
                    
                    SecureField("", text: $contrasena).foregroundColor(.white)
                }
                
                Divider().frame(height: 1).background(Color("Dark-Cian")).padding(.bottom)
                
               Text("Confirmar contraseña*").foregroundColor(Color(.white))
               
               ZStack(alignment: .leading){
                   
                   if confirmarContrasena.isEmpty    {
                       Text("Vuelve a escribir tu contraseña").font(.caption).foregroundColor(.gray)
                   }
                   
                   
                   SecureField("", text: $confirmarContrasena).foregroundColor(.white)
               }
               
               Divider().frame(height: 1).background(Color("Dark-Cian")).padding(.bottom)
               
               
                
           }
               
                Button(action: registrate, label:{
                    Text("REGISTRATE").fontWeight(.bold).foregroundColor(.white).frame(maxWidth: .infinity, alignment: .center)
                        .padding(EdgeInsets(top: 11, leading: 18, bottom: 11, trailing: 18))
                        .overlay(RoundedRectangle(cornerRadius: 6.0).stroke(Color("Dark-Cian"), lineWidth: 1.0).shadow(color:.white, radius: 6))
                    //stroke sirve para gestionar el borde del rectangulo
                })
                
                Spacer()
                
                Text("Registrate con tus redes sociales").foregroundColor(.white).padding(.top, 50).frame(width: 300, alignment: .center)
                
                Spacer(minLength: 20)
                
                HStack(alignment: .center){
                    Button(action: {print("Registro exitoso con Facebook")}, label:{
                        Text("Facebook")
                    }).frame(width: 150, height: 40, alignment: .center).background(Color("Plain-Blue")).foregroundColor(.white).overlay(RoundedRectangle(cornerRadius: 15.0).stroke(Color("Plain-Blue"), lineWidth: 1.0).shadow(color:.white, radius: 10))
                    Spacer(minLength: 15)
                    Button(action: {print("Registro exitoso con Twitter")}, label:{
                        Text("Twitter")
                    }).frame(width: 150, height: 40, alignment: .center).background(Color("Plain-Blue")).foregroundColor(.white).overlay(RoundedRectangle(cornerRadius: 15.0).stroke(Color("Plain-Blue"), lineWidth: 1.0).shadow(color:.white, radius: 10))
                    
                    
                }
                
                
            }.padding(.horizontal, 77.0)
          
            
            
            
        }
    }
    
    
    
}

func tomarFoto() {
    print("tomar foto")
}

func registrate () {
    print("Te registraste")
}

#Preview {
    ContentView()
    
    //Image("pantalla01").resizable()
}
