//
//  ContentView.swift
//  Terminals Test App
//
//  Created by Fyodor Vladimirov on 26.07.2021.
//

import SwiftUI
import Foundation
import CoreLocation

struct ContentView: View
{
    
    @EnvironmentObject var content: ContentModel
    
    @State var currentLocation = CLLocationManager()
    
    var body: some View
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
                                        Text(terminal.calcSchedule.arrival)
                                            //.font(.system(size: 1000))
                                            .scaledToFit()
                                            .minimumScaleFactor(0.01)
                                            .lineLimit(1)
                                        
                                        Text("Время для отбытия: ")
                                            //.font(.system(size: 1000))
                                            .scaledToFit()
                                            .minimumScaleFactor(0.01)
                                            .lineLimit(1)
                                        Text(terminal.calcSchedule.derival)
                                            //.font(.system(size: 1000))
                                            .scaledToFit()
                                            .minimumScaleFactor(0.01)
                                            .lineLimit(1)
                                            .padding(.bottom)
                                        
                                        
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
                                        Text(terminal.calcSchedule.arrival)
                                            //.font(.system(size: 1000))
                                            .scaledToFit()
                                            .minimumScaleFactor(0.01)
                                            .lineLimit(1)
                                        
                                        Text("Время для отбытия: ")
                                            //.font(.system(size: 1000))
                                            .scaledToFit()
                                            .minimumScaleFactor(0.01)
                                            .lineLimit(1)
                                        Text(terminal.calcSchedule.derival)
                                            //.font(.system(size: 1000))
                                            .scaledToFit()
                                            .minimumScaleFactor(0.01)
                                            .lineLimit(1)
                                    }
                                }
                            }

                        }
                    }
                    
                                        
                    
                    // Кнопка "Сохранить"
                    Button(action:  {}, label: {
                        Text("Сохранить")
                            .foregroundColor(.blue)
                            .frame(maxWidth: .infinity, alignment: .center)
                            .offset(x: -10)
                            .padding()
                    })
                }
                                
                
            }
            .navigationTitle("Терминалы")
        }
        .environmentObject(content)
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
