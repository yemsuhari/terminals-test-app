//
//  ContentModel.swift
//  Terminals Test App
//
//  Created by Fyodor Vladimirov on 03.08.2021.
//

import Foundation
import RealmSwift

class ContentModel: ObservableObject

{
    @Published var object : MainObject?
    
    init()
    {
        parseJson()
    }
    
    func parseJson()
    {
        //var object : MainObject?
        
        //let realm = try! Realm()
        
        //var myData = JsonData()
        
        // Get the path to the JSON file
        let urlString = "https://api.dellin.ru/static/catalog/terminals_v3.json"
        
        // Create a URL object
        guard let url = URL(string: urlString) else { return }
        
        let decoder = JSONDecoder()
        
        
//        URLSession.shared.dataTask(with: url)
//        { data, response, error in
//            if let error = error
//            {
//                print(error)
//                return
//            }
//
            
            do
            {
                // Create data object
                var myData = try Data(contentsOf: url)
                
                
                self.object = try decoder.decode(MainObject.self, from: myData)
                print("boba")
                return
            }
            catch
            {
                print(error)
            }
            
//        }.resume()
    }
}
