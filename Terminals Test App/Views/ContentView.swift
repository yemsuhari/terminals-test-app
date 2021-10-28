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
    
    @State var from = ""
    @State var to = ""
    
    @State var searchTextOne = ""
    @State var searchTextTwo = ""
    @State var searchingOne = false
    @State var searchingTwo = false
    
    @State var whereId = "0"
        
    
    
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
                                Image(systemName: "magnifyingglass")
                                Text("Откуда")
                                //TextField("Откуда", text: $searchTextOne)
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
                            .foregroundColor(.gray)
                            .padding(.leading, 15)
                        }
                        .cornerRadius(13)
                    }
                    
                                        
                    // Список "Откуда"
                    if searchingOne == true
                    {
                        ForEach(content.object!.city, id: \.id)
                        { city in
                            ForEach(city.terminals.terminal.filter({ (terminal: Terminal) -> Bool in
                                return terminal.name.hasPrefix(searchTextOne) || searchTextOne == ""
                            }), id: \.id)
                            { terminal in
                                if terminal.receiveCargo == true
                                {
                                    Button(action: {
                                        searchTextOne = terminal.name
                                        searchingOne = false
                                        UIApplication.shared.dismissKeyboard()
                                        whereId = terminal.id
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
                                Image(systemName: "magnifyingglass")
                                Text("Куда")
    //                            TextField("Куда", text: $searchTextTwo)
    //                            { startedEditing in
    //                                if startedEditing
    //                                {
    //                                    withAnimation
    //                                    {
    //                                        searchingTwo = true
    //                                    }
    //                                }
    //                            }
    //                            onCommit:
    //                            {
    //                                withAnimation
    //                                {
    //                                    searchingTwo = false
    //                                }
    //                            }
                            }
                            .foregroundColor(.gray)
                            .padding(.leading, 15)
                        }
                        .cornerRadius(13)

                    }
                    
                                        
                    
                    // Список "Куда"
                    if searchingTwo == true
                    {
                        ForEach(content.object!.city, id: \.id)
                        { city in
                            ForEach(city.terminals.terminal.filter({ (terminal: Terminal) -> Bool in
                                return terminal.name.hasPrefix(searchTextTwo) || searchTextTwo == ""
                            }), id: \.id)
                            { terminal in
                                if (terminal.giveoutCargo == true) && (terminal.terminalDefault == true)
                                {
                                    Button(action: {
                                        searchTextTwo = terminal.name
                                        searchingTwo = false
                                        UIApplication.shared.dismissKeyboard()
                                        whereId = terminal.id
                                    }, label: {
                                        Text(terminal.name)
                                    })
                                }
                            }
                        }
                    }
                    
                    Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/, label: {
                        Text("Сохранить")
                            .foregroundColor(.blue)
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
