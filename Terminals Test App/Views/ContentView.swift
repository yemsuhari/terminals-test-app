//
//  ContentView.swift
//  Terminals Test App
//
//  Created by Fyodor Vladimirov on 26.07.2021.
//

import SwiftUI
import Foundation

struct ContentView: View
{
    
    
    @StateObject var content = ContentModel()
    
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
                        ZStack
                        {
                            Rectangle()
                                .foregroundColor(Color("White"))
                            HStack
                            {
                                //Image(systemName: "magnifyingglass")
                                Text("Откуда")
//                                TextField("Откуда", text: $searchTextOne)
//                                { startedEditing in
//                                    if startedEditing
//                                    {
//                                        withAnimation
//                                        {
//                                            searchingOne = true
//                                        }
//                                    }
//                                }
//                                onCommit:
//                                {
//                                    withAnimation
//                                    {
//                                        searchingOne = false
//                                    }
//                                }
                            }
                        }
                        .cornerRadius(13)
                    }
                    
                                        
                    // Список "Откуда"
                    if content.searchingOne == true
                    {
                        ForEach(content.object!.city, id: \.id)
                        { city in
                            ForEach(city.terminals.terminal.filter({ (terminal: Terminal) -> Bool in
                                return terminal.name.hasPrefix(content.searchTextOne) || content.searchTextOne == ""
                            }), id: \.id)
                            { terminal in
                                if terminal.receiveCargo == true
                                {
                                    Button(action: {
                                        content.searchTextOne = terminal.name
                                        content.searchingOne = false
                                        UIApplication.shared.dismissKeyboard()
                                        content.whereId = terminal.id
                                    }, label: {
                                        Text(terminal.name)
                                    })
                                }
                            }
                        }
                    }
                    
                    // Куда
                    NavigationLink(destination: SecondView())
                    {
                        ZStack
                        {
                            Rectangle()
                                .foregroundColor(Color("White"))
                            HStack
                            {
                                //Image(systemName: "magnifyingglass")
                                Text("Куда")
//                                TextField("Куда", text: $searchTextTwo)
//                                { startedEditing in
//                                    if startedEditing
//                                    {
//                                        withAnimation
//                                        {
//                                            searchingTwo = true
//                                        }
//                                    }
//                                }
//                                onCommit:
//                                {
//                                    withAnimation
//                                    {
//                                        searchingTwo = false
//                                    }
//                                }
                            }
                        }
                        .cornerRadius(13)

                    }
                    
                                        
                    
                    // Список "Куда"
//                    if searchingTwo == true
//                    {
//                        ForEach(content.object!.city, id: \.id)
//                        { city in
//                            ForEach(city.terminals.terminal.filter({ (terminal: Terminal) -> Bool in
//                                return terminal.name.hasPrefix(searchTextTwo) || searchTextTwo == ""
//                            }), id: \.id)
//                            { terminal in
//                                if (terminal.giveoutCargo == true) && (terminal.terminalDefault == true)
//                                {
//                                    Button(action: {
//                                        searchTextTwo = terminal.name
//                                        searchingTwo = false
//                                        UIApplication.shared.dismissKeyboard()
//                                        whereId = terminal.id
//                                    }, label: {
//                                        Text(terminal.name)
//                                    })
//                                }
//                            }
//                        }
//                    }
                    
                    Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/, label: {
                        Text("Сохранить")
                            .foregroundColor(.blue)
                            .frame(maxWidth: .infinity, alignment: .center)
                            .offset(x: -10)
                            .padding()
                    })
                }
                
                // пример использования информации из object
//                if content.object?.city.first?.name != nil
//                {
//                    Text(content.object!.city.first!.name)
//                        .padding(100)
//                }
                
                
            }
            .navigationTitle("Терминалы")
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
