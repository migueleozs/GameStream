//
//  Home.swift
//  GameStream
//
//  Created by Miguel Zamudio on 18/11/2024.
//

import SwiftUI
import AVKit

struct Home: View {
    
    @State var tabSeleccionado: Int = 0
    
    var body: some View {
        
        
        
        
        TabView(selection: $tabSeleccionado) {
            PantallaHome().tabItem {
                Image(systemName: "house")
                Text("Inicio")
            }.tag(0).toolbarBackground(Color.white, for: .tabBar).toolbarBackground(.hidden, for: .tabBar)
            
            
            Text("Pantalla Perfil").font(.system(size: 30, weight: .bold, design: .rounded)).tabItem {
                Image(systemName: "person")
                Text("Perfil")
            }.tag(1).toolbarBackground(Color.white, for: .tabBar).toolbarBackground(.hidden, for: .tabBar)
            
            
            GamesView()
            
            
            
            Text("Pantalla Favoritos").font(.system(size: 30, weight: .bold, design: .rounded)).tabItem {
                Image(systemName: "heart")
                Text("Favoritos")
            }.tag(3).toolbarBackground(Color.white, for: .tabBar).toolbarBackground(.hidden, for: .tabBar)
            
            
        }.accentColor(.white)
        
        
        
        
        
    }
    
    init(){
        
        UITabBar.appearance().backgroundColor = UIColor(Color("Plain-Blue"))
        UITabBar.appearance().unselectedItemTintColor = UIColor.gray
        UITabBar.appearance().isTranslucent = true
        
        
    }
    
    
}

struct PantallaHome:View {
    

    var body: some View {
        
        ZStack{
            Color("Marine").ignoresSafeArea()
            VStack{
                VStack {
                    
                    Image("appLogo").resizable().aspectRatio(contentMode: .fit).frame(width: 250).padding(.horizontal, 11)
                    

                ScrollView(showsIndicators: false){
                                SubModuloHome()
                                    			
                                }
                    
                    
                }
                
                
            }.padding(.horizontal, 18)
            
        }.navigationBarHidden(true).navigationBarBackButtonHidden(true)
        
        
        
    }
    
}


struct SubModuloHome:View {
    
    @State var textoBusqueda = ""
    @State var isGameInfoEmpty = false
    
    @ObservedObject var juegoEncontrado = SearchGame()
    @State var isGameViewActive = false
    
   
    @State var url: String = ""
    @State var titulo : String = ""
    @State var studio : String = ""
    @State var calificacion : String = ""
    @State var anoPublicacion : String = ""
    @State var descripcion : String = ""
    @State var tags : [String] = [""]
    @State var imgsUrl : [String] = [""]
    
    
    
    /*
    @State var url = "https://cdn.cloudflare.steamstatic.com/steam/apps/256658589/movie480.mp4"
    @State var isPlayerActive = false
    let urlVideos:[String] = ["https://cdn.cloudflare.steamstatic.com/steam/apps/256658589/movie480.mp4","https://cdn.cloudflare.steamstatic.com/steam/apps/256671638/movie480.mp4","https://cdn.cloudflare.steamstatic.com/steam/apps/256720061/movie480.mp4","https://cdn.cloudflare.steamstatic.com/steam/apps/256814567/movie480.mp4","https://cdn.cloudflare.steamstatic.com/steam/apps/256705156/movie480.mp4","https://cdn.cloudflare.steamstatic.com/steam/apps/256801252/movie480.mp4","https://cdn.cloudflare.steamstatic.com/steam/apps/256757119/movie480.mp4"]
    
    */
    
    var body: some View {
        
      
        
        VStack{
            
            HStack{
                
                Button(action: {
                    watchGame(name:textoBusqueda)
                    
                    
                    
                }, label:{  Image(systemName: "magnifyingglass").foregroundColor(textoBusqueda.isEmpty ? Color(.yellow) : Color("Dark-Cian")
                )
                }).alert(isPresented: $isGameInfoEmpty) {
                    Alert(title: Text("Error"), message: Text("No se encontro el juego"), dismissButton: .default(Text("Ok"))
                )}
                
                ZStack(alignment: .leading)
                {
                    if textoBusqueda.isEmpty{
                        Text ("Busca un video").foregroundColor(Color(red: 174/255, green: 177/255, blue: 185/255, opacity: 1.0))
                    }
                    
                    TextField("", text: $textoBusqueda).foregroundColor(.white)
                    
                }
            }.padding([.top, .leading, .bottom], 11.0)
                        .background(Color("Blue-Gray"))
                        .clipShape(Capsule())

            
            Text("LOS MAS POPULARES").font(.title3).foregroundColor(.white).fontWeight(.bold).frame(minWidth: 0, maxWidth: .infinity, alignment: .leading).padding(.top)
            
            
            
            ZStack{
                
                Button(action: {
                    watchGame(name: "The Witcher 3")
                }, label: {
                    
                    VStack(spacing: 0){
                        Image("The Witcher 3").resizable().scaledToFill()
                        Text("The Witcher 3").frame(minWidth: 0, maxWidth: .infinity, alignment: .leading).background(Color("Plain-Blue"))
                    }
                })
                
                Image(systemName: "play.circle.fill").resizable().foregroundColor(.white).frame(width: 42, height: 42)
                
                
            }.frame(minWidth: 0, maxWidth: .infinity, alignment: .center).padding(.vertical)
            
            
            Text("CATEGORIAS SUGERIDAS PARA TI")
                .font(.title3)
                .foregroundColor(.white)
                .bold()
                .frame(minWidth: 0, maxWidth: .infinity, alignment: .leading)
            
            
            ScrollView(.horizontal, showsIndicators: false){
                HStack  {
                    
                    Button(action: {print("Presionado categoría FPS")}, label: {
                        ZStack{
                            
                            RoundedRectangle(cornerRadius: 10).fill(Color("Plain-Blue")).frame(width: 160, height: 90)
                            
                            Image("fps").resizable().scaledToFit().frame(width: 42, height: 42)
                            
                        }
                        
                    })
                    
                    Button(action: {print("Pulsado categoría RPG")}, label: {
                        ZStack{
                            
                            RoundedRectangle(cornerRadius: 10).fill(Color("Plain-Blue")).frame(width: 160, height: 90)
                            
                            Image("rpg-text").resizable().scaledToFit().frame(width: 42, height: 42)
                            
                        }
                        
                        Button(action: {print("Clickeado categoría Open World")}, label: {
                            ZStack{
                                
                                RoundedRectangle(cornerRadius: 10).fill(Color("Plain-Blue")).frame(width: 160, height: 90)
                                
                                Image("open-world-icon").resizable().scaledToFit().frame(width: 42, height: 42)
                                
                            }
                            
                        })
                        
                    })
                    
                }
            }
            
            Spacer(minLength: 30)
            
            Text("RECOMENDADOS PARA TI")
                .font(.title3)
                .foregroundColor(.white)
                .bold()
                .frame(minWidth: 0, maxWidth: .infinity, alignment: .leading)
            
            ScrollView(.horizontal, showsIndicators: false){
                HStack  {
                    
                    Button(action: {
                        watchGame(name: "Abzu")
                    }, label: {
                        
                            Image("Abzu").resizable().scaledToFill()
                            .frame(width: 240, height: 135)
                    
                    })
                    
                    Button(action: {
                        watchGame(name: "Crash Bandicoot")
                    }, label: {
                        
                            Image("Crash Bandicoot").resizable().scaledToFill()
                            .frame(width: 240, height: 135)
                    
                    })
                    
                    
                    Button(action: {
                        watchGame(name: "DEATH STRANDING")
                    }, label: {
                        
                            Image("DEATH STRANDING").resizable().scaledToFill()
                            .frame(width: 240, height: 135)
                    
                    })
                    
                    
                }
            }
            
            
        }
        
        Spacer(minLength: 30)
        
        Text("Videos que podrían gustarte")
            .font(.title3)
            .foregroundColor(.white)
            .bold()
            .frame(maxWidth: .infinity, alignment: .leading)

        Spacer(minLength: 15)
        
        ScrollView(.horizontal, showsIndicators: false) {
            HStack  {
                Button(action: {
                    watchGame(name: "Cuphead")
                }) {
                    Image("Cuphead")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 240, height: 135)
                }
                
                Button(action: {
                    watchGame(name: "Hades")
                }) {
                    Image("Hades")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 240, height: 135)
                }
            }
        }
        .padding(.bottom)
        
        
        NavigationLink(
            destination: GameView(url: url, titulo: titulo, studio: studio, calificacion: calificacion, anoPublicacion: anoPublicacion, descripcion: descripcion, tags: tags, imgsUrl: imgsUrl),
            isActive: $isGameViewActive,
            label: {
                EmptyView()
            })
        
    }
    
    func watchGame(name: String)    {
        
        juegoEncontrado.searchGame(gameName: name)
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.3) {
            print("Cantidad de juegos encontrados: \(juegoEncontrado.gameInfo.count)" )
            if juegoEncontrado.gameInfo.count == 0 {
                isGameInfoEmpty = true
            }
            else    {
                url = juegoEncontrado.gameInfo[0].videosUrls.mobile
                titulo = juegoEncontrado.gameInfo[0].title
                studio = juegoEncontrado.gameInfo[0].studio
                calificacion = juegoEncontrado.gameInfo[0].contentRaiting
                anoPublicacion = juegoEncontrado.gameInfo[0].publicationYear
                descripcion = juegoEncontrado.gameInfo[0].description
                tags = juegoEncontrado.gameInfo[0].tags
                imgsUrl = juegoEncontrado.gameInfo[0].galleryImages
                
                isGameViewActive = true
                
            }
            
        }
        /*
        print("Buscar juego")
        isGameInfoEmpty = true
         */
    }
    
    
}


#Preview {
    Home()
}
