//
//  MyData.swift
//  Terminals Test App
//
//  Created by Fyodor Vladimirov on 16.10.2021.
//

import Foundation
import RealmSwift

class MyData: Object
{
   @objc dynamic var parsedData = Data()
}

struct Route: Codable
{
    var id = UUID()
    
    var firstTerminalId:String = ""
    var secondTerminalId:String = ""
}

//class SavedRoutes: Codable
//{
//    var arrayOfSavedTerminals = [Route]()
//}

class SavedRoutesData: Object, Codable
{
   @objc dynamic var savedData = Data()
}
