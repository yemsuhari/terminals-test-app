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
    let colors: [Color] = [.red, .green, .blue]
    
    @State var from = ""
    @State var to = ""
    
    @State var searchText = ""
    @State var searching = false
    
    @StateObject var content = ContentModel()
    
  
    var body: some View
    {
        NavigationView
        {
            VStack
            {
                // Поисковая строка
               
                
                List
                {
                    ZStack
                    {
                        Rectangle()
                            .foregroundColor(Color("White"))
                        HStack
                        {
                            Image(systemName: "magnifyingglass")
                            TextField("Откуда", text: $searchText)
                            { startedEditing in
                                if startedEditing
                                {
                                    withAnimation
                                    {
                                        searching = true
                                    }
                                }
                            }
                            onCommit:
                            {
                                withAnimation
                                {
                                    searching = false
                                }
                            }
                        }
                        .foregroundColor(.gray)
                        .padding(.leading, 15)
                    }
                    .frame(height: 30)
                    .cornerRadius(13)
                    
                    
                    if searching == true
                    {
                        ForEach(content.object!.city, id: \.id)
                        { city in
                            ForEach(city.terminals.terminal.filter({ (terminal: Terminal) -> Bool in
                                return terminal.name.hasPrefix(searchText) || searchText == ""
                            }), id: \.id)
                            { terminal in
                                Text(terminal.name)
                            }
                        }
                    }
                }
                
                Spacer()
                
                Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/, label: {
                    Text("Сохранить")
                        .foregroundColor(.blue)
                        .padding()

                })

                
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
