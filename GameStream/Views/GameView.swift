//
//  GameView.swift
//  GameStream
//
//  Created by Miguel Zamudio on 20/11/2024.
//

import SwiftUI
import AVKit
import Kingfisher

struct GameView: View {
    
    var url : String
    var titulo : String
    var studio : String
    var calificacion : String
    var anoPublicacion : String
    var descripcion : String
    var tags : [String]
    var imgsUrl : [String]
    
    var body: some View {
        ZStack {
            Color("Marine").ignoresSafeArea()
            
            VStack {
                video(url: url).frame(height:300)
                
                ScrollView  {
                    //informacion del video
                    videoInfo (titulo:titulo, studio:studio, calificacion:calificacion, anoPublicacion:anoPublicacion, descripcion:descripcion, tags:tags).padding(.bottom)
                    
                    Gallery (imgsUrl:imgsUrl).padding(.bottom)
                    
                }.frame(maxWidth: .infinity)
                
            }
        }
    }
}

struct video : View{
    
    var url : String
    
    var body : some View {
        let player = AVPlayer(url: URL(string: url)!)
        
        VideoPlayer(player: player)
            .ignoresSafeArea()
            .onDisappear(perform: {
                            player.pause()
                        })
        
    }
}


struct videoInfo : View{
    
   
    var titulo : String
    var studio : String
    var calificacion : String
    var anoPublicacion : String
    var descripcion : String
    var tags : [String]
    
    var body: some View
    {
        VStack (alignment:.leading) {
            
            Text("\(titulo)")
                .foregroundColor(.white)
                .font(.largeTitle)
                .bold()
                .padding(.leading)
            
            HStack  {
                Text("\(studio)")
                    .foregroundColor(.white)
                    .font(.subheadline)
                    .bold()
                    .padding(.top, 5)
                    .padding(.leading)
                
                Text("\(calificacion)")
                    .foregroundColor(.white)
                    .font(.subheadline)
                    .bold()
                    .padding(.top, 5)
                
                Text("\(anoPublicacion)")
                    .foregroundColor(.white)
                    .font(.subheadline)
                    .bold()
                    .padding(.top, 5)
                
            }
            
            Text("\(descripcion)")
                .foregroundColor(.white)
                .font(.subheadline)
                .padding(.top, 5)
                .padding(.leading)
            
            HStack {
                ForEach(tags, id:\.self) { tag in
                    Text("#\(tag)")
                        .foregroundColor(.white)
                        .font(.subheadline)
                        .bold()
                        .padding(.top, 5)
                        .padding(.leading)
                }
            }
            
        }.frame(maxWidth: .infinity, alignment: .leading)
    }
}

struct Gallery : View {
    
    var imgsUrl : [String]
    let formaGrid = [
        GridItem(.flexible())
        
    ]
    
    var body: some View {
        
        VStack (alignment: .leading) {
            
            Text("GALERIA")
                .foregroundColor(.white)
                .font(.largeTitle)
                .bold()
                .padding(.leading)
            
            ScrollView (.horizontal){
                
                LazyHGrid    (rows: formaGrid, spacing: 8) {
                    
                    ForEach (imgsUrl, id: \.self) {
                        imgUrl in
                        
                        //Desplegar imagen del servidor
                        KFImage(URL(string: imgUrl))
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                        
                    }
                    
                }
                
            }.frame(height: 180)
            
        }.frame(maxWidth: .infinity, alignment: .leading)
        
    }
}

#Preview {
    GameView(url: "ejemplo",titulo:"Sonic The Hedgehog"
        ,studio:"Sega"
        ,calificacion:"E+"
        ,anoPublicacion:"1991"
        ,descripcion:"Juego de Sega Genesis publicado en 1991 con más de 40 millones de copias vendidas actualmente"
        ,tags:["plataformas","mascota"], imgsUrl: [ "https://cdn.cloudflare.steamstatic.com/steam/apps/268910/ss_615455299355eaf552c638c7ea5b24a8b46e02dd.600x338.jpg","https://cdn.cloudflare.steamstatic.com/steam/apps/268910/ss_615455299355eaf552c638c7ea5b24a8b46e02dd.600x338.jpg","https://cdn.cloudflare.steamstatic.com/steam/apps/268910/ss_615455299355eaf552c638c7ea5b24a8b46e02dd.600x338.jpg"])
}

