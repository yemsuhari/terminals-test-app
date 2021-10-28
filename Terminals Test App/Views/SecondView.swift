//
//  SecondView.swift
//  Terminals Test App
//
//  Created by Fyodor Vladimirov on 25.10.2021.
//

import SwiftUI

struct SecondView: View
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
                    // "Откуда"
                    ZStack
                    {
                        Rectangle()
                            .foregroundColor(.white)
                        
                        HStack
                        {
                            Image(systemName: "magnifyingglass")
                            TextField("Откуда", text: $searchTextOne)
                            { startedEditing in
                                if startedEditing
                                {
                                    withAnimation
                                    {
                                        searchingOne = true
                                    }
                                }
                            }
                            onCommit:
                            {
                                withAnimation
                                {
                                    searchingOne = false
                                }
                            }
                        }
                        .foregroundColor(.gray)
                        .padding(.leading, 15)
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
                    
                    
                    // "Куда"
                    ZStack
                    {
                        Rectangle()
                            .foregroundColor(Color("White"))
                        HStack
                        {
                            Image(systemName: "magnifyingglass")
                            TextField("Куда", text: $searchTextTwo)
                            { startedEditing in
                                if startedEditing
                                {
                                    withAnimation
                                    {
                                        searchingTwo = true
                                    }
                                }
                            }
                            onCommit:
                            {
                                withAnimation
                                {
                                    searchingTwo = false
                                }
                            }

                        }
                        .foregroundColor(.gray)
                        .padding(.leading, 15)
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

                    
                }
            }
        }
    }
}

struct SecondView_Previews: PreviewProvider
{
    static var previews: some View
    {
        SecondView()
    }
}
