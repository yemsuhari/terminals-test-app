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
                                            Text(terminal.address)
                                                .padding(.top)
                                                .padding(.bottom)
                    
                                            Text("Время для прибытия: ")
                                                //.font(.system(size: 1000))
                                                .scaledToFit()
                                                .minimumScaleFactor(0.01)
                                                .lineLimit(1)
                                            
                                            let arrivalStrings = terminal.calcSchedule.arrival.split(separator: " ")
                                            Text(arrivalStrings[0])
                                                //.font(.system(size: 1000))
                                                .scaledToFit()
                                                .minimumScaleFactor(0.01)
                                                .lineLimit(1)
                                            Text(arrivalStrings[1])
                                                .padding(.bottom)
                                            
                                            Text("Время для отбытия: ")
                                                //.font(.system(size: 1000))
                                                .scaledToFit()
                                                .minimumScaleFactor(0.01)
                                                .lineLimit(1)
                                            
                                            let derivalStrings = terminal.calcSchedule.arrival.split(separator: " ")
                                            Text(derivalStrings[0])
                                                //.font(.system(size: 1000))
                                                .scaledToFit()
                                                .minimumScaleFactor(0.01)
                                                .lineLimit(1)
                                            let derivalStrings = terminal.calcSchedule.arrival.split(separator: " ")
                                            Text(derivalStrings[1])
                                                //.font(.system(size: 1000))
                                                .scaledToFit()
                                                .minimumScaleFactor(0.01)
                                                .lineLimit(1)
                                            
                                            // Расстояние до терминалов
                                            var distaceOne:String = content.findDistance(terminalLatitude: Double(terminal.latitude)!, terminalLongitude: Double(terminal.longitude)!)
                                            
                                            Image(systemName: "map")
                                                .foregroundColor(.blue)
                                                .imageScale(.large)
                                                .padding(.top)
                                            Text("Растояние до терминала: ")
                                            Text("\(distaceOne) километров")
                                            
                                            
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
                                            Text(terminal.address)
                                                .padding(.top)
                                                .padding(.bottom)
                    
                                            
                                            Text("Время для прибытия: ")
                                                //.font(.system(size: 1000))
                                                .scaledToFit()
                                                .minimumScaleFactor(0.01)
                                                .lineLimit(1)
                                            
                                            let arrivalStrings = terminal.calcSchedule.arrival.split(separator: " ")
                                            Text(arrivalStrings[0])
                                                //.font(.system(size: 1000))
                                                .scaledToFit()
                                                .minimumScaleFactor(0.01)
                                                .lineLimit(1)
                                            Text(arrivalStrings[1])
                                                .padding(.bottom)
                                            
                                            Text("Время для отбытия: ")
                                                //.font(.system(size: 1000))
                                                .scaledToFit()
                                                .minimumScaleFactor(0.01)
                                                .lineLimit(1)
                                            
                                            let derivalStrings = terminal.calcSchedule.arrival.split(separator: " ")
                                            Text(derivalStrings[0])
                                                //.font(.system(size: 1000))
                                                .scaledToFit()
                                                .minimumScaleFactor(0.01)
                                                .lineLimit(1)
                                            let derivalStrings = terminal.calcSchedule.arrival.split(separator: " ")
                                            Text(derivalStrings[1])
                                                //.font(.system(size: 1000))
                                                .scaledToFit()
                                                .minimumScaleFactor(0.01)
                                                .lineLimit(1)

                                            
                                            // Расстояние до терминалов
                                            var distaceTwo:String = content.findDistance(terminalLatitude: Double(terminal.latitude)!, terminalLongitude: Double(terminal.longitude)!)
                                            
                                            Image(systemName: "map")
                                                .foregroundColor(.blue)
                                                .imageScale(.large)
                                                .padding(.top)
                                            Text("Растояние до терминала: ")
                                            Text("\(distaceTwo) километров")
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
