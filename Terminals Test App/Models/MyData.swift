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

class CurrentTerminals: Object
{
    @objc dynamic var firstTerminalId:String = ""
    @objc dynamic var secondTerminalId:String = ""
}
