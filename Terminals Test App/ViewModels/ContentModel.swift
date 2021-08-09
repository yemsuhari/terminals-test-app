//
//  ContentModel.swift
//  Terminals Test App
//
//  Created by Fyodor Vladimirov on 03.08.2021.
//

import Foundation

class ContentModel: ObservableObject

{
    func parseJson()
    {
        let urlString = "https://api.dellin.ru/static/catalog/terminals_v3.json"
        
        guard let url = URL(string: urlString) else { return }
        
        URLSession.shared.dataTask(with: url) {data, response, error in
            if let error = error
            {
                print(error)
                return
            }
            
            guard let data = data else { return }
            
            //let jsonString = String(data: data, encoding: .utf8)
            //print(jsonString)
            
            do
            {
                let decoder = JSONDecoder()
                
                //let dateFormatter = DateFormatter()
                //dateFormatter.dateFormat = "yyyy-MM-dd HH:mm:ss"
                //decoder.dateDecodingStrategy = .formatted(dateFormatter)
                
                let object = try decoder.decode(Object.self, from: data)
                print("boba")
                //print(cities.first?.name)
            }
            catch
            {
                print(error)
            }
            
            
        }.resume()

    }
}
