//
//  ContentModel.swift
//  Terminals Test App
//
//  Created by Fyodor Vladimirov on 03.08.2021.
//

import Foundation
import RealmSwift
import SwiftUI

class ContentModel: ObservableObject

{
    @Published var object : MainObject?
    var savedData = MyData()
    let decoder = JSONDecoder()
    
    @Published var allTerminals: [Terminal]?
    
    
    // Перменные из ContentView
    @Published var from = ""
    @Published var to = ""
    
    @Published var searchTextOne = ""
    @Published var searchTextTwo = ""
    @Published var searchingOne = false
    @Published var searchingTwo = false
    
    @Published var whereId = "0"

    
    
    
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
            
            // Все терминалы
            object!.city.forEach
            { city in
                var newTerminals = city.terminals.terminal
                allTerminals! += newTerminals
            }
            
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
                // Все терминалы
                object!.city.forEach
                { city in
                    var newTerminals = city.terminals.terminal
                    allTerminals?.append(contentsOf: newTerminals )
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
