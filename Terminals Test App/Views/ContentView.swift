//
//  ContentView.swift
//  Terminals Test App
//
//  Created by Fyodor Vladimirov on 26.07.2021.
//

import SwiftUI

struct ContentView: View
{
    @State var firstName = ""
    @State var lastName = ""
    
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
                        TextField("Откуда", text: $firstName)
                        TextField("Куда", text: $lastName)
                    }
                    
                    Section
                    {
                        Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/, label: {
                            Text("Сохранить")
                        })
                        
                    }
                    
                }
            }
            .navigationTitle("Terminals App")
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
