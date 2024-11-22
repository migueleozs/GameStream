//
//  ViewModel.swift
//  GameStream
//
//  Created by Miguel Zamudio on 20/11/2024.
//

import Foundation

// la clase apunta a una direccion de memoria, sirve para hacer referencia con el viewmodel y agarrar los datos

//Comunicacion de la vista y el ViewModel es instanciando la clase
//Comunicacion del ViewModel y el Modelo es por el property grapper @Published
class ViewModel : ObservableObject {
    
    @Published var gamesInfo = [Game]()
    
    //al momento de crear el objeto va al servidor y trae los datos para guardarlos en la variable (gamesInfo
    init() {
        let url = URL(string: "https://gamestreamapi.herokuapp.com/api/games")!
        
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        
        URLSession.shared.dataTask(with: request) { data, response, error in
            do {
                if let jsonData = data {
                    
                    print ("Tamaño del JSON: \(jsonData)")
                    
                    let decodeData = try JSONDecoder().decode([Game].self, from: jsonData)
                    
                    //se llama a otro hilo para que no se trave la UI mientras se realiza la solicitud
                    DispatchQueue.main.async {
                        //añade a la var gamesInfo lo que encuentra en decodeData
                        self.gamesInfo.append(contentsOf: decodeData)
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
