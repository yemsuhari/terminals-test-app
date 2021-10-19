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
    var savedData = MyData()
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
            let dataObject = try Data(contentsOf: url)
            
            // Decode the data
            self.object = try decoder.decode(MainObject.self, from: dataObject)
            
            // Saving data to Realm database
            savedData.parsedData = dataObject
            
            let realm = try Realm()
            try realm.write
            {
                realm.deleteAll()
                realm.add(savedData)
            }
            
            return
        }
        catch
        {
            do
            {
                let realm = try Realm()
                let datas = realm.objects(MyData.self)
                if datas.first?.parsedData != nil
                {
                    self.object = try decoder.decode(MainObject.self, from: datas.first!.parsedData)
                }
                
                
            }
            catch
            {
                print(error)
            }
            
            print(error)
        }
        
        
    }
}
//print(Realm.Configuration.defaultConfiguration.fileURL)
