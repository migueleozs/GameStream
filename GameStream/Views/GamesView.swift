//
//  GamesView.swift
//  GameStream
//
//  Created by Miguel Zamudio on 20/11/2024.
//

import SwiftUI
import Kingfisher

struct GamesView: View {
    
    //
    @ObservedObject var todosLosJuegos = ViewModel()
    
    @State var gameviewIsActive: Bool = false
    @State var url: String = ""
    @State var titulo : String = ""
    @State var studio : String = ""
    @State var calificacion : String = ""
    @State var anoPublicacion : String = ""
    @State var descripcion : String = ""
    @State var tags : [String] = [""]
    @State var imgsUrl : [String] = [""]
    
    //el lazyGrid es ideal cuando se trabaja con muchos datos (arrays) pero no sabemos cuantos vamos a usar entonces solo llama cuando se solicita puntualmente
    let formaGrid = [
        GridItem(.flexible()),
        GridItem(.flexible())
        
    ]
    
    
    var body: some View {
        ZStack {
            Color("Marine").ignoresSafeArea()
            
            VStack {
                Text("Juegos").font(.title2).bold().foregroundColor(.white).padding(EdgeInsets(top: 16, leading: 0, bottom: 64, trailing: 0))
                
                
                ScrollView{
                   LazyVGrid(columns: formaGrid, spacing: 8) {
                       ForEach(todosLosJuegos.gamesInfo, id: \.self){
                           juego in
                           
                           Button(action: {
                               url = juego.videosUrls.mobile
                               titulo = juego.title
                               studio = juego.studio
                               calificacion = juego.contentRaiting
                               anoPublicacion = juego.publicationYear
                               descripcion = juego.description
                               tags = juego.tags
                               imgsUrl = juego.galleryImages
                               print ("Pulse el juego \(titulo)")
                               
                               gameviewIsActive = true
                               
                           }, label:{
                               KFImage(URL(string: juego.galleryImages[0])!)
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .clipShape(RoundedRectangle.init(cornerRadius: 4))
                                .padding(.bottom, 12)
                           } )
                           
                       }
                    }
                }
                
                NavigationLink(destination: GameView(url: url, titulo: titulo, studio: studio, calificacion: calificacion, anoPublicacion: anoPublicacion, descripcion: descripcion, tags: tags, imgsUrl: imgsUrl),
                               isActive: $gameviewIsActive,
                               label: { EmptyView()  } )
                
                
                
            }.navigationBarHidden(true)
            .navigationBarBackButtonHidden(true)
                .onAppear {
                    
                    if !todosLosJuegos.gamesInfo.isEmpty {
                        // Ahora accedemos de forma segura al primer elemento
                        print("Primer elemento del JSON: \(todosLosJuegos.gamesInfo[0])")
                        print("Titulo del primer juego del JSON: \(todosLosJuegos.gamesInfo[0].title)")
                    } else {
                        print("El arreglo gamesInfo está vacío o no contiene datos")
                    }
                    
                }
        }
        
    }
}

#Preview {
    GamesView()
}
