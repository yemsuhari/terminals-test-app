//
//  ContentView.swift
//  Terminals Test App
//
//  Created by Fyodor Vladimirov on 26.07.2021.
//

import SwiftUI
import Foundation
import CoreLocation
import PopupView
import MapKit
import RealmSwift

struct ContentView: View
{
    @State var showingPopup = false
    
    @EnvironmentObject var content: ContentModel
    
    @State var currentLocation = CLLocationManager()
    

    var body: some View
    {
        ZStack
        {
            NavigationView
            {
                VStack
                {
                    List
                    {
                        NavigationLink(destination: SecondView())
                        {
                            // Откуда
                            VStack
                            {
                                
                                Image(systemName: "building.2.crop.circle")
                                    .foregroundColor(.blue)
                                    .imageScale(.large)
                                
                                
                                ZStack
                                {
                                    Rectangle()
                                        .foregroundColor(Color("White"))
                                    HStack
                                    {
                                        Text(self.content.searchTextOne)
                                    }
                                }
                                
                                
                                // Подробности
                                ForEach(content.object!.city, id: \.id)
                                { city in
                                    
                                    ForEach(city.terminals.terminal, id: \.id)
                                    { terminal in
                                        
                                        
                                        if content.fromId == terminal.id
                                        {
                                            
                                
                                            
                                            Group
                                            {
                                                Text(terminal.address)
                                                    .padding(.top)
                                                    .padding(.bottom)

 
                                                Image(systemName: "stopwatch")
                                                    .foregroundColor(.blue)
                                                    .imageScale(.large)
                                                
                                                Text("Время для прибытия: ")
                                                    //.font(.system(size: 1000))
                                                    .scaledToFit()
                                                    .minimumScaleFactor(0.01)
                                                    .lineLimit(1)
                                                
                                                let arrivalStrings = terminal.calcSchedule.arrival.split(separator: ";")
                                                Text(arrivalStrings[0])
                                                let isArrivalIndexValid = arrivalStrings.indices.contains(1)
                                                if isArrivalIndexValid
                                                {
                                                    Text(arrivalStrings[1])
                                                        .padding(.bottom)
                                                }
                                                
                                                Text("Время для отбытия: ")
                                                    //.font(.system(size: 1000))
                                                    .scaledToFit()
                                                    .minimumScaleFactor(0.01)
                                                    .lineLimit(1)
                                                
                                                let derivalStrings = terminal.calcSchedule.derival.split(separator: ";")
                                                Text(derivalStrings[0])
                                                let isDerivalIndexValid = derivalStrings.indices.contains(1)
                                                if isDerivalIndexValid
                                                {
                                                    Text(derivalStrings[1])
                                                        .padding(.bottom)
                                                }
                                                
                                            }
                                            
                                            // Расстояние до терминалов
                                            let distaceOne:String = content.findDistance(terminalLatitude: Double(terminal.latitude)!, terminalLongitude: Double(terminal.longitude)!)
                                            
                                            Image(systemName: "map")
                                                .foregroundColor(.blue)
                                                .imageScale(.large)
                                                .padding(.top)
                                            Text("Растояние до терминала: ")
                                            Text("\(distaceOne) километров")
                                            
                                            
                                            Map(coordinateRegion: .constant(MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: Double(terminal.latitude)!, longitude: Double(terminal.longitude)!), span: MKCoordinateSpan(latitudeDelta: 0.03, longitudeDelta: 0.03))), interactionModes: [])
                                                        .frame(width: 250, height: 190)
                                                        .cornerRadius(12)
                                            
                                        }
                                    }
                                }

                                
                            }
                            
                            
                        }
                        
                        
                        // Куда
                        NavigationLink(destination: SecondView())
                        {
                            VStack
                            {
                                
                                Image(systemName: "building.2.crop.circle")
                                    .foregroundColor(.blue)
                                    .imageScale(.large)
                                
                                ZStack
                                {
                                    Rectangle()
                                        .foregroundColor(Color("White"))
                                    HStack
                                    {
                                        Text(content.searchTextTwo)
                                    }
                                }
                                
                                ForEach(content.object!.city, id: \.id)
                                { city in
                                    ForEach(city.terminals.terminal, id: \.id)
                                    { terminal in
                                        if content.toId == terminal.id
                                        {
                                            Group
                                            {
                                                Text(terminal.address)
                                                    .padding(.top)
                                                    .padding(.bottom)
                        
                                                Image(systemName: "stopwatch")
                                                    .foregroundColor(.blue)
                                                    .imageScale(.large)
                                                
                                                Text("Время для прибытия: ")
                                                
                                                let arrivalStrings = terminal.calcSchedule.arrival.split(separator: ";")
                                                Text(arrivalStrings[0])
                                                let isArrivalIndexValid = arrivalStrings.indices.contains(1)
                                                if isArrivalIndexValid
                                                {
                                                    Text(arrivalStrings[1])
                                                        .padding(.bottom)
                                                }
                                                
                                                    
                                                
                                                
                                                
                                                Text("Время для отбытия: ")
                                                    //.font(.system(size: 1000))
                                                    .scaledToFit()
                                                    .minimumScaleFactor(0.01)
                                                    .lineLimit(1)
                                                
                                                let derivalStrings = terminal.calcSchedule.derival.split(separator: ";")
                                                Text(derivalStrings[0])
                                                let isDerivalIndexValid = derivalStrings.indices.contains(1)
                                                if isDerivalIndexValid
                                                {
                                                    Text(derivalStrings[1])
                                                        .padding(.bottom)
                                                }

                                            }
                                            
                                            // Расстояние до терминалов
                                            var distaceTwo:String = content.findDistance(terminalLatitude: Double(terminal.latitude)!, terminalLongitude: Double(terminal.longitude)!)
                                            
                                            Image(systemName: "map")
                                                .foregroundColor(.blue)
                                                .imageScale(.large)
                                                .padding(.top)
                                            Text("Растояние до терминала: ")
                                            Text("\(distaceTwo) километров")
                                            
                                            Map(coordinateRegion: .constant(MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: Double(terminal.latitude)!, longitude: Double(terminal.longitude)!), span: MKCoordinateSpan(latitudeDelta: 0.03, longitudeDelta: 0.03))), interactionModes: [])
                                                        .frame(width: 250, height: 190)
                                                        .cornerRadius(12)
                                        }
                                    }
                                }

                            }
                        }
                        
                                            
                        
                        // Кнопка "Сохранить"
                        Button(
                            action:
                            {
                                self.showingPopup = true
                                
                                
                                do
                                {
                                    
                                    content.setFirstTerminal(terminalId: content.fromId)
                                    content.setSecondTerminal(terminalId: content.toId)
                                    
                                    content.currentRoute.id = UUID()
                                    
                                    content.routesArray.append(content.currentRoute)       //.append(content.currentRoute)
                                    
//                                    let encoder = JSONEncoder()
//                                    if let encoded = try? encoder.encode(content.routesArray)
//                                    {
//                                        let realm = try Realm()
//                                        
//                                        realm.beginWrite()
//                                        
//                                        content.savedRoutesData.savedData = encoded
//                                        
//                                        realm.add(content.savedRoutesData)
//                                        
//                                        try realm.commitWrite()
//                                    }
                                    
                                    
                                    
                                    
                                    
                                }
                                catch
                                {
                                   print("realm error")
                                }
                                
                            },
                            label:
                            {
                                Text("Сохранить")
                                    .foregroundColor(.blue)
                                    .frame(maxWidth: .infinity, alignment: .center)
                                    .offset(x: -10)
                                    .padding()
                            }
                        )
                            
                    }
                    
                }
                .navigationTitle("Терминалы")
            }
            .environmentObject(content)
        }
        .popup(isPresented: $showingPopup, type: .toast, autohideIn: 2)
        {
            HStack
            {
                Text("Сохранено")
                
                Image (systemName: "checkmark")
            }
            .frame(width: 350, height: 39)
            .background(Color.blue)
            .foregroundColor(Color.white)
            .cornerRadius(12)
            .padding(.bottom, 30)
        }

    }
}

struct ContentView_Previews: PreviewProvider
{
    static var previews: some View
    {
        ContentView()
    }
}

extension UIApplication
{
     func dismissKeyboard()
    {
         sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
    }
 }
