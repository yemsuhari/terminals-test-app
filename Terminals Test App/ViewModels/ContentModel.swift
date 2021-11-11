//
//  ContentModel.swift
//  Terminals Test App
//
//  Created by Fyodor Vladimirov on 03.08.2021.
//

import Foundation
import RealmSwift
import SwiftUI
import CoreLocation

class ContentModel: NSObject, CLLocationManagerDelegate, ObservableObject

{
    @Published var object : MainObject?
    var savedData = MyData()
    let decoder = JSONDecoder()
    
    @Published var allTerminals: [Terminal]?
    
    
    // CoreLocation
    var locationManager = CLLocationManager()
    @Published var userLocation:CLLocation?
    
    
    // Перменные из Views
    @Published var from = ""
    @Published var to = ""
    
    @Published var searchTextOne = "Откуда"
    @Published var searchTextTwo = "Куда"
    @Published var searchingOne = false
    @Published var searchingTwo = false
    
    @Published var fromId = "0"
    @Published var toId = "0"

    
    
    
    override init()
    {
        // Init method of NSObject
        super.init()
        
        parseJson()
        
        // CoreLocation staff
        
        // Set the content model as the delegateof the location manager
        locationManager.delegate = self
        
        // Request permission from the user
        locationManager.requestWhenInUseAuthorization()
        
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
    
    // Location Manager Delegate Method
    func locationManager(_ manager: CLLocationManager, didUpdateHeading newHeading: CLHeading)
    {
        if locationManager.authorizationStatus == .authorizedAlways ||
            locationManager.authorizationStatus == .authorizedWhenInUse
        {
            // We have permission
            // Start geolocating the user, after we get permission
            locationManager.startUpdatingLocation()
            
        }
        else if locationManager.authorizationStatus == .denied
        {
            // We don't have permission
        }
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation])
    {
        // Gives us the location of the user
        guard locations.first != nil
        else
        {
            //  Что-то пошло не так
            return
        }
        userLocation = locations.first!
        
        // Stop requesting the location after we get in once
        locationManager.stopUpdatingLocation()
    }
    
    func findDistance(terminalLatitude:Double, terminalLongtitude:Double) -> Double
    {
        let terminalLocation = CLLocation(latitude: terminalLatitude, longitude: terminalLongtitude)
        return userLocation?.distance(from: terminalLocation) ?? 100
    }
}
