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
    
    @StateObject var content = ContentModel()
    
  
    var body: some View
    {
        NavigationView
        {
            VStack
            {
                Form
                {
                    Section
                    {
                        TextField("Откуда", text: $from)
                        List
                        {
                            ForEach(content.object!.city, id: \.id)
                            { city in
                                ForEach(city.terminals.terminal, id: \.id)
                                { terminal in
                                    Text(terminal.name)
                                }
                            }
                        }
                        TextField("Куда", text: $to)
                    }

                    Section
                    {
                        Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/, label: {
                            Text("Сохранить")
                        })
                        
                    }
                    
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
