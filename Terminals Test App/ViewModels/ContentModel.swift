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
    var savedData = JsonData()
    let decoder = JSONDecoder()
    
    
    init()
    {
        parseJson()
    }
    
    func parseJson()
    {
        
        do
        {
            
            // Get the path to the JSON file
            let urlString = "https://api.dellin.ru/static/catalog/terminals_v3.jsons"
            
            // Create a URL object
            guard let url = URL(string: urlString) else { return }
            
            // Create data object
            var myData = try Data(contentsOf: url)
            
            // Decode the data
            self.object = try decoder.decode(MainObject.self, from: myData)
            
            // Saving data to Realm database
            savedData.parsedData = myData
            
            let realm = try Realm()
            try realm.write
            {
                realm.add(savedData)
            }

            
            return
        }
        catch
        {
            do
            {
                let realm = try Realm()
                let datas = realm.objects(JsonData.self)
                self.object = try decoder.decode(MainObject.self, from: datas[0].parsedData)
            }
            catch
            {
                print(error)
            }
            
            print(error)
        }
        
        
    }
}

//        }.resume()

//var object : MainObject?

//let realm = try! Realm()

//var myData = JsonData()


//        URLSession.shared.dataTask(with: url)
//        { data, response, error in
//            if let error = error
//            {
//                print(error)
//                return
//            }



//print(Realm.Configuration.defaultConfiguration.fileURL)
