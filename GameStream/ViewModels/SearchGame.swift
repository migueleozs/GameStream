//
//  SearchGame.swift
//  GameStream
//
//  Created by Miguel Zamudio on 21/11/2024.
//

import Foundation

class SearchGame: ObservableObject {
    
    @Published var gameInfo = [Game]()

    func searchGame(gameName: String) {
    
        gameInfo.removeAll()
        
        
        // Sirve para detectar y poder usar nombres que tengan espacios como "The Witcher"
        let gameNameSpaces = gameName.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)
        
        //En caso de no tener un valor se le da uno por defecto
        let url = URL(string: "https://gamestreamapi.herokuapp.com/api/games/search?contains=\(gameNameSpaces ?? "Valor por defecto dado error")")!
        
        
            
            var request = URLRequest(url: url)
            request.httpMethod = "GET"
            
            URLSession.shared.dataTask(with: request) { data, response, error in
                do {
                    if let jsonData = data {
                        
                        print ("Tamaño del JSON: \(jsonData)")
                        
                        let decodeData = try JSONDecoder().decode(Resultados.self, from: jsonData)
                        
                        //se llama a otro hilo para que no se trave la UI mientras se realiza la solicitud
                        DispatchQueue.main.async {
                            //añade a la var gamesInfo lo que encuentra en decodeData
                            self.gameInfo.append(contentsOf: decodeData.results)
                        }
                        
                    }
                }catch {
                    print(error)
                }
                /*
                if let data = data {
                    do {
                        let gamesInfo = try JSONDecoder().decode([Game].self, from: data)
                        DispatchQueue.main.async {
                            
                        }
                    }
                }*/
                
                //IMPORTANTE PONER DESDE UN PRINCIPIO
            }.resume()
        }
        
    }
    
    
