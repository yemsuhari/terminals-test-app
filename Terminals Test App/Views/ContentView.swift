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
    
    @StateObject var content = ContentModel()
    
    //let contentModelInstance = ContentModel()
    
    
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
                        TextField("Куда", text: $to)
                    }
                    
                    Section
                    {
                        Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/, label: {
                            Text("Сохранить")
                        })
                        
                    }
                    
                }
                
                
                Text("osas")
                    .padding(100)
                    
                
                
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
